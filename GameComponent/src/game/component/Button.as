package game.component
{
	/**
	 * @author Kramer(QQ:21524742)
	 */	
	import flash.display.DisplayObject;
	import flash.events.MouseEvent;
	
	import game.component.core.IStateChangeable;

	public class Button extends Container
	{
		public static const STATE_NORMAL:String 	= "normal";
		public static const STATE_OVER:String		= "over";
		public static const STATE_DOWN:String		= "down";
		public static const STATE_DISABLE:String	= "disable";
		
		private var _state:String;
		private var _label:Label; //optional
		private var _image:Image; //required
		
		public function Button()
		{
			super();
			initialize();
		}
		
		private function initialize():void
		{
			this.buttonMode = true;
			this.mouseChildren = false;
			this.enabled = true;
		}
		
		private function addMouseEventListener():void
		{
			addEventListener(MouseEvent.ROLL_OVER, onMouseEvent);
			addEventListener(MouseEvent.ROLL_OUT, onMouseEvent);
			addEventListener(MouseEvent.MOUSE_UP, onMouseEvent);
			addEventListener(MouseEvent.MOUSE_DOWN, onMouseEvent);
		}
		
		private function removeMouseEventListener():void
		{
			removeEventListener(MouseEvent.ROLL_OVER, onMouseEvent);
			removeEventListener(MouseEvent.ROLL_OUT, onMouseEvent);
			removeEventListener(MouseEvent.MOUSE_UP, onMouseEvent);
			removeEventListener(MouseEvent.MOUSE_DOWN, onMouseEvent);
		}
		
		protected function onMouseEvent(evt:MouseEvent):void
		{
			switch(evt.type)
			{
				case MouseEvent.ROLL_OUT:
					this.state = Button.STATE_NORMAL;
					break;
				case MouseEvent.ROLL_OVER:
					this.state = Button.STATE_OVER;
					break;
				case MouseEvent.MOUSE_DOWN:
					this.state = Button.STATE_DOWN;
					break;
				case MouseEvent.MOUSE_UP:
					this.state = Button.STATE_OVER;
					break;
			}
		}
		
		public override function set enabled(value:Boolean):void
		{
			super.enabled = value;
			this.mouseEnabled = value;
			if(value == true)
			{
				addMouseEventListener();
				this.state = Button.STATE_NORMAL;
			}
			else
			{
				removeMouseEventListener();
				this.state = Button.STATE_DISABLE;
			}
		}
		
		protected function set state(value:String):void
		{
			_state = value;
			var childNum:int = this.numChildren;
			for(var i:int = 0; i < childNum; i++)
			{
				var child:IStateChangeable = this.getChildAt(i) as IStateChangeable;
				if(child != null)
				{
					child.state = _state;
				}
			}
		}
		
		protected function get state():String
		{
			return _state;
		}
		
		protected override function configChildren():void
		{
			_image = getChildByType(Image) as Image;
			_label = getChildByType(Label) as Label;
		}
		
		public function get label():Label
		{
			return _label;
		}
		
		private function getChildByType(type:Class):DisplayObject
		{
			var len:int = this.numChildren;
			for(var i:int = 0; i < len; i++)
			{
				var child:DisplayObject = this.getChildAt(i);
				if(child is type)
				{
					return child;
				}
			}
			return null;
		}
		
		public override function set width(value:Number):void
		{
			if(_image != null)
			{
				_image.width = value;
			}
		}
		
		public override function set height(value:Number):void
		{
			if(_image != null)
			{
				_image.height = value;
			}
		}
		
	}
}