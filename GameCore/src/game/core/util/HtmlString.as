package game.core.util
{
	public class HtmlString
	{
		private var _content:String;
		private var _color:uint;
		private var _bold:Boolean;
		private var _link:String;
		private var _target:String;
		
		public function HtmlString(content:String, color:uint = 0x000000)
		{
			_content = content;
			_color = color;
		}
		
		public function set color(value:uint):void
		{
			_color = value;
		}
		
		public function set event(value:String):void
		{
			setLink("event:" + value, "");
		}
		
		public function setLink(value:String, target:String = "_self"):void
		{
			_link = value;
			_target = target;
		}
		
		public function set bold(value:Boolean):void
		{
			_bold = value;
		}
		
		public function toString():String
		{
			var result:String = "<font color='#" + _color.toString(16) + "'";
			result += ">";
			if(_bold == true)
			{
				_content = "<b>" + _content + "</b>";
			}
			if(_link != null)
			{
				_content = "<a " + "href='" + _link + "'" + " target='" + _target + "'>" + _content + "</a>";
			}
			result += _content;
			result += "</font>";
			return result;
		}
	}
}