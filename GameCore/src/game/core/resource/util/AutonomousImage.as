package game.core.resource.util
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.system.ApplicationDomain;
	
	import game.core.resource.BitmapDataCacheManager;
	import game.core.resource.ResourceManager;
	import game.core.resource.events.ResourceEvent;
	import game.core.resource.item.SwfItem;
	
	public class AutonomousImage extends Bitmap
	{
		private var _url:String;
		
		public function AutonomousImage(url:String = null)
		{
			super(null, "auto", false);
			this.url = url;
		}
		
		public function set url(value:String):void
		{
			if(_url && _url != value)
			{
				BitmapDataCacheManager.releaseBitmapData(_url);
			}
			_url = value;
			if(_url == null)
			{
				this.bitmapData = null;
				return;
			}
			this.bitmapData = BitmapDataCacheManager.getBitmapData(_url);
			if(this.bitmapData == null)
			{
				ResourceManager.loadSwf(_url, onSwfLoaded);
			}
		}
		
		private function onSwfLoaded(evt:ResourceEvent):void
		{
			var swfItem:SwfItem = evt.currentTarget as SwfItem;
			var domain:ApplicationDomain = swfItem.appDomain;
			this.bitmapData = new (domain.getDefinition("Image") as Class) as BitmapData;
			BitmapDataCacheManager.putBitmapData(swfItem.url, this.bitmapData);
		}
		
		public function get url():String
		{
			return _url;
		}
		
	}
}