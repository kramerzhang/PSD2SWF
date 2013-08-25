package game.component
{
	/**
	 * @author Kramer(QQ:21524742)
	 * 由track条的高度定义thumb的可拖拽范围，制作时PSD文件时需注意。
	 * arrowUp上边界和arrowDown下边界范围是滚动条目标对象的遮罩范围。
	 * 可伸缩的滚动条arrowUp，arrowDown按钮和track条之间不留间隙
	 */	
	import flash.display.DisplayObject;
	import flash.display.Graphics;
	import flash.display.Shape;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Rectangle;
	
	public class ScrollBar extends Container
	{
		public static const MODE_HIDE_THUMB:int = 0;
		public static const MODE_HIDE_BAR:int 	= 1;
		
		private var _mode:int;
		private var _stage:Stage;
		
		private var _arrowUp:Button;
		private var _arrowDown:Button;
		private var _thumb:Button;
		private var _thumbIcon:Image;
		private var _track:Container;
		private var _scrollStep:int = 5;
		
		private var _target:DisplayObject;
		private var _viewport:Rectangle;
		private var _targetMask:Shape;
		
		private var _dragRect:Rectangle;
		private var _isThumbDrag:Boolean;
		
		public function ScrollBar()
		{
			super();
			initialize();
		}
		
		private function initialize():void
		{
			_dragRect = new Rectangle();
			_targetMask = new Shape();
			_mode = MODE_HIDE_THUMB;
			addEventListener(Event.ADDED_TO_STAGE, onAddToStage);
			addEventListener(Event.REMOVED_FROM_STAGE, onRemoveFromStage);
		}
		
		private function onAddToStage(evt:Event):void
		{
			_stage = this.stage;
		}
		
		private function onRemoveFromStage(evt:Event):void
		{
			if(_isThumbDrag == true)
			{
				endDrag();
			}
			_stage = null;
		}
		
		protected override function configChildren():void
		{
			_track = getChildByName("track") as Container;
			_arrowUp = getChildByName("arrowUp") as Button;
			_arrowDown = getChildByName("arrowDown") as Button;
			_thumb = getChildByName("thumb") as Button;
			_thumbIcon = getChildByName("thumbIcon") as Image;
			var viewportPlaceholder:Image = getChildByName("viewport") as Image; //在PSD文件中定义滚动条内容的范围
			removeChild(viewportPlaceholder);
			
			_viewport = new Rectangle(viewportPlaceholder.x, viewportPlaceholder.y, viewportPlaceholder.width, viewportPlaceholder.height);
			_thumb.visible = false;
			_thumb.y = _track.y;
		}
		
		private function addChildrenEventListener():void
		{
			_arrowUp.addEventListener(MouseEvent.CLICK, onArrowClick);
			_arrowDown.addEventListener(MouseEvent.CLICK, onArrowClick);
			_track.addEventListener(MouseEvent.CLICK, onTrackClick);
			_thumb.addEventListener(MouseEvent.MOUSE_DOWN, onThumbMouseDown);
			_thumb.addEventListener(MouseEvent.MOUSE_UP, onThumbMouseUp);
			addEventListener(MouseEvent.MOUSE_WHEEL, onMouseWheelHandler);
		}
		
		private function removeChildrenEventListener():void
		{
			_arrowUp.removeEventListener(MouseEvent.CLICK, onArrowClick);
			_arrowDown.removeEventListener(MouseEvent.CLICK, onArrowClick);
			_track.removeEventListener(MouseEvent.CLICK, onTrackClick);
			_thumb.removeEventListener(MouseEvent.MOUSE_DOWN, onThumbMouseDown);
			_thumb.removeEventListener(MouseEvent.MOUSE_UP, onThumbMouseUp);
			removeEventListener(MouseEvent.MOUSE_WHEEL, onMouseWheelHandler);
		}
		
		private function onMouseWheelHandler(e:MouseEvent):void
		{	
			if (e.delta > 0)
			{
				scrollOneStep(-_scrollStep);
			}
			else if (e.delta < 0)
			{
				scrollOneStep(_scrollStep);
			}
		}
		
		private function onArrowClick(evt:MouseEvent):void
		{
			switch(evt.target)
			{
				case _arrowUp:
					scrollOneStep(-_scrollStep);
					break;
				case _arrowDown:
					scrollOneStep(_scrollStep);
					break;
			}
		}
		
		private function scrollOneStep(step:int):void
		{
			var upBound:int = _track.y;
			var lowBound:int = _track.y + _track.height - _thumb.height;
			var targetY:int = _thumb.y + step;
			_thumb.y = Math.min(Math.max(targetY, upBound), lowBound);
			scrollTarget();
		}
		
		private function onTrackClick(evt:MouseEvent):void
		{
			var halfThumbHeight:int = _thumb.height >> 1;
			var localY:int = evt.localY;
			var thumbCenterY:int = _track.y + Math.min(Math.max(localY, halfThumbHeight), _track.height - halfThumbHeight);
			_thumb.y = thumbCenterY - halfThumbHeight;
			scrollTarget();
		}
		
		private function onThumbMouseDown(evt:MouseEvent):void
		{
			beginDrag();
		}
		
		private function onThumbMouseUp(evt:MouseEvent):void
		{
			endDrag();
		}
		
		private function beginDrag():void
		{
			_thumb.startDrag(false, _dragRect);
			_stage.addEventListener(MouseEvent.MOUSE_UP, onThumbMouseUp);
			_stage.addEventListener(MouseEvent.MOUSE_MOVE, onStageMouseMove);
			_isThumbDrag = true;
		}
		
		private function endDrag():void
		{
			_thumb.stopDrag();
			_stage.removeEventListener(MouseEvent.MOUSE_UP, onThumbMouseUp);
			_stage.removeEventListener(MouseEvent.MOUSE_MOVE, onStageMouseMove);
			_isThumbDrag = false;
		}
		
		private function onStageMouseMove(evt:MouseEvent):void
		{
			scrollTarget();
		}
		
		private function scrollTarget():void
		{
			if(_target.height <= _viewport.height)
			{
				_target.y = _targetMask.y;
			}
			else
			{
				var ratio:Number = (_thumb.y - _dragRect.y) / _dragRect.height;
				_target.y = _targetMask.y - (_target.height - _viewport.height) * ratio;
			}
		}
		
		public function scrollToBottom():void
		{
			var lowBound:int = _track.y + _track.height - _thumb.height;
			_thumb.y = lowBound;
			scrollTarget();
		}
		
		public function set target(value:DisplayObject):void
		{
			if(_target != null)
			{
				removeTargetMask();
				removeChildrenEventListener();
				removeTargetWheelEventListener();
			}
			_target = value;
			if(_target != null)
			{
				addTargetMask();
				addChildrenEventListener();
				addTargetWheelEventListener();
				update();
			}
		}
		
		private function addTargetMask():void
		{
			if(_target.parent != null)
			{
				_targetMask.x = this.x + _viewport.x
				_targetMask.y = this.y + _viewport.y;
				_target.x = _targetMask.x;
				_target.y = _targetMask.y;
				_target.parent.addChild(_targetMask);
				_target.mask = _targetMask;
			}
		}
		
		private function removeTargetMask():void
		{
			if(_targetMask.parent != null)
			{
				_targetMask.parent.removeChild(_targetMask);
			}
			_target.mask = null;
		}
		
		private function addTargetWheelEventListener():void
		{
			_target.addEventListener(MouseEvent.MOUSE_WHEEL, onMouseWheelHandler);
		}
		
		private function removeTargetWheelEventListener():void
		{
			_target.removeEventListener(MouseEvent.MOUSE_WHEEL, onMouseWheelHandler);
		}
		
		public function get target():DisplayObject
		{
			return _target;
		}
		
		public function update():void
		{
			updateTargetPosition();
			updateViewport();
			updateThumbHeight();
			updateVisibility();
			updateThumbPosition();
		}
		
		private function updateTargetPosition():void
		{
			if(_target.height <= _viewport.height)
			{
				_target.y = _targetMask.y;
			}
			else
			{
				if((_target.y + _target.height) < (_viewport.height + _targetMask.y))
				{
					_target.y = _targetMask.y + _viewport.height - _target.height ;
				}
			}
		}
		
		private function updateViewport():void
		{
			if(_target != null)
			{
				updateViewportShape(_viewport.width, _viewport.height);
			}
		}
		
		private function updateViewportShape(w:int, h:int):void
		{
			var g:Graphics = _targetMask.graphics;
			g.clear();
			g.beginFill(0x000000);
			g.drawRect(0, 0, w, h);
			g.endFill();
		}
		
		private function updateThumbHeight():void
		{
			var thumbHeight:int = 0;
			if(_target.height > _viewport.height)
			{
				thumbHeight = _track.height * _viewport.height / _target.height;
			}
			else
			{
				thumbHeight = _track.height;
			}
			_thumb.height = thumbHeight;
			updateDragRect();
		}
		
		private function updateVisibility():void
		{
			if(_thumb.height < _track.height)
			{
				this.visible = true;
				_thumb.visible = true;
				updateThumbIcon();
			}
			else
			{
				_thumb.visible = false;
				if(_mode == MODE_HIDE_BAR)
				{
					this.visible = false;
				}
			}
		}
		
		private function updateThumbPosition():void
		{
			if(_thumb.visible == true)
			{
				var thumbRatio:Number = (_thumb.y - _dragRect.y) / _dragRect.height;
				var targetRatio:Number = (_targetMask.y - _target.y) / (_target.height - _viewport.height);
				if(thumbRatio > targetRatio)
				{
					_thumb.y = _dragRect.y + _dragRect.height * targetRatio;
				}
			}
		}
		
		private function updateThumbIcon():void
		{
			if(_thumbIcon != null)
			{
				_thumbIcon.x = (_thumb.width - _thumbIcon.width) >> 1;
				_thumbIcon.y = (_thumb.height - _thumbIcon.height) >> 1;
				_thumb.addChild(_thumbIcon);
			}
		}
		
		private function updateDragRect():void
		{
			_dragRect.x = _thumb.x;
			_dragRect.y = _track.y;
			_dragRect.width = 0;
			_dragRect.height = _track.height - _thumb.height;
		}
		
		public function set viewport(value:Rectangle):void
		{
			_viewport = value;
			update();
		}
		
		public function get viewport():Rectangle
		{
			return _viewport;
		}
		
		public override function set height(value:Number):void
		{
			_track.height = value - _arrowUp.height - _arrowDown.height;
			_arrowDown.y = _track.y + _track.height;
		}
		
		public function set mode(value:int):void
		{
			_mode = value;
		}
		
		public function get mode():int
		{
			return _mode;
		}
		
		public function reset():void
		{
			if(_target != null)
			{
				_target.y = _targetMask.y;
				update();
			}
		}
	}
}