package game.core.resource.item 
{
	import flash.utils.ByteArray;
	
	internal class ByteArrayWrapper extends ByteArray
	{
		private static const DEFLATE:String = "DEFLATE";
		
		private var _uzip:String;
		private var _zip:String;
		
		public function ByteArrayWrapper()
		{
			_uzip = null;
		}
		
		public override function compress(algorithm:String="zlib"):void
		{
			_zip = algorithm;
			_uzip = null;
			super.compress(algorithm);
		}
		
		public override function uncompress(algorithm:String="zlib"):void
		{
			_zip = null;
			_uzip = algorithm;
			super.uncompress(algorithm);
		}
		
		public override function deflate():void
		{
			_zip = DEFLATE;
			_uzip = null;
			super.deflate();
		}
		
		public override function inflate():void
		{
			_zip = null;
			_uzip = DEFLATE;
			super.inflate();
		}
		
		public function get zip():String
		{
			return _zip;
		}
		
		public function get uzip():String
		{
			return _uzip;
		}
		
		public function resetUzip(uzip:String):void
		{
			if(uzip == null)
			{
				return;
			}
			if(uzip == DEFLATE)
			{
				deflate();
			}
			else
			{
				compress(uzip);
			}
		}
		
		public function resetZip(zip:String):void
		{
			if(zip == null)
			{
				return;
			}
			if(zip == DEFLATE)
			{
				inflate();
			}
			else
			{
				uncompress(zip);
			}
		}
		
		public function resetCompressByExternal(source:ByteArrayWrapper):void
		{
			resetUzip(source.uzip);
			resetZip(source.zip);
		}
	}
}