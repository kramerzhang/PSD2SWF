package game.core.util
{
	public class Delegate
	{
		public static function create(handler:Function, ...params):Function
		{
			var f:Function = function():void
			{
				handler(arguments[0], params);
			};
			return f;
		}
	}
}