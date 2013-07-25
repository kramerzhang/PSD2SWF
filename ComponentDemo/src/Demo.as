package
{
	import demo.CustomSprite;
	
	import flash.display.DisplayObject;
	import flash.display.Graphics;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.EventPhase;
	import flash.events.MouseEvent;
	import flash.system.ApplicationDomain;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.utils.getTimer;
	import flash.utils.setTimeout;
	
	import game.component.Component;
	import game.component.ComponentFactory;
	
	[SWF(width="1024", height="768")]
	public class Demo extends Sprite
	{
		public function Demo()
		{
			Component.domain = ApplicationDomain.currentDomain;
			addChild(new MainMenuPanel());
		}
		
		
		private function onClick(evt:Event):void
		{
			var currentTarget:DisplayObject = evt.currentTarget as DisplayObject;
//			if(currentTarget == this.stage)
//			{
//				if(evt.eventPhase == EventPhase.CAPTURING_PHASE)
//				{
//					evt.stopPropagation();
//					evt.stopImmediatePropagation();
//				}
//			}
			trace(evt.eventPhase + " " + currentTarget + " " + currentTarget.name);
		}
		
		private function onClick1(evt:MouseEvent):void
		{
			trace("another mouse click");
		}
		
		private function createSprite(color:int, size:int):CustomSprite
		{
			var result:CustomSprite = new CustomSprite();
			var g:Graphics = result.graphics;
			g.beginFill(color);
			g.drawRect(0, 0, size, size);
			g.endFill();
			return result;
		}
		
		private function createTextField(content:String):TextField
		{
			var result:TextField = new TextField();
			result.autoSize = TextFieldAutoSize.LEFT;
			result.text = content;
			return result;
		}
	}
}