package game.component
{
	/**
	 * @author Kramer(QQ:21524742)
	 */	
	import flash.debugger.enterDebugger;
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.system.ApplicationDomain;
	
	import game.component.core.ISkinnable;
	
	public class Component extends Sprite implements ISkinnable
	{
		public static const EVENT_TYPE_CHANGE:String 		= "change";
		public static const EVENT_TYPE_CONSTRUCT:String 	= "construct";
		public static const EVENT_CHANGE:Event 				= new Event(EVENT_TYPE_CHANGE);
		
		private static var _domain:ApplicationDomain; //所有UI面板资源放入该ApplicationDomain
		
		private var _skin:Object;
		private var _width:Number;
		private var _height:Number;
		private var _enabled:Boolean;
		
		public static function set domain(value:ApplicationDomain):void
		{
			_domain = value;
		}
		
		public static function get domain():ApplicationDomain
		{
			return _domain;
		}
		
		//--------------------------------------------------------
		//instance method
		//--------------------------------------------------------
		public function Component()
		{
			_enabled = true;
		}
		
		public function set skin(value:Object):void
		{
			_skin = value;
			this.name = _skin.name;
			this.x = _skin.x;
			this.y = _skin.y;
			_width = _skin.width;
			_height = _skin.height;
			if(_skin.children != null)
			{
				createChildren(_skin);
			}
			configChildren();
		}
		
		public function get skin():Object
		{
			return _skin;
		}
		
		private function createChildren(skin:Object):void
		{
			var children:Array = skin.children;
			var len:int = children.length;
			for(var i:int = len - 1; i >= 0; i--)
			{
				var childSkin:Object = children[i];
				var child:ISkinnable = ComponentFactory.createComponentByName(childSkin.name);
				if(child == null)
				{
					child = ComponentFactory.createComponentByType(childSkin.type);
				}
				child.skin = childSkin;
				addChild(child as DisplayObject);
			}
		}
		
		protected function configChildren():void
		{
			//子类中对元素建立引用入口
		}
		
		public override function set width(value:Number):void
		{
			super.width = value;
			_width = value;
		}
		
		public override function get width():Number
		{
			if(super.width > 0)
			{
				return super.width;
			}
			return _width;
		}
		
		public override function set height(value:Number):void
		{
			super.height = value;
			_height = value;
		}
		
		public override function get height():Number
		{
			if(super.height > 0)
			{
				return super.height;
			}
			return _height;
		}
		
		public function set enabled(value:Boolean):void
		{
			_enabled = value;
			this.mouseChildren = _enabled;
			this.mouseEnabled = _enabled;
		}
		
		public function get enabled():Boolean
		{
			return _enabled;
		}
	}
}