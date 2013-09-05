package game.core.resource.item
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Loader;
	import flash.events.ErrorEvent;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.system.ApplicationDomain;
	import flash.system.LoaderContext;
	import flash.utils.ByteArray;
	
	import game.core.pool.ObjectPoolManager;
	import game.core.resource.constant.ResourceType;
	import game.core.resource.events.ResourceEvent;
	
	public class BitmapDataPackItem extends BinaryItem
	{
		protected var _loader:Loader;
		protected var _loaderContext:LoaderContext;
		//同一个包中的资源放在同一个子域中
		protected var _appDomain:ApplicationDomain;
		private var _bitmapDataList:Vector.<BitmapData>;
	
		
		public function BitmapDataPackItem()
		{
			super();
			_loader = new Loader();
			addLoaderInfoEventListener();
			initLoaderContext();
			initBitmapDataList();
		}
		
		private function initLoaderContext():void
		{
			_appDomain = new ApplicationDomain(ApplicationDomain.currentDomain);
			_loaderContext = new LoaderContext(false, _appDomain);
		}
		
		private function initBitmapDataList():void
		{
			_bitmapDataList = new Vector.<BitmapData>();
		}
		
		override protected function parseStream():void
		{
			readBitmapData(_content);
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
		
		private function onInternalLoadComplete(evt:Event):void
		{
			_bitmapDataList.push((_loader.content as Bitmap).bitmapData);
			readBitmapData(_content);
		}
		
		private function onInternalLoadError(evt:IOErrorEvent):void
		{
			dispatchEvent(new ErrorEvent(ErrorEvent.ERROR, false, false, "图像打包文件格式错误"));
		}
		
		private function readBitmapData(data:ByteArray):void
		{
			if(data.bytesAvailable > 0)
			{
				var fileLen:int = data.readUnsignedInt();
				var byteArr:ByteArray = new ByteArray();
				_content.readBytes(byteArr, 0, fileLen);
				_loader.loadBytes(byteArr, _loaderContext);
			}
			else
			{
				dispatchEvent(new ResourceEvent(ResourceEvent.COMPLETE, this.content));
			}
		}
		
		override public function cloneContent(item:ILoadable):void
		{
			var bitmapDataPackItem:BitmapDataPackItem = item as BitmapDataPackItem;
			_bitmapDataList = bitmapDataPackItem._bitmapDataList;
		}
		
		override public function get content():*
		{
			return _bitmapDataList;
		}
		
		override public function get type():String
		{
			return ResourceType.BITMAP_DATA_PACK;
		}
		
		override public function checkout():void
		{
			super.checkout();
			addLoaderInfoEventListener();
			initLoaderContext();
			initBitmapDataList();
		}
		
		override public function checkin():void
		{
			removeLoaderInfoEventListener();
			_appDomain = null;
			_loaderContext = null;
			_bitmapDataList = null;
			super.checkin();
		}
		
		override public function recycle():void
		{
			ObjectPoolManager.getInstance().recycle(BitmapDataPackItem, this);
		}
		
		override public function dispose():void
		{
			removeLoaderInfoEventListener();
			_appDomain = null;
			_loaderContext = null;
			_bitmapDataList = null;
			_loader = null;
			super.dispose();
		}
	}
}