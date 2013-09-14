package game.core.resource
{
	/**
	 *@author Kramer(QQ:21524742)
	 */	
	import flash.media.Sound;
	import flash.system.ApplicationDomain;
	import flash.system.LoaderContext;
	
	import game.core.pool.ObjectPoolManager;
	import game.core.resource.constant.ResourcePriority;
	import game.core.resource.item.BinaryItem;
	import game.core.resource.item.BitmapDataPackItem;
	import game.core.resource.item.ILoadable;
	import game.core.resource.item.ImageItem;
	import game.core.resource.item.LinkageItem;
	import game.core.resource.item.SoundItem;
	import game.core.resource.item.SwfItem;
	import game.core.resource.item.XmlItem;
	

	public class ResourceManager
	{
		
		public function ResourceManager(blocker:Blocker)
		{
		}
		
		public static function loadXml(url:String, 
									   completeHandler:Function,
									   priority:int = ResourcePriority.LOW,
									   errHandler:Function = null, 
									   startHandler:Function = null, 
									   progressHandler:Function = null):void 
		{
			var xmlItem:XmlItem = new XmlItem();
			addItemToLoadingQueue(xmlItem, url, completeHandler, startHandler, progressHandler, errHandler, priority);
		}
		
		public static function loadSwf(url:String, 
									   completeHandler:Function, 
									   priority:int = ResourcePriority.LOW,
									   errHandler:Function = null, 
									   startHandler:Function = null, 
									   progressHandler:Function = null,
									   applicationDomain:ApplicationDomain = null):void
		{
			var loaderContext:LoaderContext = new LoaderContext(false, applicationDomain);
			var swfItem:SwfItem = new SwfItem();
			swfItem.loaderContext = loaderContext;
			addItemToLoadingQueue(swfItem, url, completeHandler, startHandler, progressHandler, errHandler, priority);
		}
		
		public static function loadLinkage(url:String, 
										   completeHandler:Function, 
										   link:String,
										   priority:int = ResourcePriority.LOW,
										   errHandler:Function = null, 
										   startHandler:Function = null, 
										   progressHandler:Function = null):void
		{
			var linkageItem:LinkageItem = new LinkageItem(link);
			addItemToLoadingQueue(linkageItem, url, completeHandler, startHandler, progressHandler, errHandler, priority);
		}
		
		public static function loadImage(url:String, 
										 completeHandler:Function, 
										 priority:int = ResourcePriority.LOW,
										 errHandler:Function = null, 
										 startHandler:Function = null, 
										 progressHandler:Function = null):void
		{
			var imageItem:ImageItem = new ImageItem();
			addItemToLoadingQueue(imageItem, url, completeHandler, startHandler, progressHandler, errHandler, priority);
		}
		
		public static function loadBitmapDataPack(url:String,
												  completeHandler:Function, 
												  priority:int = ResourcePriority.LOW,
												  errHandler:Function = null, 
												  startHandler:Function = null, 
												  progressHandler:Function = null):void
		{
			var packItem:BitmapDataPackItem = new BitmapDataPackItem();
			addItemToLoadingQueue(packItem, url, completeHandler, startHandler, progressHandler, errHandler, priority);
		}
		
		public static function loadBinary(url:String, 
										  completeHandler:Function, 
										  priority:int = ResourcePriority.LOW,
										  errHandler:Function = null, 
										  startHandler:Function = null, 
										  progressHandler:Function = null):void
		{
			var binaryItem:BinaryItem = new BinaryItem();
			addItemToLoadingQueue(binaryItem, url, completeHandler, startHandler, progressHandler, errHandler, priority);
		}
		
		private static function addItemToLoadingQueue(item:ILoadable,
													  url:String,
													  completeHandler:Function,
													  startHandler:Function = null,
													  progressHandler:Function = null,
													  errHandler:Function = null, 
													  priority:int = ResourcePriority.LOW):void
		{
			item.url = url;
			item.startHandler = startHandler;
			item.progressHandler = progressHandler;
			item.completeHandler = completeHandler;
			item.errorHandler = errHandler;
			item.priority = priority;
			LoadingManager.addItem(item);
		}
		
		public static function loadSound(url:String, 
										 completeHandler:Function, 
										 priority:int = ResourcePriority.LOW,
										 errHandler:Function = null, 
										 startHandler:Function = null, 
										 progressHandler:Function = null):Sound
		{
			var soundItem:SoundItem = new SoundItem();
			addItemToLoadingQueue(soundItem, url, completeHandler, startHandler, progressHandler, errHandler, priority);
			return soundItem.content() as Sound;
		}
		
		public static function cancel(url:String, completeHandler:Function):void
		{
			LoadingManager.cancel(url, completeHandler);
		}
		
		public static function cancelAll():void
		{
			LoadingManager.cancelAll();
		}
	}
}

class Blocker{}