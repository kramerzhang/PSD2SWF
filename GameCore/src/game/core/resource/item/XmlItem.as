package game.core.resource.item
{
	/**
	 *@author Kramer(QQ:21524742)
	 */	
	import game.core.pool.ObjectPoolManager;
	import game.core.resource.constant.ResourceType;
	import game.core.resource.events.ResourceEvent;
	
	public class XmlItem extends BinaryItem implements ILoadable
	{
		private var _xml:XML;
		
		public function XmlItem()
		{
			super();
		}
		
		override protected function parseStream():void
		{
			_xml = XML(_content.readUTFBytes(_content.bytesAvailable));
			dispatchEvent(new ResourceEvent(ResourceEvent.COMPLETE, _xml));
		}
		
		override public function cloneContent(item:ILoadable):void
		{
			var xmlItem:XmlItem = item as XmlItem;
			var source:ByteArrayWrapper = xmlItem._content;
			_content = source;
			var sourcePosition:int = source.position;
			source.position = 0;
			_xml = XML(xmlItem._content.readUTFBytes(_content.bytesAvailable));
			source.position = sourcePosition;
			dispatchEvent(new ResourceEvent(ResourceEvent.COMPLETE, _xml));
		}
		
		override public function get content():*
		{
			return _xml;
		}
		
		override public function get type():String
		{
			return ResourceType.XML;
		}
		
		override public function dispose():void
		{
			_xml = null;
			super.dispose();
		}
	}
}