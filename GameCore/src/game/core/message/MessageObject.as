package game.core.message
{
	import game.core.pool.IPoolableObject;

	internal class MessageObject implements IPoolableObject
	{
		public var callback:Function;
		public var priority:int = 0;
		public var paramList:Array;
		
		public function MessageObject()
		{
		}
		
		public function checkout():void
		{
			
		}
		
		public function checkin():void
		{
			this.callback = null;
			this.priority = 0;
			this.paramList = null;
		}
		
		public function dispose():void
		{
			
		}
	}
}