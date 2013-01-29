package game.component
{
	/**
	 * @author Kramer(QQ:21524742)
	 */	
	import flash.display.Graphics;
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.events.MouseEvent;

	public class DragBar extends Component
	{
		private static const STAGE_OFFSET:int = 30;
		private var _parent:Sprite;
		private var _stage:Stage;
		private var _isDragging:Boolean;
		
		public function DragBar()
		{
			initialize();
		}
		
		private function initialize():void
		{
			_isDragging = false;
			addEventListener(Event.ADDED_TO_STAGE, onAddToStage);
			addEventListener(Event.REMOVED_FROM_STAGE, onRemoveFromStage);
		}
		
		private function onAddToStage(evt:Event):void
		{
			addEventListener(MouseEvent.MOUSE_DOWN, onMouseDown);
			addEventListener(MouseEvent.MOUSE_UP, onMouseUp);
			_parent = this.parent as Sprite;
			_stage = this.stage;
		}
		
		private function onRemoveFromStage(evt:Event):void
		{
			if(_isDragging == true)
			{
				endDrag();
			}
			_parent = null;
			_stage = null;
		}
		
		private function onMouseDown(evt:MouseEvent):void
		{
			if(this.parent.parent != null)
			{
				this.parent.parent.addChild(this.parent);
			}
			beginDrag();
		}
		
		private function onMouseUp(evt:MouseEvent):void
		{
			endDrag();
		}
		
		private function beginDrag():void
		{
			_parent.startDrag(false);
			_stage.addEventListener(Event.MOUSE_LEAVE, onMouseUp);
			_stage.addEventListener(MouseEvent.MOUSE_UP, onMouseUp);
			_isDragging = true;
		}
		
		private function endDrag():void
		{
			_parent.stopDrag();
			adjustParentPosition();
			_stage.removeEventListener(Event.MOUSE_LEAVE, onMouseUp);
			_stage.removeEventListener(MouseEvent.MOUSE_UP, onMouseUp);
			_isDragging = false;
		}
		
		private function adjustParentPosition():void
		{
			if(_parent.y < 0)
			{
				_parent.y = 0;
			}
			else if(_parent.y > _stage.stageHeight - STAGE_OFFSET)
			{
				_parent.y = _stage.stageHeight - _parent.height;
			}
			if(_parent.x < -_parent.width + STAGE_OFFSET)
			{
				_parent.x = 0;
			}
			else if(_parent.x > _stage.stageWidth - STAGE_OFFSET)
			{
				_parent.x = _stage.stageWidth - _parent.width;
			}
		}
		
		protected override function configChildren():void
		{
			createHotArea();
		}
		
		private function createHotArea():void
		{
			var g:Graphics = this.graphics;
			g.beginFill(0x000000, 0);
			g.drawRect(0, 0, this.width, this.height);
			g.endFill();
		}
		
	}
}