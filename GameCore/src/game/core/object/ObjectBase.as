package game.core.object
{
	import game.core.core.IDisposable;
	import game.core.message.MessageHud;

	public class ObjectBase implements IDisposable
	{
		private var _id:Number = 0;
		private var _category:String = "";
		
		public function ObjectBase()
		{
		}
		
		public function set id(value:Number):void
		{
			_id = value;
		}
		
		public function get id():Number
		{
			return _id;
		}
		
		public function set category(value:String):void
		{
			_category = value;
		}
		
		public function get category():String
		{
			return _category;
		}
		
		public function getObjectUID():String
		{
			return _category + "_" + _id;
		}
		
		public function addPropertyChangeCallback(propertyName:String, callback:Function):void
		{
			var messageName:String = generateMessageName(propertyName);
			MessageHud.addListener(this, messageName, callback, 0, [this]);
		}
		
		public function removePropertyChangeCallback(propertyName:String, callback:Function):void
		{
			var messageName:String = generateMessageName(propertyName);
			MessageHud.removeListener(this, messageName, callback);
		}
		
		private function generateMessageName(propertyName:String):String
		{
			return getObjectUID() + "_" + propertyName + "_change";
		}
		
		public function dispatchPropertyChangeMessage(propertyName:String):void
		{
			var messageName:String = generateMessageName(propertyName);
			MessageHud.dispatch(this, messageName);
		}
		
		public function dispose():void
		{
			MessageHud.removeObjectListener(this);
		}
		
	}
}