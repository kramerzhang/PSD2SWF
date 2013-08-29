package game.component
{
	/**
	 * @author Kramer(QQ:21524742)
	 */	
	import flash.filters.GlowFilter;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;
	import flash.text.TextFormatAlign;
	
	import game.component.core.ISkinnable;
	import game.component.core.IStateChangeable;
	
	public class Label extends TextField implements ISkinnable, IStateChangeable
	{
		public static const FILTER_BLACK:Array = [new GlowFilter(0x000000, 1, 2, 2, 12)];
		public static const FILTER_WHITE:Array = [new GlowFilter(0xFFFFFF, 1, 2, 2, 12)];
		public static const DEFAULT_FORMAT:Object = {align:"left", bold:false, color:0x000000, font:"SimSun", italic:false, leading:0, letterSpacing:0, size:12, underline:false};
		public static const DEFAULT_STATE:String = "normal";
		
		private var _defaultFormat:TextFormat
		private var _skin:Object;
		private var _width:Number;
		private var _height:Number;
		private var _state:String;
		
		public function Label()
		{
			super();
			initialize();
		}
		
		private function initialize():void
		{
			this.mouseEnabled = false;
			this.mouseWheelEnabled = false;
			this.wordWrap = true;
			this.selectable = false;
			this.autoSize = TextFieldAutoSize.LEFT;
		}
		
		public function set skin(value:Object):void
		{
			_skin = value;
			this.autoSize = TextFieldAutoSize.NONE;
			this.name = _skin.name;
			this.state = DEFAULT_STATE;
		}
		
		public function get skin():Object
		{
			return _skin;
		}
		
		private function updateDefaultTextFormat(format:Object):void
		{
			var defaultTextFormat:TextFormat = new TextFormat();
			for(var property:String in format)
			{
				defaultTextFormat[property] = format[property];
			}
			this.defaultTextFormat = defaultTextFormat;
		}
		
		private function updateFilter(color:int):void
		{
			if(color == 0x000000)
			{
				this.filters = FILTER_WHITE;
			}
			else
			{
				this.filters = FILTER_BLACK;
			}
		}
		
		public function set state(value:String):void
		{
			if(_skin[value] != null)
			{
				_state = value;
				updateState();
			}
		}
		
		public function get state():String
		{
			return _state;
		}
		
		private function updateState():void
		{
			var obj:Object = _skin[_state];
			this.x = _skin.x + obj.x;
			this.y = _skin.y + obj.y;
			this.width = obj.width;
			this.height = obj.height;
			updateDefaultTextFormat(obj.format);
			updateFilter(int(this.defaultTextFormat.color));
			this.htmlText = obj.content;
		}
		
		public function set enabled(value:Boolean):void
		{
			this.mouseEnabled = value;
		}
		
		public function get enabled():Boolean
		{
			return this.mouseEnabled;
		}
	}
}