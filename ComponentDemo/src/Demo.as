package
{
	import com.demonsters.debugger.MonsterDebugger;
	
	import flash.display.Sprite;
	import flash.system.ApplicationDomain;
	
	import game.component.Component;
	
	[SWF(width="800", height="600")]
	public class Demo extends Sprite
	{
		public function Demo()
		{
			MonsterDebugger.initialize(this);
			
			Component.domain = ApplicationDomain.currentDomain;
			addChild(new BagPanel());
		}
		
	}
}