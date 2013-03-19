package game.core.tick
{
	public interface ITickable
	{
		function set delay(value:int):void;
		function get delay():int;
		function update(now:uint):void;
	}
}