package game.core.pathfinder
{
	import flash.geom.Point;

	public class Pathfinder
	{
		private static var _nodeMatrix:NodeMatrix;
		
		public function Pathfinder()
		{
		}
		
		initialize();
		
		private static function initialize():void
		{
			_nodeMatrix = new NodeMatrix();
			_nodeMatrix.heuristic = new ManhattanHeuristic();
		}
		
		public static function setMap(map:IPathFindableMap):void
		{
			_nodeMatrix.setData(map.getPathData());
		}
		
		public static function findPath(start:Point, target:Point):Vector.<Point>
		{
			if(_nodeMatrix.isValid(start.x, start.y) == false
				|| _nodeMatrix.isValid(target.x, target.y) == false)
			{
				return new Vector.<Point>();
			}
			_nodeMatrix.start = start;
			_nodeMatrix.target = target;
			var path:Vector.<Node> = _nodeMatrix.findPath();
			if(path.length > 1)
			{
				return optimizePath(path);
			}
			return Vector.<Point>([target]);
		}
		
		private static function optimizePath(path:Vector.<Node>):Vector.<Point>
		{
			var result:Vector.<Point> = new Vector.<Point>();
			var du:int = int.MAX_VALUE;
			var dv:int = int.MAX_VALUE;
			var len:int = path.length;
			for(var i:int = 1; i < len; i++)
			{
				var newDu:int = path[i].x - path[i - 1].x;
				var newDv:int = path[i].y - path[i - 1].y;
				if(newDu != du || newDv != dv)
				{
					du = newDu;
					dv = newDv;
					result.push(new Point(path[i - 1].x, path[i - 1].y));
				}
			}
			result.push(new Point(path[len - 1].x, path[len - 1].y));
			return result;
		}
		
		/*
		public static function setHeuristic(value:IHeuristic):void
		{
			_nodeMatrix.heuristic = value;
		}
		*/
	}
}