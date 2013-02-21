package
{
	import com.adobe.serialization.json.JSON;
	
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.external.ExternalInterface;
	import flash.system.ApplicationDomain;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.utils.ByteArray;
	import flash.utils.Dictionary;
	
	import game.component.BitmapDataCache;
	import game.component.Component;
	import game.component.Panel;
	import game.core.resource.ResourceManager;
	import game.core.resource.events.ResourceEvent;
	import game.core.resource.item.ImageItem;
	
	public class PanelPreviewer extends Sprite
	{
		//PSD文件所在目录路径
		private var _psdUrl:String = "file:///C|/Users/Administrator/Documents/GitHub/PSD2SWF/ComponentDemo/assets/BagPanel.psd";
		//Skin文件Url
		private var _skinUrl:String = "file:///C|/Users/Administrator/Documents/GitHub/PSD2SWF/ComponentDemo/assets/0_code/game/skin/BagPanelSkin.as";
		private var _skinObj:Object;
		private var _assetUrlList:Array;
		private var _assetMap:Dictionary;
		
		private var _log:TextField;
		
		public function PanelPreviewer()
		{
			this.stage.align = StageAlign.TOP_LEFT;
			this.stage.scaleMode = StageScaleMode.NO_SCALE;
			
			initialize();
			loadAssetXml();
		}
		
		private function initialize():void
		{
			Component.domain = ApplicationDomain.currentDomain;
			_assetMap = new Dictionary();
			showLog();
		}
		
		private function showLog():void
		{
			_log = new TextField();
			_log.autoSize = TextFieldAutoSize.LEFT;
			_log.text = "生成面板预览中。。。";
			_log.x = (this.stage.stageWidth - _log.width) >> 1;
			_log.y = (this.stage.stageHeight - _log.height) >> 1;
			addChild(_log);
		}
		
		private function hideLog():void
		{
			removeChild(_log);
		}
		
		private function loadAssetXml():void
		{
			initPsdUrl();
			ResourceManager.loadXml(_psdUrl.replace(/\.psd/igm, ".xml"), onAssetXmlLoaded);
		}
		
		private function onAssetXmlLoaded(evt:ResourceEvent):void
		{
			var assetXml:XML = evt.content as XML;
			var moduleName:String = assetXml.@name;
			_assetUrlList = new Array();
			var nodeList:XMLList = assetXml.node;
			var len:int = nodeList.length();
			for(var i:int = 0; i < len; i++)
			{
				var node:XML = nodeList[i];
				_assetUrlList.push(generateAssetUrl(moduleName, node));
			}
			loadAssetList();
		}
		
		private function generateAssetUrl(moduleName:String, assetPath:String):String
		{
			var assetIdentifier:Object = getAssetIdentifier(assetPath);
			return _psdUrl.substring(0, _psdUrl.lastIndexOf("/")) + "/" + assetIdentifier.moduleName + "/" + assetIdentifier.assetName + ".png";
		}
		
		private function getAssetIdentifier(assetPath:String, token:String = "\\"):Object
		{
			var result:Object = new Object();
			var lastIndex:int = assetPath.lastIndexOf(token);
			var fullAssetName:String = assetPath.substring(lastIndex + 1);
			result.assetName = fullAssetName.replace(".png", "");
			assetPath = assetPath.substring(0, assetPath.lastIndexOf(fullAssetName) - 1);
			result.moduleName = assetPath.substring(assetPath.lastIndexOf(token) + 1);
			return result;
		}
		
		private function loadAssetList():void
		{
			if(_assetUrlList.length == 0)
			{
				BitmapDataCache.mergeBitmapDataMap(_assetMap);
				loadSkin();
				return;
			}
			ResourceManager.loadImage(_assetUrlList.pop(), onAssetLoaded);
		}
		
		private function onAssetLoaded(evt:ResourceEvent):void
		{
			var target:ImageItem = evt.target as ImageItem;
			var assetIdentifier:Object = getAssetIdentifier(target.url, "/");
			_assetMap[assetIdentifier.moduleName + "." + assetIdentifier.assetName] = target.content.bitmapData;
			loadAssetList();
		}
		
		private function loadSkin():void
		{
			initSkinUrl();
			ResourceManager.loadBinary(_skinUrl, onSkinLoaded);
		}
		
		private function onSkinLoaded(evt:ResourceEvent):void
		{
			var binary:ByteArray = evt.content as ByteArray;
			var skinStr:String = binary.readUTFBytes(binary.length);
			skinStr = skinStr.replace(/[\t\n\r]/igm, "");
			skinStr = skinStr.match(/(?<=skin\:Object=).*?(?=;)/igm)[0];
			skinStr = skinStr.replace(/(\b\w+(?=:))/igm, "\"$1\"");
			skinStr = skinStr.replace(/(0x[0-9a-f]+?\b)/igm, "\"$1\"");
			_skinObj = com.adobe.serialization.json.JSON.decode(skinStr);
			hideLog();
			createPanel();
		}
		
		private function createPanel():void
		{
			var panel:Panel = new Panel();
			panel.skin = _skinObj;
			addChild(panel);
		}
		
		public function initPsdUrl():void
		{
			if(ExternalInterface.available == true)
			{
				_psdUrl = ExternalInterface.call("getPsdUrl");
			}
		}
		
		public function initSkinUrl():void
		{
			if(ExternalInterface.available == true)
			{
				_skinUrl = ExternalInterface.call("getSkinUrl");
			}
		}
	}
}