package
{
	import flash.events.Event;
	import flash.system.ApplicationDomain;
	
	import game.component.Component;
	import game.component.Panel;
	import game.component.RadioButton;
	import game.skin.RadioButtonSkin;
	
	[SWF(width="200", height="200")]
	public class RadioButtonTest extends Panel
	{
		private var _radioBtn:RadioButton;
		
		public function RadioButtonTest()
		{
			Component.domain = ApplicationDomain.currentDomain;
			
			super(RadioButtonSkin.resource, RadioButtonSkin.skin);
		}
		
		protected override function configChildren():void
		{
			_radioBtn = getChildByName("jujuesiliao") as RadioButton;
			_radioBtn.addEventListener(Event.CHANGE, onChange);
		}
		
		private function onChange(evt:Event):void
		{
			trace(_radioBtn.selected);
		}
	}
}