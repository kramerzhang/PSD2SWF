package
{
	import comboBox.ComboBoxListItem;
	
	import flash.system.ApplicationDomain;
	
	import game.component.ComboBox;
	import game.component.Component;
	import game.component.Panel;
	import game.skin.ComboBoxSkin;
	
	[SWF(width="200", height="200")]
	public class ComboBoxTest extends Panel
	{
		private var _comboBox:ComboBox;
		private var _friendList:Array = [{label:"张三", data:"一"}, {label:"李四", data:"二"}, {label:"王五", data:"三"}, {label:"赵六", data:"四"}]
		
		public function ComboBoxTest()
		{
			Component.domain = ApplicationDomain.currentDomain;
			super(ComboBoxSkin.resource, ComboBoxSkin.skin);
		}
		
		protected override function configChildren():void
		{
			_comboBox = getChildByName("haoyou") as ComboBox;
			_comboBox.setListItemClass(ComboBoxListItem);
			_comboBox.setListData(_friendList);
		}
	}
}