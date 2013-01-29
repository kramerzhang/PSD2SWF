package game.component
{
	/**
	 * @author Kramer(QQ:21524742)
	 */	
	import flash.events.Event;
	import flash.events.FocusEvent;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.text.TextFieldType;
	import flash.ui.Keyboard;
	
	[Event(name="change", type="flash.events.Event")]
	public class Stepper extends Container
	{
		private static const VALUE_TOKEN:String 	= "v";
		private static const MAXIMUM_TOKEN:String 	= "m";
		
		private var _txt:Label;
		private var _prevBtn:Button; //required
		private var _nextBtn:Button; //required
		private var _lastBtn:Button; //optional
		private var _firstBtn:Button;//optional
		
		private var _editable:Boolean;
		private var _minimum:Number;
		private var _maximum:Number;
		private var _value:Number;
		private var _oldValue:Number;
		private var _step:Number;
		private var _formatter:String;
		
		public function Stepper()
		{
			initialize();
		}
		
		private function initialize():void
		{
			_minimum = 1;
			_maximum = 10;
			_step = 1;
			_value = 0;
			_oldValue = 0;
			_formatter = "vv/mm";
		}
		
		protected override function configChildren():void
		{
			_txt = getChildByName("txt") as Label;
			_txt.addEventListener(Event.CHANGE, onTextChange);
			_prevBtn = getChildByName("prevBtn") as Button;
			_nextBtn = getChildByName("nextBtn") as Button;
			_lastBtn = getChildByName("lastBtn") as Button;
			_firstBtn = getChildByName("firstBtn") as Button;
			this.editable = false;
			addBtnEventListener();
			this.value = 1;
		}
		
		//屏蔽文本自身的CHANGE事件向上传递
		private function onTextChange(evt:Event):void
		{
			evt.stopPropagation();
		}
		
		public function addBtnEventListener():void
		{
			_nextBtn.addEventListener(MouseEvent.CLICK, onBtnClick);
			_prevBtn.addEventListener(MouseEvent.CLICK, onBtnClick);
			if(_firstBtn != null)
			{
				_firstBtn.addEventListener(MouseEvent.CLICK, onBtnClick);
			}
			if(_lastBtn != null)
			{
				_lastBtn.addEventListener(MouseEvent.CLICK, onBtnClick);
			}
		}
		
		private function onBtnClick(evt:MouseEvent):void
		{
			_oldValue = this.value;
			var target:Button = evt.target as Button;
			var targetValue:Number = 0;
			switch(target)
			{
				case _prevBtn:
					targetValue = _value - _step;
					break;
				case _nextBtn:
					targetValue = _value + _step;
					break;
				case _firstBtn:
					targetValue = _minimum;
					break;
				case _lastBtn:
					targetValue = _maximum;
					break;
			}
			this.value = targetValue;
			if(_oldValue != this.value)
			{
				dispatchEvent(Component.EVENT_CHANGE);
			}
		}
		
		public function set editable(value:Boolean):void
		{
			_txt.mouseEnabled = value;
			_txt.selectable = value;
			if(value == true)
			{
				_txt.type = TextFieldType.INPUT;
				_txt.restrict = "0-9\\-\\.\\,"; 
				_txt.addEventListener(FocusEvent.FOCUS_IN, onTextFocusIn);
				_txt.addEventListener(KeyboardEvent.KEY_UP, onTextKeyUp);
			}
			else
			{
				_txt.type = TextFieldType.DYNAMIC;
				_txt.removeEventListener(FocusEvent.FOCUS_IN, onTextFocusIn);
				_txt.removeEventListener(KeyboardEvent.KEY_UP, onTextKeyUp);
			}
		}
		
		private function onTextFocusIn(evt:FocusEvent):void
		{
			_oldValue = parseFloat(_txt.text);
			_oldValue = isNaN(_oldValue) ? 0 : _oldValue;
		}
		
		private function onTextKeyUp(evt:KeyboardEvent):void
		{
			if(evt.keyCode == Keyboard.ENTER)
			{
				var textValue:Number = parseFloat(_txt.text);
				this.value = textValue;
				if(_oldValue != this.value)
				{
					dispatchEvent(Component.EVENT_CHANGE);
					_oldValue = this.value;
				}
			}
		}
		
		private function getValidValue(value:Number):Number {
			if (isNaN(value) == true)
			{
				return _value; 
			}
			var closest:Number = Number((_step * Math.round(value / _step)).toFixed(1));
			return Math.min(Math.max(closest, _minimum), _maximum);
		}
		
		public function get editable():Boolean
		{
			return _editable;
		}
		
		public function set formatter(value:String):void
		{
			_formatter = value;
		}
		
		public function get formatter():String
		{
			return _formatter;
		}
		
		public function set value(v:Number):void
		{
			_value = getValidValue(v);
			_txt.text = generateDisplayStr();
			updateBtn();
		}
		
		private function updateBtn():void
		{
			toggleButton(_prevBtn, true);
			toggleButton(_firstBtn, true);
			toggleButton(_nextBtn, true);
			toggleButton(_lastBtn, true);
			if(_value == _minimum)
			{
				toggleButton(_prevBtn, false);
				toggleButton(_firstBtn, false);
			}
			if(_value == _maximum)
			{
				toggleButton(_nextBtn, false);
				toggleButton(_lastBtn, false);
			}
		}
		
		private function toggleButton(btn:Button, enabled:Boolean):void
		{
			if(btn != null)
			{
				btn.enabled = enabled;
			}
		}
		
		private function generateDisplayStr():String
		{
			var result:String = "";
			var vLen:int = _formatter.match(/v/g).length;
			var mLen:int = _formatter.match(/m/g).length;
			result = _formatter.replace(/v+/g, padStr(_value.toString(), vLen));
			result = result.replace(/m+/g, padStr(_maximum.toString(), mLen));
			return result;
		}
		
		private function padStr(str:String, len:int):String
		{
			var result:String = str;
			var token:String = "0";
			while(result.length < len)
			{
				result = token + result;
			}
			return result;
		}
		
		public function get value():Number
		{
			return _value;
		}
		
		public function set step(value:Number):void
		{
			_step = value;
		}
		
		public function get step():Number
		{
			return _step;
		}
		
		public function set minimum(value:Number):void
		{
			_minimum = value;
			this.value = _value;
		}
		
		public function get minimum():Number
		{
			return _minimum;
		}
		
		public function set maximum(value:Number):void
		{
			_maximum = value;
			this.value = _value;
		}
		
		public function get maximum():Number
		{
			return _maximum;
		}
		
		public override function set enabled(value:Boolean):void
		{
			super.enabled = value;
			_prevBtn.enabled = value;
			_nextBtn.enabled = value;
			_txt.mouseEnabled = value;
			_txt.selectable = value;
			if(_lastBtn != null)
			{
				_lastBtn.enabled = value;
			}
			if(_firstBtn != null)
			{
				_firstBtn.enabled = value;
			}
		}
		
	}
}