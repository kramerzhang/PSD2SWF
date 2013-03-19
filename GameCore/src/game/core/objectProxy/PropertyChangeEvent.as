package game.core.objectProxy
{
	import flash.events.Event;
	
	public class PropertyChangeEvent extends Event
	{
		public static const PROPERTY_CHANGE:String = "propertyChange";
		
		public var kind:String;
		public var property:Object;
		public var oldValue:Object;
		public var newValue:Object;
		public var source:Object;
		
		public function PropertyChangeEvent(type:String, 
											kind:String = "update", 
											property:Object = null, 
											oldValue:Object = null, 
											newValue:Object = null, 
											source:Object = null, 
											bubbles:Boolean = false, 
											cancelable:Boolean = false)
		{
			super(type, bubbles, cancelable);
			
			this.kind = kind;
			this.property = property;
			this.oldValue = oldValue;
			this.newValue = newValue;
			this.source = source;
		}
		
		override public function toString():String
		{
			return "PropertyChangeEvent,Kind:" + kind
				+ " property:" + property 
				+ " oldValue:" + oldValue 
				+ " newValue:" + newValue 
				+ " source:" + source;
		}
		
		override public function clone():Event
		{
			return new PropertyChangeEvent(type, kind, property, oldValue, newValue, source, bubbles, cancelable);
		}
		
		public static function createUpdateEvent(source:Object, property:Object, oldValue:Object, newValue:Object):PropertyChangeEvent
		{
			return new PropertyChangeEvent(PROPERTY_CHANGE, "update", property, oldValue, newValue, source);
		}
	}
}