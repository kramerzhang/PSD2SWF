package game.component
{
	/**
	 * @author Kramer(QQ:21524742)
	 * LabelButton必须含有Label子组件，并且只具有normal态
	 */	
	public class LabelButton extends Button
	{
		public function LabelButton()
		{
			super();
		}
		
		public function set label(value:String):void
		{
			validate();
			_labelDisplay.skin[Button.STATE_NORMAL].content = value;
		}
		
		public function get label():String
		{
			validate();
			return _labelDisplay.skin[Button.STATE_NORMAL].content;
		}
		
		private function validate():void
		{
			if(_labelDisplay == null)
			{
				throw new Error("找不到LabelButton组件Label子组件！");
			}
		}
	}
}