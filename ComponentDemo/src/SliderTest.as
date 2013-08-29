package
{
	import flash.events.Event;
	import flash.system.ApplicationDomain;
	
	import game.component.Component;
	import game.component.Panel;
	import game.component.Slider;
	import game.skin.SliderSkin;
	
	[SWF(width="200", height="200")]
	public class SliderTest extends Panel
	{
		private var _slider:Slider;
		public function SliderTest()
		{
			Component.domain = ApplicationDomain.currentDomain;
			super(SliderSkin.resource, SliderSkin.skin);
		}
		
		protected override function configChildren():void
		{
			_slider = getChildByName("yinxiao") as Slider;
			_slider.boundOffset = 5;
			
			_slider.addEventListener(Event.CHANGE, onChange);
		}
		
		private function onChange(evt:Event):void
		{
			trace(_slider.value);
		}
	}
}