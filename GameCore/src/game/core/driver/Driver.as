package game.core.driver
{
	import game.core.util.HashMap;

	public class Driver
	{
		private var _isSleep:Boolean;
		private var _wrapperList:Vector.<DriveMethodWrapper>;
		private var _wrapperMap:HashMap;
		
		public function Driver()
		{
			initialize();
		}
		
		private function initialize():void
		{
			_wrapperList = new Vector.<DriveMethodWrapper>();
			_wrapperMap = new HashMap();
		}
		
		public function sleep():void
		{
			_isSleep = true;
		}
		
		public function wakeUp():void
		{
			_isSleep = false;
		}
		
		public function deactivate(drivable:IDrivable):void
		{
			var wrapper:DriveMethodWrapper = _wrapperMap.get(drivable.run);
			if(wrapper != null)
			{
				wrapper.isActivate = false;
			}
		}
		
		public function activate(drivable:IDrivable):void
		{
			var wrapper:DriveMethodWrapper = _wrapperMap.get(drivable.run);
			if(wrapper != null)
			{
				wrapper.isActivate = true;
			}
		}
		
		public function drive(drivable:IDrivable, priority:int = 1000):void
		{
			driveMethod(drivable.run, priority);
			drivable.setDriver(this);
		}
		
		public function removeDrive(drivable:IDrivable):void
		{
			removeDriveMethod(drivable.run);
		}
		
		public function driveMethod(method:Function, priority:int = 1000):void
		{
			var wrapper:DriveMethodWrapper = new DriveMethodWrapper(method, priority);
			wrapper.method = method;
			wrapper.priority = priority;
			wrapper.isActivate = true;
			_wrapperList.push(wrapper);
			_wrapperMap.put(method, wrapper);
			sortDriveMethod();
		}
		
		public function removeDriveMethod(method:Function):void
		{
			var wrapper:DriveMethodWrapper = _wrapperMap.get(method);
			if(wrapper != null)
			{
				var index:int = _wrapperList.indexOf(wrapper);
				if(index > -1)
				{
					_wrapperList.splice(index, 1);
				}
				_wrapperMap.remove(method);
			}
		}
		
		private function sortDriveMethod():void
		{
			_wrapperList.sort(dirveMethodSortCriteria);
		}
		
		private function dirveMethodSortCriteria(a:DriveMethodWrapper, b:DriveMethodWrapper):int
		{
			if(a.priority > b.priority)
			{
				return 1;
			}
			else if(a.priority < b.priority)
			{
				return -1;
			}
			return 0;
		}
		
		public function run():void
		{
			if(_isSleep == true)
			{
				return;
			}
			for each(var wrapper:DriveMethodWrapper in _wrapperList)
			{
				if(wrapper.isActivate == true)
				{
					wrapper.method();
				}
			}
		}
	}
}