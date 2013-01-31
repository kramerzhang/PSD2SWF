package
{
	import flash.display.Sprite;
	import flash.system.ApplicationDomain;
	
	import game.component.Component;
	import game.component.List;
	import game.component.ListItemBase;
	import game.component.Panel;
	import game.skin.CompoundSkin;
	import game.skin.FriendPanelSkin;
	import game.skin.VIP2Skin;
	
	[SWF(width="800", height="600")]
	public class ComponentDemo extends Panel
	{
		private var _awardList:List;
		
		public function ComponentDemo()
		{
			Component.domain = ApplicationDomain.currentDomain;
			this.skin = VIP2Skin.skin;
		}
		
		protected override function configChildren():void
		{
			_awardList = getDescendant("shangbu/jiangpin") as List;
			_awardList.orientation = List.ORIENTATION_ROW;
			_awardList.columnCount = 3;
			for(var i:int = 0; i < 3; i++)
			{
				
				_awardList.addChild(new ListItemBase());
			}
		}
	}
}