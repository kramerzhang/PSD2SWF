package game.component
{
	/**
	 * @author Kramer(QQ:21524742)
	 * 注意：UI组件创建后不会释放资源，ScaleImage每次缩放都会创建新的BitmapData对象，且旧的BitmapData不会释放
	 */	
	
	public class ScaleImage extends Image
	{
		public static const CLASS_NAME:String = "ScaleImage";
		private var _scaleX:Number = 1;
		private var _scaleY:Number = 1;
		private var _width:Number;
		private var _height:Number;
		
		public function ScaleImage()
		{
			super();
		}
		
		protected override function updateState():void
		{
			var obj:Object = _skin[_state];
			this.x = _skin.x + obj.x;
			this.y = _skin.y + obj.y;
			_width = _skin[_state].width;
			_height = _skin[_state].height;
			setSize(_width * _scaleX, _height * _scaleY);		
		}
		
		public function setSize(width:Number, height:Number):void
		{
			this.bitmapData = BitmapDataCache.getScaleBitmapData(_skin[_state].link, width, height, _skin.top, _skin.right, _skin.bottom, _skin.left);
		}
		
		public override function set width(value:Number):void
		{
			if(value == this.width)
			{
				return;
			}
			this.scaleX = value / _width;
		}
		
		public override function set height(value:Number):void
		{
			if(value == this.height)
			{
				return;
			}
			this.scaleY = value / _height;
		}
		
		public override function set scaleX(value:Number):void
		{
			_scaleX = value;
			setSize(_width * _scaleX, this.height);
		}
		
		public override function get scaleX():Number
		{
			return _scaleX;
		}
		
		public override function set scaleY(value:Number):void
		{
			_scaleY = value;
			setSize(this.width, _height * _scaleY);
		}
		
		public override function get scaleY():Number
		{
			return _scaleY;
		}
		
	}
}