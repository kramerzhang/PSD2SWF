package game.core.resource
{
	/**
	 *@author Kramer(QQ:21524742)
	 */	
	
	import flash.events.ErrorEvent;
	import flash.events.Event;
	import flash.events.ProgressEvent;
	
	import game.core.log.LogLevel;
	import game.core.log.Logger;
	import game.core.pool.ObjectPoolManager;
	import game.core.resource.events.ResourceEvent;
	import game.core.resource.item.ILoadable;
	import game.core.util.HashMap;
	
	public class LoadingManager
	{
		private static const PARALLEL_MAX_NUM:int = 1;
		
		private static var _waitList:Vector.<ILoadable>;
		private static var _duplicateMap:HashMap;
		private static var _loadingMap:HashMap;
		private static var _logger:Logger;
		private static var _objectPoolManager:ObjectPoolManager;
		
		public function LoadingManager(blocker:Blocker)
		{
		}
		
		initialize();
		private static function initialize():void
		{
			_waitList = new Vector.<ILoadable>();
			_loadingMap = new HashMap();
			_duplicateMap = new HashMap();
			_objectPoolManager = ObjectPoolManager.getInstance();
			_logger = Logger.getLogger("LoadingManager");
			_logger.setLevel(LogLevel.ERROR);
		}
		
		public static function addItem(item:ILoadable):void
		{
			if(checkDuplication(item) == false)
			{
				_logger.info(item.url + " 加入下载队列");
				_waitList.push(item);
				loadNextItem();
			}
			else
			{
				var itemVec:Vector.<ILoadable> = _duplicateMap.get(item.url);
				if(itemVec == null)
				{
					itemVec = new Vector.<ILoadable>();
					_duplicateMap.put(item.url, itemVec);
				}
				item.isDuplicate = true;
				addItemEventListener(item);
				itemVec.push(item);
			}
		}
		
		private static function checkDuplication(item:ILoadable):Boolean
		{
			if(checkWaitList(item))
			{
				return true;
			}
			if(checkLoadingMap(item))
			{
				return true;
			}
			return false;
		}
		
		private static function checkWaitList(item:ILoadable):Boolean
		{
			for each(var existItem:ILoadable in _waitList)
			{
				if(existItem.url == item.url)
				{
					return true;
				}
			}
			return false;
		}
		
		private static function checkLoadingMap(item:ILoadable):Boolean
		{
			if(_loadingMap.get(item.url) != null)
			{
				return true;
			}
			return false;
		}
		
		private static function loadNextItem():void
		{
			if(_loadingMap.length >= PARALLEL_MAX_NUM)
			{
				return;
			}
			if(_waitList.length != 0)
			{
				_waitList.sort(sortItemByPriority);
				var item:ILoadable = _waitList.shift(); 
				_loadingMap.put(item.url, item);
				loadItem(item);
			}
		}
		
		private static function sortItemByPriority(a:ILoadable, b:ILoadable):int
		{
			if(a.priority > b.priority)
			{
				return 1;
			}
			if(a.priority < b.priority)
			{
				return -1
			}
			return 0;
		}
		
		private static function loadItem(item:ILoadable):void
		{
			_logger.info(item.url + " 开始下载");
			addItemEventListener(item);
			item.load();
		}
		
		private static function addItemEventListener(item:ILoadable):void
		{
			item.addEventListener(Event.OPEN, onLoadStart);
			item.addEventListener(ErrorEvent.ERROR, onLoadError);
			item.addEventListener(ProgressEvent.PROGRESS, onLoadProgress);
			item.addEventListener(ResourceEvent.COMPLETE, onLoadComplete);
		}
		
		private static function removeItemEventListener(item:ILoadable):void
		{
			item.removeEventListener(Event.OPEN, onLoadStart);
			item.removeEventListener(ErrorEvent.ERROR, onLoadError);
			item.removeEventListener(ProgressEvent.PROGRESS, onLoadProgress);
			item.removeEventListener(ResourceEvent.COMPLETE, onLoadComplete);
		}
		
		private static function onLoadStart(evt:Event):void
		{
			var item:ILoadable = evt.target as ILoadable;
			if(item.startHandler != null)
			{
				item.startHandler(evt);
			}
			applyEventOnDuplicate(item, evt);
		}
		
		private static function onLoadProgress(evt:ProgressEvent):void
		{
			var item:ILoadable = evt.target as ILoadable;
			if(item.progressHandler != null)
			{
				item.progressHandler(evt);
			}
			applyEventOnDuplicate(item, evt);
		}
		
		private static function onLoadComplete(evt:ResourceEvent):void
		{
			var item:ILoadable = evt.target as ILoadable;
			_logger.info(item.url + " 下载完成");
			removeItemEventListener(item);
			if(item.completeHandler != null)
			{
				item.completeHandler(evt);
			}
			applyEventOnDuplicate(item, evt);
			if(item.isDuplicate == false)
			{
				removeItemFromloadingMap(item);
				loadNextItem();
			}
			recycleItem(item);
		}
		
		private static function onLoadError(evt:ErrorEvent):void
		{
			var item:ILoadable = evt.target as ILoadable;
			_logger.error(item.url + " " + evt.text);
			removeItemEventListener(item);
			if(item.errorHandler != null)
			{
				item.errorHandler(evt);
			}
			
			applyEventOnDuplicate(item, evt);
			if(item.isDuplicate == false)
			{
				removeItemFromloadingMap(item);
				loadNextItem();
			}
			recycleItem(item);
		}
		
		private static function removeItemFromloadingMap(item:ILoadable):void
		{
			_loadingMap.remove(item.url);
		}
		
		private static function recycleItem(item:ILoadable):void
		{
			item.recycle();
		}
		
		private static function applyEventOnDuplicate(item:ILoadable, evt:Event):void
		{
			if(item.isDuplicate == true)
			{
				return;
			}
			var evtType:String = evt.type;
			var itemVec:Vector.<ILoadable> = _duplicateMap.get(item.url);
			if(itemVec != null)
			{
				for each(var duplicateItem:ILoadable in itemVec)
				{
					if(evtType == ResourceEvent.COMPLETE)
					{
						duplicateItem.cloneContent(evt.target as ILoadable);
					}
					else
					{
						duplicateItem.dispatchEvent(evt.clone());
					}
				}
			}
			if(evtType == ErrorEvent.ERROR || evtType == ResourceEvent.COMPLETE)
			{
				_duplicateMap.remove(item.url);
			}
		}
		
		public static function cancelAll():void
		{
			_waitList.length = 0;
			_duplicateMap.clear();
			var loadingItemArr:Array = _loadingMap.getValues();
			for each(var item:ILoadable in loadingItemArr)
			{
				var result:Boolean = item.cancel();
				if(result == true)
				{
					_loadingMap.remove(item.url);
				}
			}
			_logger.info("清空下载队列，并停止正在加载项");
		}
		
		public static function cancel(url:String, completeHandler:Function):void
		{
			var isCancelInQueue:Boolean = cancelInWaitList(url, completeHandler);
			var isCancelInLoadingMap:Boolean = cancelInLoadingMap(url, completeHandler);
			loadFirstDuplicateItem(url);
		}
		
		private static function loadFirstDuplicateItem(url:String):void
		{
			var itemVec:Vector.<ILoadable> = _duplicateMap.get(url);
			if(itemVec != null && itemVec.length > 0)
			{
				addItem(itemVec[0]);
			}
		}
		
		private static function cancelInWaitList(url:String, completeHandler:Function):Boolean
		{
			var len:int = _waitList.length;
			for(var i:int = 0; i <len; i++)
			{
				var item:ILoadable = _waitList[i];
				if(item.url == url && item.completeHandler == completeHandler)
				{
					_waitList.splice(i, 1);
					_logger.info("下载队列中" + item.url + "取消");
					return true;
				}
			}
			return false;
		}
		
		private static function cancelInLoadingMap(url:String, completeHandler:Function):Boolean
		{
			var item:ILoadable = _loadingMap.get(url);
			if(item != null && item.completeHandler == completeHandler)
			{
				var result:Boolean = item.cancel();
				if(result == true)
				{
					_loadingMap.remove(url);
					_logger.info("正在下载队列中" + url + "取消");
					return true;
				}
			}
			return false;
		}
	}
}
class Blocker{}