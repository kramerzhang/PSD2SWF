package game.core.driver
{
	public interface IDrivable
	{
		function run():void;
		
		function setDriver(driver:Driver):void;
		
		function removeDriver():void;
	}
}