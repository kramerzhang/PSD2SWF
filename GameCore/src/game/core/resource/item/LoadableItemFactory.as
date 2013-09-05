package game.core.resource.item
{
	import game.core.pool.ObjectPoolManager;
	import game.core.resource.constant.ResourceType;

	public class LoadableItemFactory
	{
		private static var _objectPoolManager:ObjectPoolManager;
		
		public function LoadableItemFactory(blocker:Blocker)
		{
		}
		
		initialize();
		
		private static function initialize():void
		{
			_objectPoolManager = ObjectPoolManager.getInstance();
		}
		
		public static function createItem(type:String, url:String):ILoadable
		{
			switch(type)
			{
				case ResourceType.BINARY:
					var binaryItem:BinaryItem = _objectPoolManager.getObject(BinaryItem) as BinaryItem;
					binaryItem.url = url;
					return binaryItem;
				case ResourceType.LINKAGE:
					var linkageItem:LinkageItem = _objectPoolManager.getObject(LinkageItem) as LinkageItem;
					linkageItem.url = url;
					return linkageItem;
				case ResourceType.SOUND:
					var soundItem:SoundItem = _objectPoolManager.getObject(SoundItem) as SoundItem;
					soundItem.url = url;
					return soundItem;
				case ResourceType.XML:
					var xmlItem:XmlItem = _objectPoolManager.getObject(XmlItem) as XmlItem;
					xmlItem.url = url;
					return xmlItem;
				case ResourceType.SWF:
					var swfItem:SwfItem = _objectPoolManager.getObject(SwfItem) as SwfItem; 
					swfItem.url = url;
					return swfItem;
				case ResourceType.BITMAP_DATA_PACK:
					var bitmapPackItem:BitmapDataPackItem = _objectPoolManager.getObject(BitmapDataPackItem) as BitmapDataPackItem;
					return bitmapPackItem;
			}
			return null;
		}
	}
}
class Blocker{}