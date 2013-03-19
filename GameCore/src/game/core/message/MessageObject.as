package game.core.message
{
	internal class MessageObject
	{
		public var callback:Function;
		public var priority:int = 0;
		public var paramList:Array;
		
		public function MessageObject(callback:Function, priority:int = 0, paramList:Array = null)
		{
			this.callback = callback;
			this.priority = priority;
			this.paramList = paramList;
		}
	}
}