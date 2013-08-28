package
{
	import flash.display.GradientType;
	import flash.display.Graphics;
	import flash.display.SpreadMethod;
	import flash.display.Sprite;
	import flash.geom.Matrix;
	import flash.system.ApplicationDomain;
	
	import game.component.Component;
	import game.component.Panel;
	import game.component.ScrollBar;
	import game.skin.ScrollBarSkin;
	
	[SWF(width="236", height="185")]
	public class ScrollBarTest extends Panel
	{
		private var _scrollBar:ScrollBar;
		
		public function ScrollBarTest()
		{
			Component.domain = ApplicationDomain.currentDomain;
			super(ScrollBarSkin.resource, ScrollBarSkin.skin);
		}
		
		protected override function configChildren():void
		{
			_scrollBar = getChildByName("gundongtiao") as ScrollBar;
			var target:Sprite = createSprite(200, 300);
			addChild(target);
			_scrollBar.target = target;
		}
		
		private function createSprite(width:int, height:int):Sprite
		{
			var result:Sprite = new Sprite();
			var graphics:Graphics = result.graphics;
			graphics.lineStyle(1);
			var matrix:Matrix = new Matrix();
			matrix.rotate(Math.PI / 4);
			matrix.scale(1, 0.6);
			matrix.translate(stage.stageWidth / 2, stage.stageHeight / 2 + 50);
			matrix.createGradientBox(100, 100, 0, 50, 50);
			graphics.beginGradientFill(GradientType.LINEAR, [0xff0000, 0x0000ff], [1,1], [0, 255], matrix, SpreadMethod.PAD);
			graphics.drawCircle(100, 100, 100 );
			graphics.endFill();
			return result;
		}
	}
}