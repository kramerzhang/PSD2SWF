package game.core.util
{
	
	import flash.geom.Point;

	/**
	 *@author Kramer(QQ:21524742)
	 */	
	public class StringUtil
	{
		public static const COLON:String = ":";
		public static const EMPTY:String = "";
		
		public function StringUtil()
		{
		}
		
		public static function trimRight(str:String):String
		{
			return str.replace(/\s+$/, "");
		}
		
		public static function trimLeft(str:String):String
		{
			return str.replace(/^\s+/, "");
		}
		
		public static function trim(str:String):String
		{
			return trimLeft(trimRight(str));
		}
		
		public static function pad(str:String, token:String, targetLength:int, isAddToTail:Boolean = true):String
		{
			var result:String = str;
			while(result.length < targetLength)
			{
				if(isAddToTail)
				{
					result = result + token;
				}
				else
				{
					result = token + result;
				}
			}
			return result;
		}
		
		public static function splice(sourceStr:String, startIndex:int, deleteCount:int, insertStr:String):String
		{
			if((startIndex < 0) ||(startIndex > sourceStr.length))
			{
				return EMPTY;
			}
			if((deleteCount < 0) || (deleteCount > (sourceStr.length - startIndex)))
			{
				return EMPTY;
			}
			var leftStr:String = sourceStr.slice(0, startIndex);
			var rightStr:String = sourceStr.slice(startIndex + deleteCount);
			return leftStr + insertStr + rightStr;
		}
		
		public static function verifyEmailAddress(emailAdress:String):Boolean
		{
			var emailRegExp:RegExp = /\b[A-Z0-9._%-]+@[A-Z0-9.-]+\.[A-Z]{2,4}\b/i;
			return emailRegExp.test(emailAdress);
		}
		
		/**
		 * replace the variable placeholder "${variable}"
		 * 
		 * @return string after replacing
		 */ 
		public static function replaceVariables(str:String, sourceObj:Object, escapeVars:Boolean = false):String
		{
			var resultStr:String = str;
			for(var i:String in sourceObj)
			{
				var patternStr:String = "\\$\\{" + i + "\\}";
				var pattern:RegExp = new RegExp(patternStr, "g");
				resultStr = resultStr.replace(pattern, String(sourceObj[i]));
			}
			if(escapeVars)
			{
				return escape(resultStr);
			}
			return resultStr;
		}
		
		public static function endWith(source:String, endStr:String):Boolean
		{
			var lastIndex:int = source.lastIndexOf(endStr);
			if((lastIndex + endStr.length) == source.length)
			{
				return true;
			} 
			return false;
		}
		
		public static function startWith(source:String, startStr:String):Boolean
		{
			var firstIndex:int = source.indexOf(startStr);
			if(firstIndex == 0)
			{
				return true;
			}
			return false;
		}
		
		public static function isInteger(source:String):Boolean
		{   
			var pattern:RegExp = /^[-\+]?\d+$/;    
			return pattern.test(source);
		}
		
		public static function isDigital(str:String):Boolean
		{
			var pattern:RegExp = /\D/g;
			return !pattern.test(str);
		}
		
		private static const TOKEN_STRING:String = "%s";
		private static const TOKEN_NUMBER:String = "%d";
		private static const TOKEN_PATTERN:RegExp = /%s|%d/g;
		public static function format(str:String, ...args):String
		{
			var result:String = str;
			var matchArr:Array = str.match(TOKEN_PATTERN);
			assert(matchArr.length == args.length, "args length not match the token number in the string");
			var len:int = matchArr.length;
			for(var i:int = 0; i < len; i++)
			{
				var match:String = matchArr[i];
				if(match == TOKEN_STRING && typeof(args[i]) != "string")
				{
					throw new ArgumentError("args[" + i +"] String expect, got number");
				}
				else if(match == TOKEN_NUMBER && typeof(args[i]) != "number")
				{
					throw new ArgumentError("args[" + i +"] Number expect, got String");
				}
				result = result.replace(match, args[i]);
			}
			return result;
		}

		public static function stripHTML(str:String):String
		{
			return str.replace(/<.*?>/g, "");
		}
	}
}
