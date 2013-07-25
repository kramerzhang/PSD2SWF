package list
{
	import game.component.Label;
	import game.component.ListItemBase;
	
	public class TaskListItem extends ListItemBase
	{
		private var _nameTxt:Label;
		
		private var _temp:int = 0;
		public function TaskListItem()
		{
			super();
		}
		
		override protected function configChildren():void
		{
			_nameTxt = getChildByName("txtTaskName") as Label;
		}
		
		override public function set index(value:int):void
		{
			super.index = value;
			
		}
		
		public function set temp(value:int):void
		{
			_temp = value;
			_nameTxt.text = _temp.toString();
		}
		
		public function get temp():int
		{
			return _temp;
		}
	}
}