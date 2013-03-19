package game.core.util
{
	public class MathUtil
	{
		public static function convertNumberToDigit(num:int):Vector.<int>
		{
			var str:String = num.toString();
			return Vector.<int>(str.split(""));
		}
		
		/**
		 * 
		 * 
		 */
		public static function clamp(value:Number, max:Number, min:Number) : Number
		{
			return Math.min(Math.max(value, min), max);
		}
		
	}
}