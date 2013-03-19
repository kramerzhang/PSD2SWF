package game.core.util
{
	import flash.debugger.enterDebugger;

	public function assert(condition:Boolean, errorMessage:String, enterDebuggerMode:Boolean = false):void
	{
		if(condition == false)
		{
			if(enterDebuggerMode == true)
			{
				enterDebugger();
			}
			throw new Error("Assertion Error: " + errorMessage, 250);
		}
	}
}