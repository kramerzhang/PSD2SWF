package game.component
{
	/**
	 * @author Kramer(QQ:21524742)
	 * 生成并缓存九宫图片切片
	 * Grid表示源图片九宫切片定义的每个切片
	 * Slice表示目标图片中缩放后的每个切片
	 */	
	import flash.display.BitmapData;
	import flash.geom.Matrix;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import flash.system.ApplicationDomain;
	import flash.system.Capabilities;
	import flash.utils.Dictionary;

	public class BitmapDataCache
	{
		private static const SLICE_LIST_LENGTH:int 	= 9;
		private static const SPLIT_ROW_COUNT:int 	= 3;
		private static const SPLIT_COL_COUNT:int 	= 3;
		
		private static var _scaleBitmapDataMap:Dictionary;
		private static var _bitmapDataGridListMap:Dictionary;
		private static var _bitmapDataMap:Dictionary;
		
		//重用对象
		private static var _splitRow:Vector.<int>;
		private static var _splitCol:Vector.<int>;
		private static var _rect:Rectangle;
		private static var _dstPoint:Point;
		private static var _transformMatrix:Matrix;
				
		initialize();
		
		private static function initialize():void
		{
			_scaleBitmapDataMap = new Dictionary();
			_bitmapDataGridListMap = new Dictionary();
			_bitmapDataMap = new Dictionary();
			
			_splitRow = new Vector.<int>(SPLIT_ROW_COUNT + 1, true);
			_splitCol = new Vector.<int>(SPLIT_COL_COUNT + 1, true);
			_rect = new Rectangle();
			_dstPoint = new Point();
			_transformMatrix = new Matrix();
		}
		
		public static function getBitmapData(link:String):BitmapData
		{
			var result:BitmapData = _bitmapDataMap[link];
			if(result == null)
			{
				var domain:ApplicationDomain = Component.domain;
				if(domain == null)
				{
					throw new Error("尚未设置UI资源所放置的ApplicationDomain！");
				}
				if(domain.hasDefinition(link) == true)
				{
					var clz:Class = domain.getDefinition(link) as Class;
					result = new clz() as BitmapData;
					_bitmapDataMap[link] = result;
				}
				else
				{
					if(Capabilities.isDebugger == true)
					{
						throw new Error("图片资源 " + link + "不存在!");
					}
				}
			}
			return result;
		}
		
		public static function getScaleBitmapData(link:String, width:int, height:int, top:int, right:int, bottom:int, left:int):BitmapData
		{
			var result:BitmapData;
			var key:String = generateScaleBitmapDataKey(link, width, height);
			result = _scaleBitmapDataMap[key] as BitmapData;
			if(result == null)
			{
				result = createScaleBitmapData(link, width, height, top, right, bottom, left);
				_scaleBitmapDataMap[key] = result;
			}
			return result;
		}
		
		private static function createScaleBitmapData(link:String, width:int, height:int, top:int, right:int, bottom:int, left:int):BitmapData
		{
			if(width < (left + right))
			{
				width = left + right;
			}
			if(height < (top + bottom))
			{
				height = top + bottom;
			}
			var result:BitmapData = new BitmapData(width, height, true, 0);
			var gridList:Vector.<BitmapData> = getBitmapDataGridList(link, top, right, bottom, left);
			updateSplitData(width, height, top, right, bottom, left);
			for(var i:int = 0; i < SPLIT_COL_COUNT; i++)
			{
				for(var j:int = 0; j < SPLIT_ROW_COUNT; j++)
				{
					var grid:BitmapData = gridList[i * 3 + j];
					_transformMatrix.a = (_splitRow[j + 1] - _splitRow[j]) / grid.width;
					_transformMatrix.b = 0;
					_transformMatrix.c = 0;
					_transformMatrix.d = (_splitCol[i + 1] - _splitCol[i]) / grid.height;
					_transformMatrix.tx = _splitRow[j];
					_transformMatrix.ty = _splitCol[i];
					//Matrix.setTo,Flash Player 11 API
					//_transformMatrix.setTo((_splitRow[j + 1] - _splitRow[j]) / grid.width, 0, 0, (_splitCol[i + 1] - _splitCol[i]) / grid.height, _splitRow[j], _splitCol[i]);
					result.draw(grid, _transformMatrix);
				}
			}
			return result;
		}
		
		private static function getBitmapDataGridList(link:String, top:int, right:int, bottom:int, left:int):Vector.<BitmapData>
		{
			var key:String = generateGridListKey(link, top, right, bottom, left);
			var gridList:Vector.<BitmapData> = _bitmapDataGridListMap[key] as Vector.<BitmapData>;
			if(gridList == null)
			{
				gridList = createBitmapDataGridList(link, top, right, bottom, left);
				_bitmapDataGridListMap[key] = gridList;
			}
			return gridList;
		}
		
		private static function createBitmapDataGridList(link:String, top:int, right:int, bottom:int, left:int):Vector.<BitmapData>
		{
			var source:BitmapData = getBitmapData(link);
			if((top + bottom) >= source.height || (left + right) >= source.width)
			{
				throw new Error("Bitmap scale9Grid setting error!");
			}
			var result:Vector.<BitmapData> = new Vector.<BitmapData>(SLICE_LIST_LENGTH, true);
			updateSplitData(source.width, source.height, top, right, bottom, left);
			for(var i:int = 0; i < SPLIT_COL_COUNT; i++)
			{
				for(var j:int = 0; j < SPLIT_ROW_COUNT; j++)
				{
					_rect.x = _splitRow[j];
					_rect.y = _splitCol[i];
					_rect.width = _splitRow[j + 1] - _splitRow[j];
					_rect.height = _splitCol[i + 1] - _splitCol[i];
					var bmpd:BitmapData = new BitmapData(_rect.width, _rect.height, true, 0);
					bmpd.copyPixels(source, _rect, _dstPoint);
					result[i * 3 + j] = bmpd;
				}
			}
			return result;
		}
		
		private static function updateSplitData(width:int, height:int, top:int, right:int, bottom:int, left:int):void
		{
			_splitRow[0] = 0;
			_splitRow[1] = left;
			_splitRow[2] = width - right;
			_splitRow[3] = width;
			_splitCol[0] = 0;
			_splitCol[1] = top;
			_splitCol[2] = height - bottom;
			_splitCol[3] = height;
		}
		
		private static function generateScaleBitmapDataKey(link:String, width:int, height:int):String
		{
			return link + "_" + width + "_" + height;
		}
		
		private static function generateGridListKey(link:String, top:int, right:int, bottom:int, left:int):String
		{
			return link + "_" + top + "_"+ right + "_" + bottom + "_" + left;
		}
		
		//仅用于预览模式
		public static function mergeBitmapDataMap(map:Dictionary):void
		{
			for(var key:String in map)
			{
				_bitmapDataMap[key] = map[key];
			}
		}
		
	}
}

