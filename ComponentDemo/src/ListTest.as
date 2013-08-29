package
{
	import flash.system.ApplicationDomain;
	
	import game.component.Component;
	import game.component.List;
	import game.component.Panel;
	import game.skin.ListSkin;
	
	import list.ListItem;
	
	[SWF(width="300", height="400")]
	public class ListTest extends Panel
	{
		private var _list:List;
		private var _friendList:Array = [{label:"张三", data:"一"}, {label:"李四", data:"二"}, {label:"王五", data:"三"}, {label:"赵六", data:"四"}, {label:"张三", data:"一"}, {label:"李四", data:"二"}, {label:"王五", data:"三"}, {label:"赵六", data:"四"}];
			
		public function ListTest()
		{
			Component.domain = ApplicationDomain.currentDomain;
			super(ListSkin.resource, ListSkin.skin);
		}
		
		protected override function configChildren():void
		{
			_list = getChildByName("haoyouliebiao") as List;
			
			var len:int = _friendList.length;
			for(var i:int = 0; i < len; i++)
			{
				var item:ListItem = new ListItem();
				_list.addChild(item);
				item.data = _friendList[i];
			}
		}
	}
}