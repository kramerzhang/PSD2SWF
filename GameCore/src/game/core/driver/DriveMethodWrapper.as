package game.core.driver
{
	public class DriveMethodWrapper
	{
		public var method:Function;
		public var priority:int;
		public var isActivate:Boolean;
		
		public function DriveMethodWrapper(method:Function, priority:int, isActivate:Boolean = true)
		{
			this.method = method;
			this.priority = priority;
			this.isActivate = isActivate;
		}
	}
}