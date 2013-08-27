package game.component
{
	/**
	 * @author Kramer(QQ:21524742)
	 */	
	
	public class ScaleImage extends Image
	{
		public static const CLASS_NAME:String = "ScaleImage";
		
		public function ScaleImage()
		{
			super();
		}
		
		public override function setSize(width:Number, height:Number):void
		{
			disposeBitmapData();
			super.setSize(width, height);
		}
		
		protected override function updateBitmapData(width:Number, height:Number):void
		{
			this.bitmapData = BitmapDataCache.getScaleBitmapData(_skin[_state].link, width, height, _skin.top, _skin.right, _skin.bottom, _skin.left);
		}
		
		public function disposeBitmapData():void
		{
			BitmapDataCache.disposeScaleBitmapData(_skin[_state].link, this.width, this.height);
		}
		
	}
}