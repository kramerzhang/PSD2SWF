package list
{
	import game.component.Label;
	import game.component.ListItemBase;
	
	public class ListItem extends ListItemBase
	{
		private var _nameLabel:Label;
		
		public function ListItem()
		{
			super();
		}
		
		protected override function configChildren():void
		{
			_nameLabel = getChildByName("haoyoumingzi") as Label;
		}
		
		public override function set data(value:Object):void
		{
			super.data = value;
			_nameLabel.text = value.label;
		}
	}
}