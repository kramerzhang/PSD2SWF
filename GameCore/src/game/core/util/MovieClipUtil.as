package game.core.util
{
	import flash.display.MovieClip;
	import flash.events.Event;

	public class MovieClipUtil
	{
		
		public static function playToStop(mc:MovieClip, frameNum:int, callback:Function = null):void
		{
			if(mc.currentFrame == frameNum)
			{
				mc.stop();
				if(callback != null)callback();
				return;
			}
			
			mc.play();
			var onEnterFrame:Function = function (evt:Event):void
			{
				var target:MovieClip = evt.target as MovieClip;
				if(target.currentFrame == frameNum)
				{
					mc.stop();
					if(callback != null)
					{
						callback();
					}
					target.removeEventListener(Event.ENTER_FRAME, onEnterFrame);
				}
			}
			var onRemovedFromStage:Function = function(evt:Event):void
			{
				var target:MovieClip = evt.target as MovieClip;
				target.removeEventListener(Event.ENTER_FRAME, onEnterFrame);
				target.removeEventListener(Event.REMOVED_FROM_STAGE, onRemovedFromStage);
			}
			mc.addEventListener(Event.ENTER_FRAME, onEnterFrame);
			mc.addEventListener(Event.REMOVED_FROM_STAGE, onRemovedFromStage);
		}
		
		public static function executeAtFrame(mc:MovieClip, frameNum:int, callback:Function, totalCount:int = 1):void
		{
			var count:int = 0;
			var onEnterFrame:Function = function (evt:Event):void
			{
				var target:MovieClip = evt.target as MovieClip;
				if(target.currentFrame == frameNum)
				{
					callback();
					count++;
					if(count >= totalCount)
					{
						target.removeEventListener(Event.ENTER_FRAME, onEnterFrame);
					}
				}
			}
			var onRemovedFromStage:Function = function(evt:Event):void
			{
				var target:MovieClip = evt.target as MovieClip;
				target.removeEventListener(Event.ENTER_FRAME, onEnterFrame);
				target.removeEventListener(Event.REMOVED_FROM_STAGE, onRemovedFromStage);
			}
			mc.addEventListener(Event.ENTER_FRAME, onEnterFrame);
			mc.addEventListener(Event.REMOVED_FROM_STAGE, onRemovedFromStage);
		}
		
		public static function executeAtLabel(mc:MovieClip, label:String, callback:Function, totalCount:int = 1):void
		{
			var count:int = 0;
			var onEnterFrame:Function = function (evt:Event):void
			{
				var target:MovieClip = evt.target as MovieClip;
				if(target.currentLabel == label)
				{
					callback();
					count++;
					if(count >= totalCount)
					{
						target.removeEventListener(Event.ENTER_FRAME, onEnterFrame);
					}
				}
			}
			var onRemovedFromStage:Function = function(evt:Event):void
			{
				var target:MovieClip = evt.target as MovieClip;
				target.removeEventListener(Event.ENTER_FRAME, onEnterFrame);
				target.removeEventListener(Event.REMOVED_FROM_STAGE, onRemovedFromStage);
			}
			mc.addEventListener(Event.ENTER_FRAME, onEnterFrame);
			mc.addEventListener(Event.REMOVED_FROM_STAGE, onRemovedFromStage);
		}
		
	}
}
