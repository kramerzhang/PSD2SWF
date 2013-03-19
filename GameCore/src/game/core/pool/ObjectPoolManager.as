package game.core.pool
{
	import game.core.util.HashMap;

	public class ObjectPoolManager
	{
		private static var _instance:ObjectPoolManager;
		
		private var _poolMap:HashMap;
		
		public function ObjectPoolManager(blocker:Blocker)
		{
			_poolMap = new HashMap();
		}
		
		public static function getInstance():ObjectPoolManager
		{
			if(_instance == null)
			{
				_instance = new ObjectPoolManager(new Blocker());
			}
			return _instance;
		}
		
		public function getObject(clz:Class):IPoolableObject
		{
			var pool:ObjectPool = getPool(clz);
			return pool.getObject();
		}
		
		public function recycle(clz:Class, obj:IPoolableObject):void
		{
			var pool:ObjectPool = getPool(clz);
			pool.recycle(obj);
		}
		
		public function getPool(clz:Class):ObjectPool
		{
			var pool:ObjectPool = _poolMap.get(clz);
			if(pool == null)
			{
				pool = new ObjectPool(clz);
				_poolMap.put(clz, pool);
			}
			return pool;
		}
	}
}

class Blocker{}