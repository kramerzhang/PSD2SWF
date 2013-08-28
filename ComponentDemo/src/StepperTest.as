package
{
	import flash.events.Event;
	import flash.system.ApplicationDomain;
	
	import game.component.Component;
	import game.component.Panel;
	import game.component.Stepper;
	import game.skin.StepperSkin;
	
	[SWF(width="200", height="200")]
	public class StepperTest extends Panel
	{
		private var _stepper:Stepper;
		
		public function StepperTest()
		{
			Component.domain = ApplicationDomain.currentDomain;
			super(StepperSkin.resource, StepperSkin.skin);
		}
		
		protected override function configChildren():void
		{
			_stepper = getChildByName("page") as Stepper;
			
			_stepper.addEventListener(Event.CHANGE, onChange);
		}
		
		private function onChange(evt:Event):void
		{
			trace(_stepper.value);
		}
	}
}