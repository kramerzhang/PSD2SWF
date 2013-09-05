package game.core.fsm
{
	import game.core.util.HashMap;

	public class FSM
	{
		public static const UNDEFINED_STATE:String = "";
		
		private var _currentState:String;
		private var _source:HashMap;
		
		public function FSM()
		{
			_source = new HashMap();
			_currentState = UNDEFINED_STATE;
		}
		
		public function addState(sourceState:String, action:String, targetState:String):void
		{
			var key:String = sourceState + "_" + action;
			_source.put(key, targetState);
		}
		
		public function testState(currentState:String, action:String):String
		{
			var key:String = currentState + "_" + action;
			if(_source.containsKey(key) == true)
			{
				_currentState = _source.get(key);
				return _currentState;
			}
			_currentState = UNDEFINED_STATE;
			return UNDEFINED_STATE;
		}
		
		public function get currentState():String
		{
			return _currentState;
		}
		
	}
}