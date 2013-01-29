package
{
	import flash.display.Sprite;
	import flash.system.ApplicationDomain;
	
	import game.component.Component;
	import game.component.Panel;
	import game.skin.CompoundSkin;
	import game.skin.FriendPanelSkin;
	
	[SWF(width="800", height="600")]
	public class ComponentDemo extends Panel
	{
		public function ComponentDemo()
		{
			Component.domain = ApplicationDomain.currentDomain;
			this.skin = CompoundSkin.skin;
		}
	}
}