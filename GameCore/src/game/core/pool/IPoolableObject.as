package game.core.pool
{
	import game.core.core.IDisposable;

	public interface IPoolableObject extends IDisposable
	{
		function checkout():void;
		function checkin():void;
	}
}