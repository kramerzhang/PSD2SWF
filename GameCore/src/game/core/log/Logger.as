package game.core.log
{
	import game.core.log.appender.TraceAppender;

	/**
	 *@author Kramer(QQ:21524742)
	 */	
	public class Logger
	{
		private var _name:String;
		private var _appenders:Vector.<IAppender>;
		private var _level:int;
		
		public static function getLogger(name:String, useTraceAppender:Boolean = true):Logger
		{
			var logger:Logger = new Logger(name, new Blocker());
			if(useTraceAppender)
			{
				logger.addAppender(new TraceAppender());
			}
			return logger;
		}
		
		public function Logger(name:String, blocker:Blocker)
		{
			_name = name;
			_level = LogLevel.ALL;
			_appenders = new Vector.<IAppender>();
		}
		
		public function addAppender(appender:IAppender):void
		{
			_appenders.push(appender);
		}
		
		public function setLevel(level:int):void
		{
			_level = level;
		}
		
		public function debug(msg:String):void
		{
			log(LogLevel.DEBUG, msg);
		}
		
		public function info(msg:String):void
		{
			log(LogLevel.INFO, msg);
		}
		
		public function warn(msg:String):void
		{
			log(LogLevel.WARN, msg);
		}
		
		public function error(msg:String):void
		{
			log(LogLevel.ERROR, msg);
		}
		
		public function fatal(msg:String):void
		{
			log(LogLevel.FATAL, msg);
		}
		
		private function log(level:int, msg:String):void
		{			
			if(level < _level)
			{
				return;
			}
			var appenderMsg:String = preprocessMsg(level, msg);
			for each(var appender:IAppender in _appenders)
			{
				appender.append(appenderMsg);
			}
		}
		
		private function preprocessMsg(level:int, msg:String):String
		{
			var result:String =  "(" + _name + ")" + " " + msg;
			switch(level)
			{
				case LogLevel.DEBUG:
					result = "Debug: " + result;
					break;
				case LogLevel.INFO:
					result = "Info: " + result;
					break;
				case LogLevel.WARN:
					result = "Warn: " + result;
					break;
				case LogLevel.ERROR:
					result = "Error: " + result;
					break;
				case LogLevel.FATAL:
					result = "Fatal: " + result;
					break;
			}
			return result;
		}
	}
}
class Blocker{}
