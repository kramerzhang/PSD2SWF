package game.core.util
{
	import flash.utils.Dictionary;

	public class HashMap
	{
		private var _weakKeys:Boolean;
		private var _content:Dictionary;
		private var _length:int;
		
		public function HashMap(weakKeys:Boolean = false)
		{
			_weakKeys = weakKeys;
			_content = new Dictionary(_weakKeys);
			_length = 0;
		}
		
		public function put(key:*, value:*):*
		{
			assert(key != null, "Hash map key can't be null");
			if(value == null)
			{
				return remove(key);
			}
			if((key in _content) == false)
			{
				_length += 1;
			}
			_content[key] = value;
			var oldValue:* = get(key);
			return oldValue;
		}
		
		public function putAll(hashMap:HashMap):void
		{
			for(var key:* in hashMap)
			{
				put(key, hashMap.get(key));
			}
		}
		
		public function get(key:*):*
		{
			var value:* = _content[key];
			return value === undefined ? null : value;
		}
		
		public function get length():int
		{
			return _length;
		}
		
		public function get isEmpty():Boolean
		{
			return _length == 0;
		}
		
		public function remove(key:*):*
		{
			var value:* = _content[key];
			if(value == undefined)
			{
				return null;
			}
			_length -= 1;
			delete _content[key];
			return value;
		}
		
		public function clear():void
		{
			_length = 0;
			_content = new Dictionary(_weakKeys);
		}
		
		public function containsKey(key:*):Boolean
		{
			return key in _content;
		}
		
		public function containsValue(value:*):Boolean
		{
			for(var key:* in _content)
			{
				if(_content[key] == value)
				{
					return true;
				}
			}
			return false;
		}
		
		public function getKeys():Array
		{
			var result:Array = new Array();
			for(var key:* in _content)
			{
				result.push(key);
			}
			return result;
		}
		
		public function getValues():Array
		{
			var result:Array = new Array();
			for(var key:* in _content)
			{
				result.push(_content[key]);
			}
			return result;
		}
		
		public function clone():HashMap
		{
			var result:HashMap = new HashMap(_weakKeys);
			for(var key:* in _content)
			{
				result.put(key, _content[key]);
			}
			return result;
		}
		
		public function toString():String
		{
			var result:String = "";
			result += "HashMap Content:\n";
			for(var key:* in _content)
			{
				result += key + " -> " + _content[key] + "\n";
			}
			return result;
		}
	}
}