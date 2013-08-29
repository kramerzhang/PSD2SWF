package
{
	import flash.events.MouseEvent;
	import flash.system.ApplicationDomain;
	
	import game.component.Button;
	import game.component.Component;
	import game.component.Panel;
	import game.skin.ButtonSkin;
	
	[SWF(width="200", height="200")]
	public class ButtonTest extends Panel
	{
		private var _sortBtn:Button;
		private var _closeBtn:Button;
		
		public function ButtonTest()
		{
			Component.domain = ApplicationDomain.currentDomain;
			super(ButtonSkin.resource, ButtonSkin.skin);
		}
		
		protected override function configChildren():void
		{
			_closeBtn = getChildByName("close") as Button;
			_sortBtn = getChildByName("sort") as Button;
			
			_closeBtn.addEventListener(MouseEvent.CLICK, onBtnClick);
			_sortBtn.addEventListener(MouseEvent.CLICK, onBtnClick);
		}
		
		private function onBtnClick(evt:MouseEvent):void
		{
			trace(evt.target.name);
		}
	}
}