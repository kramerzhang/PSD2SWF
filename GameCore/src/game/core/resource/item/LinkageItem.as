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
		
		private var _itemClz:Class;
		private var _link:String;
		
		public function LinkageItem(link:String)
		{
			super();
			_link = link;
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
				if(_appDomain && _appDomain.hasDefinition(_link))
				{
					_itemClz = _appDomain.getDefinition(_link) as Class;
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