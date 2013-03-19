package game.core.sharedObject
{
	import flash.net.SharedObject;

	public class SharedObjectManager
	{
		private static const COMMON_FOLDER_NAME:String = "common";
		
		private static var _userName:String = "anonymous";
		
		public static function setUserName(userName:String):void
		{
			_userName = userName;
		}
		
		public static function getCommonSharedObject(name:String):SharedObject
		{
			var so:SharedObject = null;
			try
			{
				so = SharedObject.getLocal(COMMON_FOLDER_NAME + "/" + name, "/"); 	
			}
			catch(err:Error)
			{
				//when the space for local sharedObject is 0K 
			}
			return so;
		}
		
		public static function getUserSharedObject(name:String):SharedObject
		{
			var so:SharedObject = null;
			try
			{
				so = SharedObject.getLocal(_userName + "/" + name, "/"); 
			}
			catch(err:Error)
			{
				//when the space for local sharedObject is 0K 
			}
			return so;
		}
	}
}