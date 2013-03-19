package game.core.objectProxy
{
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	import flash.utils.Proxy;
	import flash.utils.flash_proxy;
	
	[Event(name="propertyChange", type="game.core.objectProxy.PropertyChangeEvent")]
	public dynamic class ObjectProxy extends Proxy implements IEventDispatcher
	{
		protected var _propertyList:Array;
		protected var _dispatcher:EventDispatcher;
		protected var _obj:Object;
		
		public function ObjectProxy(obj:Object = null)
		{
			_propertyList = new Array();
			if(obj == null)
			{
				obj = new Object();
			}
			_obj = obj;
			_dispatcher = new EventDispatcher(this);
		}
		
		override flash_proxy function getProperty(name:*):*
		{
			return _obj[name];
		}
		
		override flash_proxy function callProperty(name:*, ...parameters):*
		{
			return _obj[name].apply(_obj, parameters);
		}
		
		override flash_proxy function deleteProperty(name:*):Boolean
		{
			var oldVal:* = _obj[name];
			var deleted:Boolean = delete _obj[name]; 
			if (_dispatcher.hasEventListener(PropertyChangeEvent.PROPERTY_CHANGE))
			{
				var evt:PropertyChangeEvent = new PropertyChangeEvent(PropertyChangeEvent.PROPERTY_CHANGE);
				evt.kind = PropertyChangeEventKind.DELETE;
				evt.property = name;
				evt.oldValue = oldVal;
				evt.source = this;
				_dispatcher.dispatchEvent(evt);
			}
			return deleted;
		}
		
		override flash_proxy function hasProperty(name:*):Boolean
		{
			return (name in _obj);
		}
		
		override flash_proxy function nextName(index:int):String
		{
			return _propertyList[index - 1];
		}
		
		override flash_proxy function nextNameIndex(index:int):int
		{
			if (index == 0)
			{
				setupPropertyList();
			}
			if (index < _propertyList.length)
			{
				return index + 1;
			}
			else
			{
				return 0;
			}
		}
		
		override flash_proxy function nextValue(index:int):*
		{
			return _obj[_propertyList[index -1]];
		}
		
		override flash_proxy function setProperty(name:*, value:*):void
		{
			var oldValue:* = _obj[name];
			_obj[name] = value;
			if(_dispatcher.hasEventListener(PropertyChangeEvent.PROPERTY_CHANGE))
			{
				_dispatcher.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, name, oldValue, _obj[name]));
			}
		}
		
		private function setupPropertyList():void
		{
			_propertyList = new Array();
			for(var property:String in _obj)
			{
				_propertyList.push(property);
			}
		}
		
		public function addEventListener(type:String, listener:Function, useCapture:Boolean=false, priority:int=0, useWeakReference:Boolean=false):void
		{
			_dispatcher.addEventListener(type, listener, useCapture, priority, useWeakReference);
		}
		
		public function removeEventListener(type:String, listener:Function, useCapture:Boolean=false):void
		{
			_dispatcher.removeEventListener(type, listener, useCapture);
		}
		
		public function dispatchEvent(event:Event):Boolean
		{
			return _dispatcher.dispatchEvent(event);
		}
		
		public function hasEventListener(type:String):Boolean
		{
			return _dispatcher.hasEventListener(type);
		}
		
		public function willTrigger(type:String):Boolean
		{
			return _dispatcher.willTrigger(type);
		}
	}
}