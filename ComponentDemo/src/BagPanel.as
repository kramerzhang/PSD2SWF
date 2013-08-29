package
{
	import com.demonsters.debugger.MonsterDebugger;
	
	import flash.events.MouseEvent;
	import flash.system.ApplicationDomain;
	import flash.utils.getTimer;
	
	import game.component.Button;
	import game.component.ComboBox;
	import game.component.Component;
	import game.component.Image;
	import game.component.Panel;
	import game.component.RadioButton;
	import game.component.RadioButtonGroup;
	import game.component.ScaleImage;
	import game.skin.BagPanelSkin;
	
	[SWF(width="600", height="500")]
	public class BagPanel extends Panel
	{
		private var _pageList:RadioButtonGroup;
		private var _closeBtn:Button;
		private var _inputBoundary:ScaleImage;
		
		
		public function BagPanel()
		{
			Component.domain = ApplicationDomain.currentDomain;
			
			super(BagPanelSkin.resource, BagPanelSkin.skin);
		}
		
	}
}