package game.component
{
	/**
	 * 
	 * @author Kramer(QQ:21524742)
	 * 
	 */	
	public class ComboBoxListItemBase extends ListItemBase
	{
		protected var _label:String;
		
		public function ComboBoxListItemBase()
		{
			super();
		}
		
		public function set label(value:String):void
		{
			_label = value;
		}
		
		public function get label():String
		{
			return _label;
		}
	}
}