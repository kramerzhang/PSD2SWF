package game.core.resource.events
{
	/**
	 * @author Kramer
	 * 
	 */	
	import flash.events.Event;
	
	public class ResourceEvent extends Event
	{
		public static const COMPLETE:String = "complete";
		
		private var _content:*;
		
		public function ResourceEvent(type:String, content:*, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
			_content = content;
		}
		
		public function get content():*
		{
			return _content;
		}
		
		/**
		 * 注意：当ResourceEvent的target是IPoolableObject时，
	     * 	         保持target的引用需注意可能会因为其归池而导致其属性值变化。
	     */
		override public function get target():Object
		{
			return super.target;
		}
	}
}