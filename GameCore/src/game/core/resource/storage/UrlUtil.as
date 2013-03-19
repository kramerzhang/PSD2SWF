package game.core.resource.storage
{
	import flash.utils.Dictionary;

	internal class UrlUtil
	{
		/*
		url with version number: http://www.domain.com/assets/ui/main_v2937.swf
		original url:            http://www.domain.com/assets/ui/main.swf	
		*/
		//reserved
		public static const VER_TOKEN:String = "_v";
		
		//key: original url, value: version number
		private static var _data:Dictionary;
		
		public static function getVersionByUrl(url:String):int
		{
			var lastTokenIndex:int = url.lastIndexOf(VER_TOKEN);
			if(lastTokenIndex != -1)
			{
				var lastDotIndex:int = url.lastIndexOf(".");
				return int(url.substring(lastTokenIndex + 2, lastDotIndex));
			}
			return 0;
		}
		
		public static function getOriginalUrl(url:String):String
		{
			var pattern:RegExp =/_v\d*?\./;
			return url.replace(pattern, ".");
		}
	}
}