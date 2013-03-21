package
{
	import adobe.utils.MMExecute;
	
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.system.ApplicationDomain;
	
	import game.component.Button;
	import game.component.Component;
	import game.component.Panel;
	import game.skin.ResourcePackPanelSkin;
	
	[SWF(width=150, height=95)]
	public class ResourcePackPanel extends Panel
	{
		private var _singleBtn:Button;
		private var _batchBtn:Button;
		private var _extractBtn:Button;
		
		public function ResourcePackPanel()
		{
			Component.domain = ApplicationDomain.currentDomain;
			this.skin = ResourcePackPanelSkin.skin;
		}
		
		protected override function configChildren():void
		{
			_singleBtn = getChildByName("single") as Button;
			_batchBtn = getChildByName("batch") as Button;
			_extractBtn = getChildByName("share") as Button;
			
			addBtnEventListener();
		}
		
		private function addBtnEventListener():void
		{
			_singleBtn.addEventListener(MouseEvent.CLICK, onBtnClick);
			_batchBtn.addEventListener(MouseEvent.CLICK, onBtnClick);
			_extractBtn.addEventListener(MouseEvent.CLICK, onBtnClick);
		}
		
		private function onBtnClick(evt:MouseEvent):void
		{
			var target:Button = evt.target as Button;
			switch(target)
			{
				case _singleBtn:
					singlePackResource();
					break;
				case _batchBtn:
					batchPackResource();
					break;
				case _extractBtn:
					extractSharedResource();
					break;
			}
		}
		
		private function singlePackResource():void
		{
			MMExecute("fl.runScript( fl.configURI + 'commands/资源打包脚本.jsfl', 'packSingle');");
		}
		
		private function batchPackResource():void
		{
			MMExecute("fl.runScript( fl.configURI + 'commands/资源打包脚本.jsfl', 'packBatch');");
		}
		
		private function extractSharedResource():void
		{
			MMExecute("fl.runScript( fl.configURI + 'commands/公共资源提取.jsfl', 'main');");
		}
	}
}