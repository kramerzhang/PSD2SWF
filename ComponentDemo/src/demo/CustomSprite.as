package demo
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	public class CustomSprite extends Sprite
	{
		public function CustomSprite()
		{
			addEventListener(MouseEvent.CLICK, onClick);
		}
		
		private function onClick(evt:MouseEvent):void
		{
			evt.stopPropagation();
			dispatchEvent(new Event("CustomClick", true));
		}
	}
}