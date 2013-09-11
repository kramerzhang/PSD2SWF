package game.core.resource.item
{
	/**
	 *@author Kramer(QQ:21524742)
	 */	
	import flash.display.DisplayObject;
	
	import game.core.pool.ObjectPoolManager;
	import game.core.resource.constant.ResourceType;
	import game.core.resource.events.ResourceEvent;
	
	public class LinkageItem extends SwfItem
	{
		private static const LINK:String = "Image";
		
		private var _itemClz:Class;
		
		public function LinkageItem()
		{
			super();
		}
		
		override public function cloneContent(item:ILoadable):void
		{
			var linkageItem:LinkageItem = item as LinkageItem;
			_itemClz = linkageItem._itemClz;
			dispatchEvent(new ResourceEvent(ResourceEvent.COMPLETE, this.content));	
		}
		
		override public function get content():*
		{
			var item:DisplayObject;
			if(_itemClz == null)
			{
				if(_appDomain && _appDomain.hasDefinition(LINK))
				{
					_itemClz = _appDomain.getDefinition(LINK) as Class;
				}
			}
			item =  new _itemClz();
			return item;
		}
		
		override public function get type():String
		{
			return ResourceType.LINKAGE;
		}
		
		override public function dispose():void
		{
			_itemClz = null;
			super.dispose();
		}
	}
}