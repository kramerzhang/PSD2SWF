package
{
	import flash.system.ApplicationDomain;
	
	import game.component.Component;
	import game.component.Panel;
	import game.skin.MainMenuPanelSkin;
	
	[SWF(width="900", height="200")]
	public class MainMenuPanel extends Panel
	{
		public function MainMenuPanel()
		{
			Component.domain = ApplicationDomain.currentDomain;
			super(MainMenuPanelSkin.resource, MainMenuPanelSkin.skin);
		}
		
		override protected function configChildren():void
		{
			
		}
		
	}
}