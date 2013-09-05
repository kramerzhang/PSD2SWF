package game.core.resource
{
	import flash.display.BitmapData;
	import flash.utils.getTimer;
	
	import game.core.util.HashMap;

	public class BitmapDataCacheManager
	{
		private static var _bitmapDataMap:HashMap = new HashMap();
		
		public static function getBitmapData(url:String):BitmapData
		{
			var bitmapDataWrapper:BitmapDataWrapper = _bitmapDataMap.get(url) as BitmapDataWrapper;
			if(bitmapDataWrapper == null)
			{
				bitmapDataWrapper = new BitmapDataWrapper(url);
				_bitmapDataMap.put(bitmapDataWrapper.url, bitmapDataWrapper);
			}
			bitmapDataWrapper.referenceCount += 1;
			return bitmapDataWrapper.bitmapData;
		}
		
		public static function putBitmapData(url:String, bitmapData:BitmapData):void
		{
			var bitmapDataWrapper:BitmapDataWrapper = _bitmapDataMap.get(url) as BitmapDataWrapper;
			if(bitmapDataWrapper == null)
			{
				bitmapDataWrapper = new BitmapDataWrapper(url);
				_bitmapDataMap.put(url, bitmapDataWrapper);
			}
			bitmapDataWrapper.bitmapData = bitmapData;
		}
		
		public static function releaseBitmapData(url:String):void
		{
			var bitmapDataWrapper:BitmapDataWrapper = _bitmapDataMap.get(url) as BitmapDataWrapper;
			if(bitmapDataWrapper == null)
			{
				return;
			}
			if(bitmapDataWrapper.referenceCount > 0)
			{
				bitmapDataWrapper.referenceCount -= 1;
			}
			releaseResource(bitmapDataWrapper);
		}
		
		private static function releaseResource(bitmapDataWrapper:BitmapDataWrapper, force:Boolean = false):void
		{
			if(bitmapDataWrapper.referenceCount <= 0 || force)
			{
				_bitmapDataMap.remove(bitmapDataWrapper.url);
				bitmapDataWrapper.dispose();
			}
		}
		
		public static function dispose(force:Boolean = false):void
		{
			var imageWrapperList:Array = _bitmapDataMap.getValues();
			for each(var imageWrapper:BitmapDataWrapper in imageWrapperList)
			{
				releaseResource(imageWrapper, force);
			}
		}
	}
}
import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.utils.getTimer;

class BitmapDataWrapper
{
	public var url:String;
	public var bitmapData:BitmapData;
	public var referenceCount:int;
	
	public function BitmapDataWrapper(url:String)
	{	
		this.url = url;
		referenceCount = 0;
		bitmapData = null;
	}
	
	public function dispose():void
	{
		bitmapData = null;
		referenceCount = 0;
	}
}
	