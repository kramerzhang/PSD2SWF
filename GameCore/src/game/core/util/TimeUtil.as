package game.core.util
{
	public class TimeUtil
	{
		public static function formatTime(second:int):String
		{
			if(second <= 0)
			{
				second = 0;
			}
			var hour:int = Math.floor(second / 3600);
			second = second % 3600;
			var min:int = Math.floor(second / 60);
			second = second % 60;
			return pad(hour) + ":" + pad(min) + ":" + pad(second);
		}
		
		private static function pad(num:int):String
		{
			if(num < 10)
			{
				return "0" + num;
			}
			return num.toString();
		}
	}
}