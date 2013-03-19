package game.core.message
{
	import game.core.util.HashMap;

	public class Message
	{
		private static var _map:HashMap = new HashMap();
		
		public static function addListener(obj:Object, messageName:String, func:Function, priority:int = 0, paramList:Array = null):void
		{
			var messageObjListMap:HashMap = _map.get(obj) as HashMap;
			if(messageObjListMap == null)
			{
				messageObjListMap = new HashMap();
				_map.put(obj, messageObjListMap);
			}
			var messageObjList:Vector.<MessageObject> = messageObjListMap.get(messageName) as Vector.<MessageObject>;
			if(messageObjList == null)
			{
				messageObjList = new Vector.<MessageObject>();
				messageObjListMap.put(messageName, messageObjList);
			}
			if(findMessageObjectByCallback(messageObjList, func) == -1)
			{
				var messageObj:MessageObject = new MessageObject(func, priority, paramList);
				messageObjList.push(messageObj);
				messageObjList.sort(messageObjectSort);
			}
		}
		
		private static function findMessageObjectByCallback(source:Vector.<MessageObject>, callback:Function):int
		{
			var len:int = source.length;
			for(var i:int = 0; i < len; i++)
			{
				if(source[i].callback == callback)
				{
					return i;
				}
			}
			return -1;
		}
		
		private static function messageObjectSort(a:MessageObject, b:MessageObject):int
		{
			if(a.priority > b.priority)
			{
				return -1;
			}
			else if(a.priority < b.priority)
			{
				return 1;
			}
			return 0;
		}
		
		public static function dispatch(obj:Object, messageName:String, message:Object = null):void
		{
			var messageObjListMap:HashMap = _map.get(obj) as HashMap;
			if(messageObjListMap == null)
			{
				return;
			}
			var messageObjList:Vector.<MessageObject> = messageObjListMap.get(messageName) as Vector.<MessageObject>;
			if(messageObjList == null)
			{
				return;
			}
			var len:int = messageObjList.length;
			for(var i:int = 0; i < len; i++)
			{
				var messageObj:MessageObject = messageObjList[i];
				if(messageObj.paramList != null)
				{
					messageObj.callback.apply(null, messageObj.paramList);
				}
				else
				{
					if(message != null)
					{
						messageObj.callback(message);
					}
					else
					{
						messageObj.callback();
					}
				}
			}
		}
		
		public static function removeListener(obj:Object, messageName:String, func:Function = null):void
		{
			var messageObjListMap:HashMap = _map.get(obj) as HashMap;
			if(messageObjListMap == null)
			{
				return;
			}
			var messageObjList:Vector.<MessageObject> = messageObjListMap.get(messageName) as Vector.<MessageObject>;
			if(messageObjList == null)
			{
				return;
			}
			
			if(func == null)
			{
				messageObjList.length = 0;
			}
			else
			{
				var index:int = findMessageObjectByCallback(messageObjList, func);
				if(index != -1)
				{
					messageObjList.splice(index, 1);
				}
			}
		}
		
		public static function removeObjectListener(obj:Object):void
		{
			_map.remove(obj);
		}
	}
}