package game.core.pathfinder
{
	import game.core.pool.IPoolableObject;
	import game.core.util.StringUtil;
	
	internal class Node implements IPoolableObject
	{
		public var g:Number;
		public var h:Number;
		public var x:int; //horizontal index
		public var y:int; //vertical index
		public var isVisited:Boolean;
		public var parent:Node;
		
		public function Node()
		{
			initialize();
		}
		
		public function checkout():void
		{
			initialize();
		}
		
		private function initialize():void
		{
			g = 0;
			h = 0;
			x = 0;
			y = 0;
			isVisited = false;
			parent = null;
		}
		
		public function get f():Number
		{
			return g + h;
		}
		
		public function checkin():void
		{
		}
		
		public function dispose():void
		{
			initialize();
		}
		
		public function toString():String
		{
			return StringUtil.format("%d_%d ,f: %d, g: %d, h: %d", x, y, f, g, h);
		}
	}
}