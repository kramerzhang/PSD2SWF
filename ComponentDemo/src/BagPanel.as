package
{
	import com.demonsters.debugger.MonsterDebugger;
	
	import flash.system.ApplicationDomain;
	
	import game.component.ComboBox;
	import game.component.Component;
	import game.component.Image;
	import game.component.Panel;
	import game.skin.BagPanelSkin;
	
	[SWF(width="600", height="500")]
	public class BagPanel extends Panel
	{
		public function BagPanel()
		{
			MonsterDebugger.initialize(this);
			Component.domain = ApplicationDomain.currentDomain;
			this.skin = BagPanelSkin.skin;
		}
		
		protected override function configChildren():void
		{
			
		}
	}
}