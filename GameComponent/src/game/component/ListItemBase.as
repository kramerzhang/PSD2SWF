package game.component
{
	/**
	 * 
	 * @author Kramer(QQ:21524742)
	 * 
	 */	
	public class ListItemBase extends Container
	{
		protected var _selected:Boolean;
		protected var _data:Object;
		protected var _index:int;
		
		public function ListItemBase()
		{
			super();
		}
		
		protected override function configChildren():void
		{
			//start item own logic here
		}
		
		public function set selected(value:Boolean):void
		{
			_selected = value;
		}
		
		public function get selected():Boolean
		{
			return _selected;
		}
		
		public function set data(value:Object):void
		{
			_data = value;
		}
		
		public function get data():Object
		{
			return _data;
		}

		public function get index():int
		{
			return _index;
		}

		public function set index(value:int):void
		{
			_index = value;
		}

	}
}