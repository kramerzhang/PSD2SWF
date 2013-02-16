package
{
	import com.demonsters.debugger.MonsterDebugger;
	
	import flash.system.ApplicationDomain;
	
	import game.component.Component;
	import game.component.List;
	import game.component.ListItemBase;
	import game.component.Panel;
	import game.skin.NearSkin;
	
	[SWF(width="800", height="600")]
	public class ComponentDemo extends Panel
	{
		private var _awardList:List;
		
		public function ComponentDemo()
		{
			MonsterDebugger.initialize(this);
			Component.domain = ApplicationDomain.currentDomain;
			this.skin = NearSkin.skin;
		}
		
		protected override function configChildren():void
		{
			
		}
	}
}