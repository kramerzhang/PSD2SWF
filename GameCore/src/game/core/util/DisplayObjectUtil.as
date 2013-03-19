package game.core.util
{
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.display.InteractiveObject;
	import flash.display.SimpleButton;
	import flash.filters.ColorMatrixFilter;
	import flash.geom.Rectangle;

	public class DisplayObjectUtil
	{
		public static function removeFromParent(displayObj:DisplayObject):void
		{
			if(displayObj != null && displayObj.parent != null)
			{
				displayObj.parent.removeChild(displayObj);
			}
		}
		
		public static function disableDisplayObject(displayObj:DisplayObject):void
		{
			if(displayObj is InteractiveObject)
			{
				(displayObj as InteractiveObject).mouseEnabled = false;
			}
			if(displayObj is DisplayObjectContainer)
			{
				(displayObj as DisplayObjectContainer).mouseChildren = false;
			}
			if(displayObj is SimpleButton)
			{
				(displayObj as SimpleButton).enabled = false;
			}
		}
		
		public static function enableDisplayObject(displayObj:DisplayObject):void
		{
			if(displayObj is InteractiveObject)
			{
				(displayObj as InteractiveObject).mouseEnabled = true;
			}
			if(displayObj is DisplayObjectContainer)
			{
				(displayObj as DisplayObjectContainer).mouseChildren = true;
			}
			if(displayObj is SimpleButton)
			{
				(displayObj as SimpleButton).enabled = true;
			}
		}
		
		public static function grayDisplayObject(displayObj:DisplayObject):void
		{
			var grayParam:Array = [0.33, 0.33, 0.33, 0, 0,
								   0.33, 0.33, 0.33, 0, 0,
								   0.33, 0.33, 0.33, 0, 0,
								   0, 0, 1, 0];
			var grayFilter:ColorMatrixFilter = new ColorMatrixFilter(grayParam);
			displayObj.filters = [grayFilter];
		}
		
		public static function ungrayDisplayObject(displayObj:DisplayObject):void
		{
			var filterArr:Array = displayObj.filters;
			var len:int = filterArr.length;
			for(var i:int = 0; i < len; i++)
			{
				var grayFilter:ColorMatrixFilter = filterArr[i] as ColorMatrixFilter;
				if(grayFilter != null)
				{
					filterArr.splice(i, 1);
				}
			}
			displayObj.filters = filterArr;
		}
		
		public static function bringToTop(displayObj:DisplayObject):void
		{
			var container:DisplayObjectContainer = displayObj.parent;
			if(container != null)
			{
				container.addChild(displayObj);
			}
		}
		
		public static function removeAllChildren(container:DisplayObjectContainer):void
		{
			while(container.numChildren > 0)
			{
				container.removeChildAt(0);
			}
		}
		
		public static function align(displayObj:DisplayObject, bounds:Rectangle, alignType:String = "mc"):void
		{
			var alignBounds:Rectangle;
			alignBounds = bounds;
			var verticalAlign:String = alignType.substr(0, 1);
			var horizontalAlign:String = alignType.substr(1, 1);
			var x:int = getX(horizontalAlign, displayObj, alignBounds);
			var y:int = getY(verticalAlign, displayObj, alignBounds);
			displayObj.x = x;
			displayObj.y = y;
		}
		
		private static function getY(veriticalAlign:String, displayObj:DisplayObject, bounds:Rectangle):int
		{
			var displayObjBounds:Rectangle = displayObj.getBounds(displayObj);
			switch(veriticalAlign)
			{
				case "t":
					return bounds.y;
				case "m":
					return bounds.y + (bounds.height - displayObjBounds.height) * 0.5;
				case "b":
					return bounds.y + (bounds.height - displayObjBounds.height);
			}
			return bounds.y + (bounds.height - displayObjBounds.height) * 0.5;
		}
		
		private static function getX(horizontalAlign:String, displayObj:DisplayObject, bounds:Rectangle):int
		{
			var displayObjBounds:Rectangle = displayObj.getBounds(displayObj);
			switch(horizontalAlign)
			{
				case "l":
					return bounds.x;
				case "c":
					return bounds.y + (bounds.width - displayObjBounds.width) * 0.5;
				case "r":
					return bounds.y + (bounds.width - displayObjBounds.width);
			}
			return bounds.y + (bounds.width - displayObjBounds.width) * 0.5;
		}
	
	}
}