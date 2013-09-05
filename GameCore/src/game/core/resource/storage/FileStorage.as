package game.core.resource.storage
{
	import flash.events.NetStatusEvent;
	import flash.net.SharedObject;
	import flash.net.SharedObjectFlushStatus;
	import flash.utils.ByteArray;
	
	import game.core.sharedObject.SharedObjectManager;

	public class FileStorage
	{
		public static const STATE_SUSPEND:int 	= 0;
		public static const STATE_ACCEPT:int 	= 1;
		public static const STATE_REJECT:int 	= 2;
		
		private static const BIG_VOLUME:int = 31457300;
		
		private static const ASSETS_SO_NAME:String = "AssetsVersion";
		
		private static const KEY_VERSION:String 	= "vresion";
		private static const KEY_STATE:String 		= "state";
		private static const KEY_DATA:String 		= "data";
		
		
		private static var _state:int;
		private static var _versionObj:SharedObject;
		private static var _isDevMode:Boolean = true;
		
		initialize();
		
		private static function initialize():void
		{
			_state = STATE_SUSPEND;
			_versionObj = SharedObjectManager.getCommonSharedObject(ASSETS_SO_NAME);
			if(_versionObj != null)
			{
				if(_versionObj.data[KEY_VERSION] == null)
				{
					_versionObj.data[KEY_VERSION] = new Object();
				}
				if(_versionObj.data[KEY_STATE] != null)
				{
					_state = _versionObj.data[KEY_STATE];
				}
				else
				{
					_versionObj.data[KEY_STATE] = _state;
				}
			}
		}
		
		public static function set isDevMode(value:Boolean):void
		{
			_isDevMode = value;
		}
		
		public static function get isDevMode():Boolean
		{
			return _isDevMode;
		}
		
		public static function get isNeedOpenSettingPanel():Boolean
		{
			return _state != STATE_ACCEPT && _isDevMode == false;
		}
		
		public static function askForStorageSpace():void
		{
			if(_isDevMode == true)
			{
				return;
			}
			if(_state == STATE_ACCEPT)
			{
				return;
			}
			try
			{
				var result:String = _versionObj.flush(BIG_VOLUME);
				if(result == SharedObjectFlushStatus.PENDING)
				{
					addStatusEventListener();
				}
				else
				{
					flushState(STATE_ACCEPT);
				}
			}
			catch(e:Error)
			{
				addStatusEventListener();
			}
		}
		
		private static function addStatusEventListener():void
		{
			_versionObj.addEventListener(NetStatusEvent.NET_STATUS, onStatusChange);
		}
		
		private static function onStatusChange(evt:NetStatusEvent):void
		{
			if(evt.info.code == "SharedObject.Flush.Success")
			{
				flushState(STATE_ACCEPT);
			}
			else if(evt.info.code == "SharedObject.Flush.Failed")
			{
				flushState(STATE_REJECT);
			}
		}
		
		private static function flushState(state:int):void
		{
			_state = state;
			_versionObj.data[KEY_STATE] = _state;
			_versionObj.flush();
		}
		
		public static function getState():int
		{
			return _state;
		}
		
		public static function getFile(url:String):ByteArray
		{
			if(_isDevMode == true)
			{
				return null;
			}
			if(_state != STATE_ACCEPT)
			{
				return null;
			}
			var originalUrl:String = UrlUtil.getOriginalUrl(url);
			var version:int = UrlUtil.getVersionByUrl(url);
			var storedVersion:int = getStoredFileVersion(originalUrl);
			if(version != storedVersion)
			{
				return null;
			}
			var fileSO:SharedObject = SharedObjectManager.getCommonSharedObject(originalUrl);
			if(fileSO != null)
			{
				return fileSO.data[KEY_DATA] as ByteArray;
			}
			return null;
		}
		
		public static function addFile(url:String, file:ByteArray):void
		{
			if(_isDevMode == true)
			{
				return;
			}
			if(_state != STATE_ACCEPT)
			{
				return;
			}
			var originalUrl:String = UrlUtil.getOriginalUrl(url);
			var version:int = UrlUtil.getVersionByUrl(url);
			var storedVersion:int = getStoredFileVersion(originalUrl);
			if(version != storedVersion)
			{
				updateFileVersion(originalUrl, version);
				var fileSO:SharedObject = SharedObjectManager.getCommonSharedObject(originalUrl);
				//if there is space in the originalUrl
				if(fileSO != null)
				{
					fileSO.data[KEY_DATA] = file;
					fileSO.flush();
				}
			}
		}
		
		private static function updateFileVersion(soName:String, version:int):void
		{
			_versionObj.data[KEY_VERSION][soName] = version;
		}
		
		private static function getStoredFileVersion(soName:String):int
		{
			var data:* = _versionObj.data[KEY_VERSION][soName]; 
			if(data == null)
			{
				return -1;
			}
			return int(data);
		}
		
		public static function clearAll():void
		{
			_versionObj.data[KEY_VERSION] = new Object();
		}

	}
}