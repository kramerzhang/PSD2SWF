package game.core.resource.item
{
	/**
	 *@author Kramer(QQ:21524742)
	 */	
	import flash.events.IEventDispatcher;
	
	import game.core.core.IDisposable;

	public interface ILoadable extends IEventDispatcher, IDisposable
	{
		function set url(value:String):void;
		function get url():String;
		function set priority(value:int):void;
		function get priority():int; 
		function get content():*;
		function get type():String;
		function set startHandler(value:Function):void;
		function get startHandler():Function;
		function set progressHandler(value:Function):void;
		function get progressHandler():Function;
		function set completeHandler(value:Function):void;
		function get completeHandler():Function;
		function set errorHandler(value:Function):void;
		function get errorHandler():Function;
		function set isDuplicate(value:Boolean):void;
		function get isDuplicate():Boolean;
		function load():void;
		function cloneContent(item:ILoadable):void;
		function cancel():Boolean;
	}
}