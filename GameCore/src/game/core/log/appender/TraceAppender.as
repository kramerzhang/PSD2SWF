package game.core.log.appender
{
	import game.core.log.IAppender;

	/**
	 *@author Kramer(QQ:21524742)
	 */	
	public class TraceAppender implements IAppender
	{
		public function TraceAppender()
		{
		}
		
		public function append(msg:String):void
		{
			trace(msg);
		}
	}
}