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
		public static const DEFAULT_STATE:String = "normal";
		
		protected var _skin:Object;
		protected var _state:String;
		
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
			this.bitmapData = BitmapDataCache.getBitmapData(obj.link);
			this.x = _skin.x + obj.x;
			this.y = _skin.y + obj.y;
			this.width = obj.width;
			this.height = obj.height;
		}
	}
}