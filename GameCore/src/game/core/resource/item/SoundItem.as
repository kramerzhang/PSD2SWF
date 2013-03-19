package game.core.resource.item
{
	/**
	 *@author Kramer(QQ:21524742)
	 */	
	import flash.errors.IOError;
	import flash.events.ErrorEvent;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IOErrorEvent;
	import flash.events.ProgressEvent;
	import flash.media.Sound;
	import flash.media.SoundLoaderContext;
	import flash.net.URLRequest;
	
	import game.core.pool.IPoolableObject;
	import game.core.pool.ObjectPoolManager;
	import game.core.resource.constant.ResourceType;
	import game.core.resource.events.ResourceEvent;
	
	[Event(name="progress", type = "flash.events.ProgressEvent")]
	[Event(name="error", type = "flash.events.ErrorEvent")]
	[Event(name="open", type = "flash.events.Event")]
	[Event(name="complete", type = "game.core.resource.events.ResourceEvent")]
	public class SoundItem extends EventDispatcher implements ILoadable, IPoolableObject
	{
		private static const BUFFER_TIME:int = 2000;
		private var _url:String;
		private var _sound:Sound;
		private var _priority:int;
		private var _isDuplicate:Boolean;
		
		private var _startHandler:Function;
		private var _progressHandler:Function;
		private var _completeHandler:Function;
		private var _errorHandler:Function;
		
		public function SoundItem()
		{
			super(this);
			_sound = new Sound();
			addSoundEventListener();
		}
		
		public function load():void
		{
			var context:SoundLoaderContext = new SoundLoaderContext(BUFFER_TIME);
			_sound.load(new URLRequest(_url), context);
		}
		
		private function addSoundEventListener():void
		{
			_sound.addEventListener(Event.OPEN, onLoadStart);
			_sound.addEventListener(Event.COMPLETE, onLoadComplete);
			_sound.addEventListener(IOErrorEvent.IO_ERROR, onLoadError);
			_sound.addEventListener(ProgressEvent.PROGRESS, onLoadProgress);
		}
		
		private function removeSoundEventListener():void
		{
			_sound.removeEventListener(Event.OPEN, onLoadStart);
			_sound.removeEventListener(Event.COMPLETE, onLoadComplete);
			_sound.removeEventListener(IOErrorEvent.IO_ERROR, onLoadError);
			_sound.removeEventListener(ProgressEvent.PROGRESS, onLoadProgress);
		}
		
		private function onLoadStart(evt:Event):void
		{
			dispatchEvent(evt.clone());
		}
		
		private function onLoadError(evt:Event):void
		{
			dispatchEvent(new ErrorEvent(ErrorEvent.ERROR));
		}
		
		private function onLoadComplete(evt:Event):void
		{
			dispatchEvent(new ResourceEvent(ResourceEvent.COMPLETE, this.content));
		}
		
		private function onLoadProgress(evt:ProgressEvent):void
		{
			dispatchEvent(evt.clone());
		}
		
		public function cloneContent(item:ILoadable):void
		{
			var soundItem:SoundItem = item as SoundItem;
			_sound = soundItem._sound;
			addSoundEventListener();
		}
		
		public function get content():*
		{
			return _sound;
		}
		
		public function set url(value:String):void
		{
			_url = value;
		}
		
		public function get url():String
		{
			return _url;
		}
		
		public function set priority(value:int):void
		{
			_priority = value;
		}
		
		public function get priority():int
		{
			return _priority;
		}
		
		public function set isDuplicate(value:Boolean):void
		{
			_isDuplicate = value;
		}
		
		public function get isDuplicate():Boolean
		{
			return _isDuplicate;
		}
		
		public function get type():String
		{
			return ResourceType.SOUND;
		}
		
		public function cancel():Boolean
		{
			var result:Boolean = false;
			try
			{
				_sound.close();
				result = true;
			}
			catch(e:IOError)
			{
				//ignore
			}
			return result;
		}
		
		public function set startHandler(value:Function):void
		{
			_startHandler = value;
		}
		
		public function get startHandler():Function
		{
			return _startHandler;
		}
		
		public function set progressHandler(value:Function):void
		{
			_progressHandler = value;
		}
		
		public function get progressHandler():Function
		{
			return _progressHandler;
		}
		
		public function set completeHandler(value:Function):void
		{
			_completeHandler = value;
		}
		
		public function get completeHandler():Function
		{
			return _completeHandler;
		}
		
		public function set errorHandler(value:Function):void
		{
			_errorHandler = value;
		}
		
		public function get errorHandler():Function
		{
			return _errorHandler;
		}
		
		public function checkin():void
		{
			dispose();
		}
		
		public function checkout():void
		{
			_sound = new Sound();
			addSoundEventListener();
		}
		
		public function recycle():void
		{
			ObjectPoolManager.getInstance().recycle(SoundItem, this);
		}
		
		public function dispose():void
		{
			removeSoundEventListener();
			_url = null;
			_sound = null;
			_priority = 0;
			_isDuplicate = false;
			_startHandler = null;
			_progressHandler = null;
			_completeHandler = null;
			_errorHandler = null;
		}
	}
}