package game.component.core
{
	/**
	 * @author Kramer(QQ:21524742)
	 * 
	 * 原子组件Label和Image实现该接口
	 */	
	
	public interface IStateChangeable
	{
		function set state(value:String):void;
		
		function get state():String;
	}
}