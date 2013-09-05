package game.core.pathfinder
{
	public class ManhattanHeuristic implements IHeuristic
	{
		public function ManhattanHeuristic()
		{
		}
		
		public function evaluate(currentNode:Node, targetNode:Node):Number
		{
			return Math.abs(currentNode.x - targetNode.x) + Math.abs(currentNode.y - targetNode.y);
		}
	}
}