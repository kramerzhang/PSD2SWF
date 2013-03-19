package game.core.tick
{
	import flash.display.Shape;
	import flash.events.Event;
	import flash.utils.getTimer;

	public class TickManager
	{
		private static var _instance:TickManager;
		
		private var _isRunning:Boolean;
		private var _tickableWrapperVec:Vector.<TickableWrapper>;
		private var _shape:Shape;
		
		public function TickManager(blocker:Blocker)
		{
			initialize();
		}
		
		private function initialize():void
		{
			_tickableWrapperVec = new Vector.<TickableWrapper>();
			_shape = new Shape();
			_isRunning = false;
		}
		
		public static function get instance():TickManager
		{
			if(_instance == null)
			{
				_instance = new TickManager(new Blocker());
			}
			return _instance;
		}
		
		public function start():void
		{
			_isRunning = true;
			_shape.addEventListener(Event.ENTER_FRAME, onEnterFrame);
		}
		
		private function onEnterFrame(evt:Event):void
		{
			var now:uint = getTimer();
			for each(var wrapper:TickableWrapper in _tickableWrapperVec)
			{
				var tickable:ITickable = wrapper.tickable;
				if(now > (tickable.delay + wrapper.lastExecuteTime))
				{
					tickable.update(now);
					wrapper.lastExecuteTime = now;
				}
			}
		}
		
		public function stop():void
		{
			_isRunning = false;
			_shape.removeEventListener(Event.ENTER_FRAME, onEnterFrame);
		}
		
		public function get isRunning():Boolean
		{
			return _isRunning;
		}
		
		public function attach(tickableObj:ITickable):void
		{
			_tickableWrapperVec.push(new TickableWrapper(tickableObj));
		}
		
		public function detach(tickableObj:ITickable):void
		{
			var len:int = _tickableWrapperVec.length;
			for(var i:int = 0; i < len; i++)
			{
				var wrapper:TickableWrapper = _tickableWrapperVec[i];
				if(wrapper.tickable == tickableObj)
				{
					_tickableWrapperVec.splice(i, 1);
					break;
				}
			}
		}
	}
}
import game.core.tick.ITickable;

class Blocker{}
class TickableWrapper
{
	public var lastExecuteTime:uint;
	
	public var tickable:ITickable;
	
	public function TickableWrapper(tickable:ITickable)
	{
		this.tickable = tickable;
	}
}