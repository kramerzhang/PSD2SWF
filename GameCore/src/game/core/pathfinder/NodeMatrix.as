package game.core.pathfinder
{
	import flash.geom.Point;
	
	import game.core.pool.ObjectPool;
	import game.core.util.HashMap;
	import game.core.util.assert;

	internal class NodeMatrix
	{
		public static const BLOCK:int 		= 0;
		public static const WLAKABLE:int 	= 1;
		
		private static const STEP_WEIGHT:Array 	= [1, 1, 1, 1];
		private static const MOVE_STEP:Array 	= [[-1, 0], [1, 0], [0, -1], [0, 1]];
		
		private var _data:Vector.<Vector.<int>>;
		private var _width:int;
		private var _height:int;
		
		//keep sorted
		private var _openedNodeVec:Vector.<Node>;
		private var _nodeMap:HashMap;
		private var _nodePool:ObjectPool;
		
		private var _startNode:Node;
		private var _targetNode:Node;
		private var _heuristic:IHeuristic;
		
		public function NodeMatrix()
		{
			initialize();
		}
		
		private function initialize():void
		{
			_nodeMap = new HashMap();
			_nodePool = new ObjectPool(Node);
		}
		
		public function setData(data:Vector.<Vector.<int>>):void
		{
			_data = data;
			_width = _data[0].length;
			_height = _data.length;
			reset();
		}
		
		public function set start(value:Point):void
		{
			_startNode = getNode(value.x, value.y);
			assert(_startNode != null, "invalid start point");
			_openedNodeVec.push(_startNode);
		}
		
		public function set target(value:Point):void
		{
			_targetNode = getNode(value.x, value.y);
			assert(_targetNode != null, "invalid target point");
		}
		
		public function set heuristic(value:IHeuristic):void
		{
			_heuristic = value;
		}
		
		private function getNodeAdjacent(currentNode:Node):Vector.<Node>
		{
			var result:Vector.<Node> = new Vector.<Node>();
			var len:int = MOVE_STEP.length;
			for(var i:int = 0; i < len; i++)
			{
				var u:int = currentNode.x + MOVE_STEP[i][0];
				var v:int = currentNode.y + MOVE_STEP[i][1];
				var node:Node = getNode(u, v);
				if(node == null || node.isVisited == true)
				{
					continue;
				}
				var g:Number = currentNode.g + STEP_WEIGHT[i];
				if(node.g == 0 || node.g > g)
				{
					//remove node if has been added to the openNodeVec
					//then will add it to the head of openNodeVec later
					removeNodeFromOpenVec(node); 
					node.g = g;
					node.h = _heuristic.evaluate(node, _targetNode);
					node.parent = currentNode;
					result.push(node);
				}
			}
			return result;
		}
		
		private function removeNodeFromOpenVec(node:Node):void
		{
			var index:int = _openedNodeVec.indexOf(node);
			if(index > -1)
			{
				_openedNodeVec.splice(index, 1);
			}
		}
		
		private function addNodeToOpenVec(node:Node):void
		{
			var len:int = _openedNodeVec.length;
			for(var i:int = (len - 1); i >= 0; i--)
			{
				var currentNode:Node = _openedNodeVec[i];
				if(node.f <= currentNode.f)
				{
					_openedNodeVec.splice((i + 1), 0, node);
					return;
				}
			}
			_openedNodeVec.unshift(node);
		}
		
		private function getNode(u:int, v:int):Node
		{
			if(isValid(u, v) == false)
			{
				return null;
			}
			var key:String = u + "_" + v;
			if(_nodeMap.containsKey(key) == false)
			{
				var node:Node = _nodePool.getObject() as Node;
				node.x = u;
				node.y = v;
				_nodeMap.put(key, node);
			}
			return _nodeMap.get(key);
		}
		
		public function isValid(u:int, v:int):Boolean
		{
			if(u < 0 || v < 0 || u > (_width - 1) || v > (_height - 1))
			{
				return false;
			}
			if(_data[v][u] == BLOCK)
			{
				return false;
			}
			return true;
		}
		
		public function findPath():Vector.<Node>
		{
			var result:Vector.<Node> = new Vector.<Node>();
			while(_openedNodeVec.length > 0)
			{
				var node:Node = _openedNodeVec.pop();
				node.isVisited = true;
				if(node == _targetNode)
				{
					result = constructPath(node);
					break;
				}
				var adjacentNodeVec:Vector.<Node> = getNodeAdjacent(node);
				for each(var adjacentNode:Node in adjacentNodeVec)
				{
					addNodeToOpenVec(adjacentNode);
				}
			}
			reset();
			return result;
		}
		
		private function constructPath(node:Node):Vector.<Node>
		{
			var result:Vector.<Node> = new Vector.<Node>();
			while(node != null)
			{
				result.unshift(node);
				node = node.parent;
			}
			return result;
		}
		
		private function reset():void
		{
			var nodeArr:Array = _nodeMap.getValues();
			for each(var node:Node in nodeArr)
			{
				_nodePool.recycle(node);
			}
			_nodeMap.clear();
			_openedNodeVec = new Vector.<Node>();
		}
		
	}
}