package game.core.log.appender
{
	/**
	 *@author Kramer(QQ:21524742)
	 */	
	import game.core.log.IAppender;
	
	import flash.events.StatusEvent;
	import flash.net.LocalConnection;

	public class LocalConnectionAppender implements IAppender
	{
		private static const CONNECTION_NAME:String = "LocalDebugConsole";
		private static var _clientId:int;
		private static var _textColor:uint;
		private var _connection:LocalConnection;
		
		initialize();
		private static function initialize():void
		{
			//A to Z
			_clientId = 65 + int(Math.random() * 26);
			_textColor = (int(Math.random() * 0x99) << 16) | (int(Math.random() * 0x99) << 8) | (int(Math.random() * 0x99));
		}
		
		public function LocalConnectionAppender()
		{
			_connection = new LocalConnection();
			_connection.addEventListener(StatusEvent.STATUS, onConnectStatus);
		}
		
		private function onConnectStatus(evt:StatusEvent):void
		{
			switch(evt.level)
			{
				case "status":
					//trace("Connection Successed");
					break;
				case "error":
					//trace("Connection Failed");
					break;
			}
		}
		
		public function append(msg:String):void
		{
			_connection.send(CONNECTION_NAME, "printLog", "<font color='#"+ _textColor.toString(16) +"' size='12'>Client " + String.fromCharCode(_clientId) + " " + msg + "</font>");
		}
	}
}