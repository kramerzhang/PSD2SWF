package game.component
{
	/**
	 * @author Kramer(QQ:21524742)
	 */	
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.BitmapDataChannel;
	
	import game.component.core.ISkinnable;
	import game.component.core.IStateChangeable;
	
	public class Image extends Bitmap implements ISkinnable, IStateChangeable
	{
		public static const CLASS_NAME:String = "Image";
		public static const DEFAULT_STATE:String = "normal";
		
		protected var _skin:Object;
		protected var _state:String;
		protected var _scaleX:Number = 1;
		protected var _scaleY:Number = 1;
		protected var _width:Number;
		protected var _height:Number;
		
		public function Image()
		{
			super(null, "auto", false);
		}
		
		public function set skin(value:Object):void
		{
			_skin = value;
			this.name = _skin.name;
			this.state = DEFAULT_STATE;
		}
		
		public function get skin():Object
		{
			return _skin;
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
		
		protected function updateState():void
		{
			var obj:Object = _skin[_state];
			this.x = _skin.x + obj.x;
			this.y = _skin.y + obj.y;
			_width = obj.width;
			_height = obj.height;
			updateBitmapData(_width * _scaleX, _height * _scaleY);
		}
		
		protected function updateBitmapData(width:Number, height:Number):void
		{
			this.bitmapData = BitmapDataCache.getBitmapData(_skin[_state].link);
			super.width = width;
			super.height = height;
		}
		
		public function setSize(width:Number, height:Number):void
		{
			_scaleX = width / _width;
			_scaleY = height / _height;
			updateBitmapData(width, height);
		}
		
		public override function set width(value:Number):void
		{
			if(value == this.width)
			{
				return;
			}
			setSize(value, this.height);
		}
		
		public override function set height(value:Number):void
		{
			if(value == this.height)
			{
				return;
			}
			setSize(this.width, value);
		}
		
		public override function set scaleX(value:Number):void
		{
			setSize(_width * value, this.height);
		}
		
		public override function get scaleX():Number
		{
			return _scaleX;
		}
		
		public override function set scaleY(value:Number):void
		{
			setSize(this.width, _height * value);
		}
		
		public override function get scaleY():Number
		{
			return _scaleY;
		}
	}
}