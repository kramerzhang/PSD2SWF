package game.core.pool
{
	import game.core.util.assert;

	public class ObjectPool
	{
		private var _clz:Class;
		private var _identifier:String;
		private var _usingVec:Vector.<IPoolableObject>;
		private var _freeVec:Vector.<IPoolableObject>;
		
		public function ObjectPool(clz:Class)
		{
			_clz = clz;
			_usingVec = new Vector.<IPoolableObject>();
			_freeVec = new Vector.<IPoolableObject>();
		}
		
		public function getObject():IPoolableObject
		{
			var obj:IPoolableObject;
			if(_freeVec.length > 0)
			{
				obj = _freeVec.shift();
			}
			else
			{
				obj = createObject();
			}
			_usingVec.push(obj);
			obj.checkout();
			return obj;
		}
		
		private function createObject():IPoolableObject
		{
			var obj:IPoolableObject = new _clz() as IPoolableObject;
			assert((obj is IPoolableObject), "Class " + _clz + " should be subtype of IPoolableObject");
			return obj;
		}
		
		public function recycle(obj:IPoolableObject):void
		{
			obj.checkin();
			var len:int = _usingVec.length;
			for(var i:int = (len - 1); i >= 0; i--)
			{
				if(_usingVec[i] == obj)
				{
					_usingVec.splice(i, 1);
					break;
				}
			}
			_freeVec.push(obj);
		}
		
		public function getUsedNum():int
		{
			return _usingVec.length;
		}
		
		public function getFreeNum():int
		{
			return _freeVec.length;
		}
		
		public function disposeAllFree():void
		{
			for each(var obj:IPoolableObject in _freeVec)
			{
				obj.dispose();
			}
			_freeVec.length = 0;
		}
		
	}
}