package game.core.resource.item
{
	/**
	 *@author Kramer(QQ:21524742)
	 */	
	import flash.display.Loader;
	import flash.events.ErrorEvent;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.system.ApplicationDomain;
	import flash.system.LoaderContext;
	
	import game.core.pool.ObjectPoolManager;
	import game.core.resource.constant.ResourceType;
	import game.core.resource.events.ResourceEvent;
	
	public class SwfItem extends BinaryItem implements ILoadable
	{
		protected var _loader:Loader;
		protected var _loaderContext:LoaderContext;
		protected var _appDomain:ApplicationDomain;
		
		public function SwfItem()
		{
			super();
			_loader = new Loader();
			addLoaderInfoEventListener();
		}
		
		public function set loaderContext(value:LoaderContext):void
		{
			_loaderContext = value;
		}
		
		override protected function parseStream():void
		{
			_loader.loadBytes(_content, _loaderContext);
		}
		
		private function onInternalLoadComplete(evt:Event):void
		{
			_appDomain = _loader.contentLoaderInfo.applicationDomain;
			dispatchEvent(new ResourceEvent(ResourceEvent.COMPLETE, this.content));
		}
		
		private function onInternalLoadError(evt:IOErrorEvent):void
		{
			dispatchEvent(new ErrorEvent(ErrorEvent.ERROR, false, false, "SWF文件格式错误"));
		}
		
		private function addLoaderInfoEventListener():void
		{
			_loader.contentLoaderInfo.addEventListener(Event.COMPLETE, onInternalLoadComplete);
			_loader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, onInternalLoadError);
		}
		
		private function removeLoaderInfoEventListener():void
		{
			_loader.contentLoaderInfo.removeEventListener(Event.COMPLETE, onInternalLoadComplete);
			_loader.contentLoaderInfo.removeEventListener(IOErrorEvent.IO_ERROR, onInternalLoadError);
		}
		
		override public function cloneContent(item:ILoadable):void
		{
			var swfItem:SwfItem  = item as SwfItem;
			_content = swfItem._content;
			parseStream();
		}
		
		override public function get content():*
		{
			return _loader.contentLoaderInfo.content;
		}
		
		public function get appDomain():ApplicationDomain
		{
			return _appDomain;
		}
		
		override public function get type():String
		{
			return ResourceType.SWF;
		}
		
		override public function checkout():void
		{
			super.checkout();
			addLoaderInfoEventListener();
		}
		
		override public function checkin():void
		{
			removeLoaderInfoEventListener();
			_appDomain = null;
			_loaderContext = null;
			super.checkin();
		}
		
		override public function recycle():void
		{
			ObjectPoolManager.getInstance().recycle(SwfItem, this);
		}
		
		override public function dispose():void
		{
			removeLoaderInfoEventListener();
			_appDomain = null;
			_loaderContext = null;
			_loader = null;
			super.dispose();
		}
	}
}