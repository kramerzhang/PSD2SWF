package game.core.pathfinder
{
	public interface IHeuristic
	{
		function evaluate(currentNode:Node, targetNode:Node):Number
	}
}