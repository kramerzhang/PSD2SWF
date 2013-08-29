package
{
	import flash.events.Event;
	import flash.system.ApplicationDomain;
	
	import game.component.Component;
	import game.component.Panel;
	import game.component.RadioButtonGroup;
	import game.skin.RadioButtonGroupSkin;
	
	[SWF(width="300", height="200")]
	public class RadioButtonGroupTest extends Panel
	{
		private var _tab:RadioButtonGroup;
		
		public function RadioButtonGroupTest()
		{
			Component.domain = ApplicationDomain.currentDomain;
			super(RadioButtonGroupSkin.resource, RadioButtonGroupSkin.skin);
		}
		
		protected override function configChildren():void
		{
			_tab = getChildByName("tabs") as RadioButtonGroup;
			
			_tab.addEventListener(Event.CHANGE, onTabChange);
		}
		
		private function onTabChange(evt:Event):void
		{
			trace(_tab.selectIndex);
		}
	}
}