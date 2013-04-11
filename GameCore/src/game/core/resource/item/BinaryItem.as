package game.core.resource.item
{
	/**
	 *@author Kramer(QQ:21524742)
	 */	
	import flash.events.ErrorEvent;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IOErrorEvent;
	import flash.events.ProgressEvent;
	import flash.events.SecurityErrorEvent;
	import flash.net.URLRequest;
	import flash.net.URLStream;
	
	import game.core.pool.IPoolableObject;
	import game.core.pool.ObjectPoolManager;
	import game.core.resource.constant.ResourceType;
	import game.core.resource.events.ResourceEvent;
	import game.core.resource.storage.FileStorage;

	[Event(name="progress", type = "flash.events.ProgressEvent")]
	[Event(name="error", type = "flash.events.ErrorEvent")]
	[Event(name="open", type = "flash.events.Event")]
	[Event(name="complete", type = "game.core.resource.events.ResourceEvent")]
	public class BinaryItem extends EventDispatcher implements ILoadable, IPoolableObject
	{
		
		private var _isLoading:Boolean;
		protected var _url:String;
		protected var _streamLoader:URLStream;
		
		protected var _content:ByteArrayWrapper;
		protected var _priority:int;
		protected var _isDuplicate:Boolean;
		
		protected var _startHandler:Function;
		protected var _progressHandler:Function;
		protected var _completeHandler:Function;
		protected var _errorHandler:Function;
		
		public function BinaryItem()
		{
			super(this);
			_streamLoader = new URLStream();
			addLoaderEventListener();
		}
		
		public function load():void
		{
			_content = FileStorage.getFile(_url) as ByteArrayWrapper;
			if(_content == null)
			{
				_streamLoader.load(new URLRequest(_url));
				_isLoading = true;
			}
			else
			{
				parseStream();
			}
		}
		
		private function addLoaderEventListener():void
		{
			_streamLoader.addEventListener(Event.OPEN, onLoadStart);
			_streamLoader.addEventListener(IOErrorEvent.IO_ERROR, onLoadError);
			_streamLoader.addEventListener(SecurityErrorEvent.SECURITY_ERROR, onLoadError);
			_streamLoader.addEventListener(ProgressEvent.PROGRESS, onLoadProgress);
			_streamLoader.addEventListener(Event.COMPLETE, onLoadComplete);
		}
		
		private function removeLoaderEventListener():void
		{
			_streamLoader.removeEventListener(Event.OPEN, onLoadStart);
			_streamLoader.removeEventListener(IOErrorEvent.IO_ERROR, onLoadError);
			_streamLoader.removeEventListener(SecurityErrorEvent.SECURITY_ERROR, onLoadError);
			_streamLoader.removeEventListener(ProgressEvent.PROGRESS, onLoadProgress);
			_streamLoader.removeEventListener(Event.COMPLETE, onLoadComplete);
		}
		
		private function onLoadStart(evt:Event):void
		{
			dispatchEvent(evt.clone());
		}
		
		private function onLoadError(evt:Event):void
		{
			dispatchEvent(new ErrorEvent(ErrorEvent.ERROR, false, false, "文件未找到"));
		}
		
		private function onLoadProgress(evt:ProgressEvent):void
		{
			dispatchEvent(evt.clone());
		}
		
		private function onLoadComplete(evt:Event):void
		{
			_isLoading = false;
			readContent();
			storeContent();
			parseStream();
		}
		
		private function readContent():void
		{
			_content = new ByteArrayWrapper();
			_streamLoader.readBytes(_content);
			_streamLoader.close();
		}
		
		private function storeContent():void
		{
			FileStorage.addFile(_url, _content);
		}
		
		protected function parseStream():void
		{
			dispatchEvent(new ResourceEvent(ResourceEvent.COMPLETE, _content));
		}
		
		public function set url(value:String):void
		{
			_url = value;
		}
		
		public function get url():String
		{
			return _url;
		}
		
		public function cloneContent(item:ILoadable):void
		{
			var binaryItem:BinaryItem = item as BinaryItem;
			var source:ByteArrayWrapper = binaryItem._content;
			var sourcePostion:int = source.position;
			source.position = 0;
			_content = new ByteArrayWrapper();
			source.readBytes(_content);
			source.position = sourcePostion;
			_content.resetCompressByExternal(source);
			dispatchEvent(new ResourceEvent(ResourceEvent.COMPLETE, _content));
		}
		
		public function get content():*
		{
			return _content;
		}
		
		public function set priority(value:int):void
		{
			_priority = value;
		}
		
		public function get priority():int
		{
			return _priority;
		}
		
		public function set isDuplicate(value:Boolean):void
		{
			_isDuplicate = value;
		}
		
		public function get isDuplicate():Boolean
		{
			return _isDuplicate;
		}
		
		public function get type():String
		{
			return ResourceType.BINARY;
		}
		
		public function cancel():Boolean
		{
			var result:Boolean = false;
			if(_streamLoader.connected && _isLoading == true)
			{
				_streamLoader.close();
				result = true;
			}
			return result;
		}
		
		public function set startHandler(value:Function):void
		{
			_startHandler = value;
		}
		
		public function get startHandler():Function
		{
			return _startHandler;
		}
		
		public function set progressHandler(value:Function):void
		{
			_progressHandler = value;
		}
		
		public function get progressHandler():Function
		{
			return _progressHandler;
		}
		
		public function set completeHandler(value:Function):void
		{
			_completeHandler = value;
		}
		
		public function get completeHandler():Function
		{
			return _completeHandler;
		}
		
		public function set errorHandler(value:Function):void
		{
			_errorHandler = value;
		}
		
		public function get errorHandler():Function
		{
			return _errorHandler;
		}
		
		public function checkin():void
		{
			removeLoaderEventListener();
			_content = null;
			_url = null;
			_priority = 0;
			_isDuplicate = false;
			_startHandler = null;
			_progressHandler = null;
			_completeHandler = null;
			_errorHandler = null;
		}
		
		public function checkout():void
		{
			addLoaderEventListener();
		}
		
		public function recycle():void
		{
			ObjectPoolManager.getInstance().recycle(BinaryItem, this);
		}
		
		public function dispose():void
		{
			removeLoaderEventListener();
			_content = null;
			_url = null;
			_priority = 0;
			_isDuplicate = false;
			_startHandler = null;
			_progressHandler = null;
			_completeHandler = null;
			_errorHandler = null;
			_streamLoader = null;
		}
	}
}
