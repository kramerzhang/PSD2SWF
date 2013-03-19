package game.core.resource.item
{
	/**
	 *@author Kramer(QQ:21524742)
	 */	
	import flash.system.LoaderContext;
	
	import game.core.pool.ObjectPoolManager;
	import game.core.resource.constant.ResourceType;
	
	public class ImageItem extends SwfItem
	{
		public function ImageItem()
		{
			super();
		}
		
		override public function get type():String
		{
			return ResourceType.IMGAE;
		}
		
		override public function recycle():void
		{
			ObjectPoolManager.getInstance().recycle(ImageItem, this);
		}
	}
}