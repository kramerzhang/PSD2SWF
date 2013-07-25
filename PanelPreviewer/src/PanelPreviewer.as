package
{
	import com.adobe.serialization.json.JSON;
	import com.demonsters.debugger.MonsterDebugger;
	
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.external.ExternalInterface;
	import flash.system.ApplicationDomain;
	import flash.system.Capabilities;
	import flash.system.Security;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;
	import flash.utils.ByteArray;
	import flash.utils.Dictionary;
	
	import game.component.BitmapDataCache;
	import game.component.Component;
	import game.component.Panel;
	import game.core.resource.ResourceManager;
	import game.core.resource.events.ResourceEvent;
	import game.core.resource.item.ImageItem;
	import game.core.util.StringUtil;
	
	public class PanelPreviewer extends Sprite
	{
		//PSD文件所在目录路径
		//测试值，在PS中由预览FlashPlayer传入实际值
		private var _psdUrl:String = "file:///C|/Users/Administrator/Documents/GitHub/PSD2SWF/PSD/BagPanel.psd";
		//Skin文件路径
		//测试值，在PS中由预览FlashPlayer传入实际值
		private var _skinUrl:String = "file:///C|/Users/Administrator/Documents/GitHub/PSD2SWF/ComponentDemo/assets/0_code/game/skin/BagPanelSkin.as";
		private var _skinObj:Object;
		private var _assetUrlList:Array;
		private var _assetMap:Dictionary;
		
		private var _log:TextField;
		
		public function PanelPreviewer()
		{
			MonsterDebugger.initialize(this);
			Security.allowDomain("*");
			this.stage.align = StageAlign.TOP_LEFT;
			this.stage.scaleMode = StageScaleMode.NO_SCALE;
			
			try
			{
				initialize();
				loadAssetXml();
			}
			catch(e:Error)
			{
				addLog(e.message);
			}
		}
		
		private function initialize():void
		{
			Component.domain = ApplicationDomain.currentDomain;
			_assetMap = new Dictionary();
			showLog();
			checkExternalInterface();
		}
		
		private function showLog():void
		{
			var textFromat:TextFormat = new TextFormat();
			textFromat.font = "SimSun";
			_log = new TextField();
			_log.width = 300;
			_log.wordWrap = true;
			_log.defaultTextFormat = textFromat;
			_log.autoSize = TextFieldAutoSize.LEFT;
			_log.text = "生成面板预览中。。。\n------------------------------------------------\nFlashPlayer版本号：" + Capabilities.version;
			addChild(_log);
		}
		
		private function addLog(info:String):void
		{
			_log.appendText("\n------------------------------------------------\n" + info);
		}
		
		private function hideLog():void
		{
			removeChild(_log);
		}
		
		private function checkExternalInterface():void
		{
			if(ExternalInterface.available == true)
			{
				addLog("JS通讯可用");
			}
			else
			{
				addLog("ERROR:JS通讯不可用，请联系zhangjunqin@4399.com");
			}
		}
		
		private function loadAssetXml():void
		{
			initPsdUrl();
			addLog("PSD文件： " + _psdUrl);
			ResourceManager.loadXml(_psdUrl.replace(/\.psd/igm, ".xml"), onAssetXmlLoaded);
		}
		
		private function onAssetXmlLoaded(evt:ResourceEvent):void
		{
			var assetXml:XML = evt.content as XML;
			_assetUrlList = new Array();
			var nodeList:XMLList = assetXml.node;
			var len:int = nodeList.length();
			for(var i:int = 0; i < len; i++)
			{
				var node:XML = nodeList[i];
				_assetUrlList.push(generateAssetUrl(node));
			}
			loadAssetList();
		}
		
		private function generateAssetUrl(assetPath:String):String
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
				addLog("图片列表加载成功！");
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
			addLog("Skin文件： " + _skinUrl);
			ResourceManager.loadBinary(_skinUrl, onSkinLoaded);
		}
		
		private function onSkinLoaded(evt:ResourceEvent):void
		{
			addLog("Skin文件加载成功！");
			var binary:ByteArray = evt.content as ByteArray;
			var skinStr:String = binary.readUTFBytes(binary.length);
			skinStr = skinStr.replace(/[\t\n\r]/igm, "");
			skinStr = replaceColon(skinStr);
			skinStr = skinStr.match(/(?<=skin\:Object=).*?(?=;)/igm)[0];
			skinStr = skinStr.replace(/(\b\w+(?=:))/igm, "\"$1\"");
			skinStr = skinStr.replace(/(0x[0-9a-f]+?\b)/igm, "\"$1\"");
			_skinObj = com.adobe.serialization.json.JSON.decode(skinStr);
			eliminateColonPlaceholderInSkinObj(_skinObj);
			hideLog();
			createPanel();
		}
		
		private function replaceColon(str:String):String
		{
			var result:String = str;
			var colonMatchList:Array = result.match(/(?<=content\:\").*?(?=\")/igm);
			for each(var match:String in colonMatchList)
			{
				result = result.replace(match, match.replace(/\:/g, "${colon}"));
			}
			return result;
		}
		
		private function replaceColonPlaceholder(str:String):String
		{
			return str.replace(/\${colon}/g, ":");
		}
		
		private function eliminateColonPlaceholderInSkinObj(obj:Object):void
		{
			for(var key:String in obj)
			{
				if(obj[key] is Number)
				{
				}
				else if(obj[key] is String)
				{
					if(key == "content")
					{
						obj[key] = replaceColonPlaceholder(obj[key]);
					}
				}
				else if(obj[key] is Array)
				{
					for each(var value:Object in obj[key])
					{
						eliminateColonPlaceholderInSkinObj(value);
					}
				}
				else if(obj[key] is Object)
				{
					eliminateColonPlaceholderInSkinObj(obj[key]);
				}
			}
		}
		
		private function createPanel():void
		{
			var panel:Panel = new Panel([], _skinObj);
			addChild(panel);
		}
		
		public function initPsdUrl():void
		{
			if(ExternalInterface.available == true)
			{
				_psdUrl = ExternalInterface.call("getPsdUrl");
				if(_psdUrl == null || StringUtil.trim(_psdUrl) == "")
				{
					addLog("获取PSD文件路径失败！");
				}
			}
		}
		
		public function initSkinUrl():void
		{
			if(ExternalInterface.available == true)
			{
				_skinUrl = ExternalInterface.call("getSkinUrl");
				if(_skinUrl == null || StringUtil.trim(_skinUrl) == "")
				{
					addLog("获取Skin文件路径失败！");
				}
			}
		}
	}
}