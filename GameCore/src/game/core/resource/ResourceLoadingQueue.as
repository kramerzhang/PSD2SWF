package game.core.resource
{
	import flash.events.ErrorEvent;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.ProgressEvent;
	
	import game.core.core.IDisposable;
	import game.core.resource.item.ILoadable;
	import game.core.util.assert;
	
	[Event(name="progress", type = "flash.events.ProgressEvent")]
	[Event(name="error", type = "flash.events.ErrorEvent")]
	[Event(name="open", type = "flash.events.Event")]
	[Event(name="complete", type = "flash.events.Event")]
	public class ResourceLoadingQueue extends EventDispatcher implements IDisposable
	{
		private var _itemQueue:Vector.<ILoadable>;
		private var _isStart:Boolean;
		private var _itemTotalNum:int;
		private var _itemLoadedNum:int;
		private var _activeItem:ILoadable;
		
		public function ResourceLoadingQueue()
		{
			super(this);
			initialize();
		}
		
		private function initialize():void
		{
			_itemQueue = new Vector.<ILoadable>();
			_isStart = false;
		}
		
		public function addLoadableItem(item:ILoadable):void
		{
			assert(_isStart ==  false, "Can't add item after loading start");
			_itemQueue.push(item);
		}
		
		public function start():void
		{
			if(_isStart == true)return;
			assert(_itemQueue.length > 0, "no item in queue to load");
			_itemTotalNum = _itemQueue.length;
			_isStart = true;
			dispatchEvent(new Event(Event.OPEN));
			loadNextItem();
		}
		
		private function loadNextItem():void
		{
			_activeItem = _itemQueue.shift();
			addActiveItemEventListener(_activeItem);
			_activeItem.load();
		}
		
		private function addActiveItemEventListener(item:ILoadable):void
		{
			item.addEventListener(ErrorEvent.ERROR, onItemError);
			item.addEventListener(ProgressEvent.PROGRESS, onItemProgress);
			item.addEventListener(Event.COMPLETE, onItemComplete);
		}
		
		private function onItemError(evt:ErrorEvent):void
		{
			dispatchEvent(evt.clone());
		}
		
		private function onItemProgress(evt:ProgressEvent):void
		{
			if(hasEventListener(ProgressEvent.PROGRESS))
			{
				var bytesLoaded:Number = _itemLoadedNum/_itemTotalNum * 100 
					+ evt.bytesLoaded / evt.bytesTotal / _itemTotalNum * 100;
				var bytesTotal:Number = 100;
				var progressEvent:ProgressEvent = new ProgressEvent(ProgressEvent.PROGRESS, false, false, bytesLoaded, bytesTotal);
				dispatchEvent(progressEvent);
			}
		}
		
		private function onItemComplete(evt:Event):void
		{
			_itemLoadedNum++;
			removeActiveItemEventListener(_activeItem);
			_activeItem.recycle();
			if(_itemLoadedNum >= _itemTotalNum)
			{
				dispose();
				dispatchEvent(evt.clone());
			}
			else
			{
				loadNextItem();
			}
		}
		
		private function removeActiveItemEventListener(item:ILoadable):void
		{
			item.removeEventListener(ErrorEvent.ERROR, onItemError);
			item.removeEventListener(ProgressEvent.PROGRESS, onItemProgress);
			item.removeEventListener(Event.COMPLETE, onItemComplete);
		}
		
		public override function dispatchEvent(event:Event):Boolean
		{
			if(hasEventListener(event.type) == true)
			{
				return super.dispatchEvent(event);
			}
			return false;
		}
	
		public function dispose():void
		{
			_activeItem = null;
			_itemQueue = null;
		}
	}
}