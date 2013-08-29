package comboBox
{
	import game.component.ComboBoxListItemBase;
	import game.component.Image;
	import game.component.Label;
	
	public class ComboBoxListItem extends ComboBoxListItemBase
	{
		private var _nameLabel:Label;
		private var _back:Image;
		public function ComboBoxListItem()
		{
			super();
		}
		
		protected override function configChildren():void
		{
			_nameLabel = getChildByName("txtwanjiaming") as Label;
			_back = getChildByName("tipsdianxuanzhong") as Image;
			_back.visible = false;
		}
		
		public override function set data(value:Object):void
		{
			super.data = value;
			this.label = value.label;
		}
		
		public override function set label(value:String):void
		{
			super.label = value;
			_nameLabel.text = value;
		}
		
		public override function set selected(value:Boolean):void
		{
			super.selected = value;
			if(value == true)
			{
				_back.visible = true;
			}
			else
			{
				_back.visible = false;
			}
		}
	}
}