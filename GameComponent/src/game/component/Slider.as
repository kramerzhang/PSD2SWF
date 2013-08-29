package game.component
{
	import flash.display.Graphics;
	import flash.display.Shape;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Rectangle;
	
	[Event(name="change", type="flash.events.Event")]
	public class Slider extends Container
	{
		private var _stage:Stage;
		
		private var _btn:Button;
		private var _track:Image;
		private var _mask:Shape;
		private var _dragRect:Rectangle;
		private var _value:Number = 0;
		//拖拽按钮btn可拖拽范围距离track条左右边界的距离
		private var _boundOffset:Number = 0;
		private var _isBtnDrag:Boolean = false;
		
		public function Slider()
		{
			initialize();
		}
		
		private function initialize():void
		{
			_dragRect = new Rectangle();
			addEventListener(Event.ADDED_TO_STAGE, onAddToStage);
			addEventListener(Event.REMOVED_FROM_STAGE, onRemoveFromStage);
		}
		
		private function onAddToStage(evt:Event):void
		{
			_stage = this.stage;
		}
		
		private function onRemoveFromStage(evt:Event):void
		{
			if(_isBtnDrag == true)
			{
				endDrag();
			}
			_stage = null;
		}
		
		protected override function configChildren():void
		{
			_btn = getChildByName("btn") as Button;
			_track = getChildByName("track") as Image;
			updateDragRect();
			createTrackMask();
			updateBtnPosition();
			addBtnEventListener();
		}
		
		private function updateDragRect():void
		{
			_dragRect.x = _track.x - _boundOffset;
			_dragRect.y = _btn.y;
			_dragRect.width = _track.width - _btn.width + _boundOffset + _boundOffset;
			_dragRect.height = 0;
		}
		
		private function createTrackMask():void
		{
			_mask = new Shape();
			_mask.name = "mask";
			var g:Graphics = _mask.graphics;
			g.beginFill(0xffffff);
			g.drawRect(0, 0, _track.width, _track.height);
			g.endFill();
			_mask.x = _track.x;
			_mask.y = _track.y;
			_track.mask = _mask;
			addChild(_mask);
		}
		
		private function updateMask():void
		{
			_mask.width = _btn.x + (_btn.width >> 1) - _track.x ;
		}
		
		private function updateBtnPosition():void
		{
			_btn.x = _dragRect.x + _value * _dragRect.width;
			updateMask();
		}
		
		private function addBtnEventListener():void
		{
			_btn.addEventListener(MouseEvent.MOUSE_DOWN, onMouseDown);
			_btn.addEventListener(MouseEvent.MOUSE_UP, onMouseUp);
		}
		
		private function onMouseDown(evt:MouseEvent):void
		{
			beginDrag();
		}
		
		private function onMouseUp(evt:MouseEvent):void
		{
			endDrag();
		}
		
		private function beginDrag():void
		{
			_btn.startDrag(false, _dragRect);
			_stage.addEventListener(MouseEvent.MOUSE_UP, onMouseUp);
			_stage.addEventListener(MouseEvent.MOUSE_MOVE, onMouseMove);
			_isBtnDrag = true;
		}
		
		private function endDrag():void
		{
			_btn.stopDrag();
			updateMask();
			_stage.removeEventListener(MouseEvent.MOUSE_UP, onMouseUp);
			_stage.removeEventListener(MouseEvent.MOUSE_MOVE, onMouseMove);
			_isBtnDrag = false;
		}
		
		private function onMouseMove(evt:MouseEvent):void
		{
			updateMask();
			dispatchEvent(Component.EVENT_CHANGE);
		}
		
		public function set value(v:Number):void
		{
			_value = v;
			updateBtnPosition();
		}
		
		public function get value():Number
		{
			_value = (_btn.x - _dragRect.x) / _dragRect.width;
			return _value;
		}
		
		public function set boundOffset(value:Number):void
		{
			_boundOffset = value;
			updateDragRect();
			updateBtnPosition();
		}
		
		public function get boundOffset():Number
		{
			return _boundOffset;
		}
	}
}