package game.core.driver
{
	import flash.display.Shape;
	import flash.events.Event;
	import flash.utils.getTimer;

	public class DriverManager
	{
		private static var _frameDuration:Number;
		private static var _ticker:Shape;
		private static var _lastTime:uint = 0;
		
		private static var _driverList:Vector.<Driver>;
		
		public static var globalDriver:Driver;
		public static var animationDriver:Driver;
		public static var daemonDriver:Driver;
		
		public static function initialize():void
		{
			addDriver();
			
			_frameDuration = 33.33;
			_ticker = new Shape();
			_ticker.addEventListener(Event.ENTER_FRAME, onEnterFrame);
		}
		
		private static function addDriver():void
		{
			globalDriver = new Driver();
			animationDriver = new Driver();
			daemonDriver = new Driver();
			_driverList = new Vector.<Driver>();
			_driverList.push(globalDriver);
			_driverList.push(animationDriver);
			_driverList.push(daemonDriver);
		}
		
		private static function onEnterFrame(evt:Event):void
		{
			var now:uint = getTimer();
			var elapsedTime:uint = now - _lastTime;
			_lastTime = now;
			var elapsedFrame:int = Math.round(elapsedTime / _frameDuration);
			for(var i:int = 0; i < elapsedFrame; i++)
			{
				for each(var driver:Driver in _driverList)
				{
					driver.run();
				}
			}
		}
		
		public function DriverManager()
		{
		}
	}
}