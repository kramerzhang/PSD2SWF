/**
 * ...
 * @author KramerZhang(QQ:21524742)
 * 重要概念：
 * Layer专指图层文件夹
 * Element在Fireworks可以是图层文件夹也可以基本图层(图像、文本)
 * fw.launchApp("file:///C|/Program Files (x86)/Adobe/Flash Professional CS5.5/Adobe Flash CS5.5/Flash.exe", ["file:///D|/Temp/Panel/EquipExchange.fla"]); fw中调用Flash的方法
 */
var doc = fw.getDocumentDOM();
var psdName = "";
var psdPath = "";
var psdFolder = "";
var parseResult = null;
//公共图片资源，从PSD文件所在目录下的shared.xml中读取,shared.xml记录了模块间公共资源信息
var sharedAssetMap = null;
var assetMap = {};
//生成Skin文件路径
var skinFilePath = "";

var typeList =		["Image", "ScaleImage", "Label", "Button", "ComboBox", "Container", "DragBar", "List", "RadioButton", "RadioButtonGroup", "ScrollBar", "Slider", "Stepper"];
var parserList =	[parseImage, parseScaleImage, parseLabel, parseContainer, parseContainer, parseContainer, parseDragBar, parseList, parseContainer, parseContainer, parseContainer, parseContainer, parseContainer];
var generatorList =	[generateImageSkin, generateScaleImageSkin, generateLabelSkin, generateContainerSkin, generateContainerSkin, generateContainerSkin, generateDragBarSkin, generateListSkin, generateContainerSkin, generateContainerSkin, generateContainerSkin, generateContainerSkin, generateContainerSkin];
var validatorList =	[validateImage, validateImage, validateLabel, validateContainer, validateContainer, validateContainer, validateContainer, validateList, validateContainer, validateContainer, validateContainer, validateContainer, validateContainer];
var regExpList =	[null, null, null, buttonRegExp, comboBoxRegExp, null, null, null, radioButtonRegExp, radioButtonGroupRegExp, scrollBarRegExp, sliderRegExp, stepperRegExp];

//使用正则表达式对组件名称进行验证，$表示名称结尾
var buttonRegExp =				{required: ["(Image|ScaleImage)_.*"]};
var comboBoxRegExp =			{required: ["Label_label$", "List_list$", "Button_btn$"], optional: ["ScrollBar_scrollBar$"]};
var radioButtonRegExp =			{required: ["(Image|ScaleImage)_.*"]};
var radioButtonGroupRegExp =	{required: ["RadioButton_.*"]};
var scrollBarRegExp =			{required: ["Button_arrowDown$", "Button_arrowUp$", "Button_thumb$", ".*_track$"], optional: ["Image_thumbIcon$"]};
var sliderRegExp =				{required: ["Button_btn$", ".*_track$"]};
var stepperRegExp =				{required: ["Label_txt$", "Button_nextBtn$", "Button_prevBtn$"], optional: ["Button_lastBtn$", "Button_firstBtn$"]};

//资源名称命名验证正则表达式，1.不允许数字和特殊符号作为命名开始，2.图像图层命名中不能包含中文字符
var firstTokenRegExp = /^([0-9]|\~|\!|\@|\#|\^|\*)/;
var chineseCharRegExp = /[\u4e00-\u9fa5]/;
//消除图层命名中的无意义字符
var dummyTokenList = [/ /g, /副本\d*/g, /copy\d*/g];

//检测按钮组件四态名称易写错的形式
var stateNameList		= ["normal", "over", "down", "disable"];
var stateNameRegExpList	= ["((\\w+?){1}normal)|(normal(\\w+){1})|nromal|norma\\b", "((\\w+?){1}over)|(over(\\w+){1})|ovre", "((\\w+?){1}down)|(down(\\w+){1})|donw", "((\\w+?){1}disable)|(disable(\\w+){1})|disble|disabled/disbled"];

var oldTypeList = ["Bitmap", "ScaleBitmap", "Scroll_", "GroupRadioButton_"];
var newTypeList = ["Image", "ScaleImage", "ScrollBar_", "RadioButtonGroup_"];

//默认Skin模板,模板可根据项目需要调整,可以在PSD2SWF.ini中覆盖定义
var skinCodeTemplate = "package game.skin\n{\n${assetImport}\n\t/*\n${hint}\n\t*/\n\tpublic class ${className}\n\t{\n\t\tpublic static var skin:Object=\n${placeholder};\n\t}\n}";
//Skin文件默认保存目录为Psd文件目录下的0_code文件夹
var skinCodeFolderPath = "0_code";
var SETTING_FILE_NAME = "PSD2SWF.ini";
var SETTING_SKIN_CODE_FOLDER_TOKEN = "SKIN_CODE_FOLDER=";
var SETTING_SKIN_TEMPLATE_TOKEN = "SKIN_TEMPLATE=";
var SHARED = "shared";
var DEFAULT_IMAGE_QUALITY = 80;
//---------------------------------

main();

function main()
{
	try
	{
		extractFileInfo();
		loadSetting();
		loadSharedXml();
		resizeDocumentCanvas();
		correctDocumentStructure();
		parseDocument();
		validateParseResult();
		writeSkinFile();
		writeAssetXMLFile();
		exportAllElementsToPNG();
	}
	catch (e)
	{
		return "Error: " + psdName + ".psd(" + e.message + ")";
	}
	return "Success$" + parseResult.width + "$" + parseResult.height + "$" + skinFilePath;
}

function resizeDocumentCanvas()
{
	doc.setDocumentCanvasSizeToDocumentExtents(true);
}

function extractFileInfo()
{
	psdPath = doc.filePathForRevert;
	psdFolder = Files.getDirectory(psdPath);
	psdName = Files.getFilename(psdPath).replace(/\.(psd|PSD|png|PNG)/, "");
	skinCodeFolderPath = psdFolder + "/" + skinCodeFolderPath;
}

function loadSharedXml()
{
	var sharedXmlPath = psdFolder + "/shared.xml";
	sharedAssetMap = {};
	if (Files.exists(sharedXmlPath) == true)
	{
		var file = Files.open(sharedXmlPath, "unicode", false);
		var line = "";
		do {
			var pngIndex = line.indexOf(".png");
			if (pngIndex != -1)
			{
				var slashIndex = line.lastIndexOf("\\", pngIndex);
				var sharedResourceKey = line.substring(slashIndex + 1, pngIndex);
				sharedAssetMap[sharedResourceKey] = 1;
			}
			line = file.readlineUTF8();
		} while (line != null);
		file.close();
	}
}

function loadSetting()
{
	var settingFilePath = psdFolder + "/" + SETTING_FILE_NAME;
	if(Files.exists(settingFilePath) == false)
	{
		logError("在PSD文件所在目录下未找到配置文件" + SETTING_FILE_NAME);
		return;
	}
	var file = Files.open(settingFilePath, "unicode", false);
	var line = "";
	do {
		if(line.match(/^\w.+?$/igm) != null)
		{
			readSkinTemplateSetting(line);
			readSkinCodeFolderSetting(line);
		}
		line = file.readlineUTF8();
	} while (line != null);
	file.close();
}

function readSkinTemplateSetting(line)
{
	var index = line.indexOf(SETTING_SKIN_TEMPLATE_TOKEN);
	if(index != -1)
	{
		skinCodeTemplate = line.substring(SETTING_SKIN_TEMPLATE_TOKEN.length);
	}
}

function readSkinCodeFolderSetting(line)
{
	var index = line.indexOf(SETTING_SKIN_CODE_FOLDER_TOKEN);
	if(index != -1)
	{
		skinCodeFolderPath = line.substring(SETTING_SKIN_CODE_FOLDER_TOKEN.length);
		skinCodeFolderPath = convertPathToUrl(skinCodeFolderPath);
	}
}

function writeSkinFile()
{
	var content = generateContainerSkin(parseResult, "\t\t\t");
	var hint = generateHint(parseResult, "\t")
	var assetImport = generateImport(parseResult);
	var skinClassName = psdName + "Skin";
	createInexistentFolder(skinCodeFolderPath);
	skinCodeFolderPath = skinCodeFolderPath + "/game";
	createInexistentFolder(skinCodeFolderPath);
	skinCodeFolderPath = skinCodeFolderPath + "/skin";
	createInexistentFolder(skinCodeFolderPath);
	skinFilePath = skinCodeFolderPath + "/" + skinClassName + ".as";
	Files.deleteFileIfExisting(skinFilePath);
	var file = Files.open(skinFilePath, true, "unicode");
	var str = skinCodeTemplate.replace("${assetImport}", assetImport);
	str = str.replace("${hint}", hint);
	str = str.replace("${className}", skinClassName);
	str = str.replace("${placeholder}", content);
	str = str.replace(/\\n/g, "\n");
	str = str.replace(/\\t/g, "\t");
	file.writeUTF8(str);
	file.close();
}

function generateHint(obj, indent)
{
	result = indent + obj.name + ":" + obj.type;
	if(obj.type != "Container")
	{
		return result;
	}
	var len = obj.children != null ? obj.children.length : 0;
	for (var i = 0; i < len; i++)
	{
		var child = obj.children[i];
		result += "\n" + generateHint(child, indent + "\t")
	}
	return result;
}

function generateImport()
{
	var result = "";
	for(var name in assetMap)
	{
		if(sharedAssetMap[name] != null)
		{
			result += "\timport " + SHARED + "." + name + ";" + name + ";\n";
		}
		else
		{
			result += "\timport " + psdName + "." + name + ";" + name + ";\n";
		}
	}
	return result;
}

function writeAssetXMLFile()
{
	var assetXML = "<data name=\"" + psdName + "\">\n";
	for(var name in assetMap)
	{
		var assetPath = psdFolder + "/" + psdName + "/" + name + ".png";
		if(sharedAssetMap[name] != null)
		{
			assetPath = psdFolder + "/" + SHARED + "/" + name + ".png";
		}
		assetXML += "\t<node quality='" + assetMap[name] + "'>" + convertFileName(assetPath) + "</node>\n";
	}
	assetXML += "</data>";
	var xmlPath = psdPath.replace(/\.(psd|PSD|png)/g, ".xml");
	Files.deleteFileIfExisting(xmlPath);
	var file = Files.open(xmlPath, true, "unicode");
	file.writeUTF8(assetXML);
	file.close();
}

function correctDocumentStructure()
{	
	if(verifyDocumentStructure() == false)
	{
		createTopNormalLayer();
		reorderDocumentStructure();
	}
}

function verifyDocumentStructure()
{
	var layerList = doc.topLayers;
	var len = layerList.length;
	for(var i = 0; i < len; i++)
	{
		var layer = layerList[i];
		if(layer.name == "层" || layer.name == "layer")
		{
			return true;
		}
	}
	return false;
}

function createTopNormalLayer()
{
	doc.addNewLayer("层", false);
}

function reorderDocumentStructure()
{
	var sublayerNameList = getSublayerNameList();
	var len = sublayerNameList.length;
	for(var i = 0; i < len; i++)
	{
		var sublayerName = sublayerNameList[i];
		doc.reorderLayer(getLayerIndex(sublayerName) ,getLayerIndex("层"), false, 0, 2);
	}
}

function getSublayerNameList()
{
	var result = new Array();
	var layerList = doc.topLayers;
	var len = layerList.length;
	for(var i = 0; i < len; i++)
	{
		var layer = layerList[i];
		if(layer.layerType != "normal" || layer.name == "层" || layer.name == "layer")
		{
			continue;
		}
		result.push(layer.name);
	}
	return result;
}

function getLayerIndex(layerName)
{
	var len = doc.layers.length;
	for(var i = 0; i < len; i++)
	{
		if(doc.layers[i].name == layerName)
		{
			return i;
		}
	}
	return -1;
}

function parseDocument()
{
	var layerList = doc.topLayers;
	var len = layerList.length;
	for (var i = 0; i < len; i++)
	{
		var layer = layerList[i];
		if (layer.layerType == "normal")
		{
			parseResult = parseTopContainer(layer);
		}
	}
}

function parseTopContainer(element)
{
	var result = new Object();
	result.name = psdName;
	result.type = "Container";
	result.x = 0;
	result.y = 0;
	result.width = doc.width;
	result.height = doc.height;
	result.children = parseElementList(element.elems);
	result.bound = calculateContainerBound(result.children);
	return result;
}

function parseContainer(element)
{
	var result = new Object();
	var obj = parseLayerElementName(element);
	result.name = obj.name;
	result.type = obj.type;
	var children = parseElementList(element.elems);
	result.bound = calculateContainerBound(children);
	adjustContainerBound(result);
	adjustChildBound(children, result.bound);
	result.children = children;
	return result;
}

function parseElementList(elementList)
{
	var result = new Array();
	var len = elementList.length;
	for (var i = len - 1; i >= 0; i--)
	{
		var obj;
		var element = elementList[i];
		if (element.isLayer == true)
		{
			obj = parseLayerElement(element);
		}
		else
		{
			obj = parseSimpleElement(element);
		}
		if (obj != null)
		{
			result.push(obj);
		}
	}
	return result;
}

function parseLayerElement(element)
{
	if(element.frames && element.frames[0].visible == false)
	{
		return null;
	}
	var parser = getLayerElementParser(element);
	if (parser == null)
	{
		logError(parseLayerElementName(element).type + "  " + "未找到对应解析函数");
	}
	return parser(element);
}

function parseSimpleElement(element)
{
	if(element.visible == false)
	{
		return null;
	}
	if (element instanceof Text)
	{
		return parseSimpleTextElement(element);
	}
	return obj = parseSimpleImageElement(element);
}

function parseList(element)
{
	var result = parseContainer(element);
	var children = result.children;
	var len = children.length;
	var itemIndex = -1;
	for (var i = 0; i < len; i++)
	{
		var child = children[i];
		if (child.name == "myItem")
		{
			result.item = child;
			itemIndex = i;
			break;
		}
	}
	children.splice(itemIndex, 1);
	return result;
}

//兼容使用透明图片决定可拖拽范围的做法，并且以使用透明图片方式优先级最高
function parseDragBar(element)
{
	var result = new Object();
	var obj = parseLayerElementName(element);
	result.name = obj.name;
	result.type = obj.type;
	if (result.name != undefined)
	{
		var paramArr = result.name.split("x");
		if (paramArr != null)
		{
			result.x = 0;
			result.y = 0;
			result.width = paramArr[0];
			result.height = paramArr[1];
			result.bound = {x: result.x, y: result.y, width: result.width, height: result.height};
		}
	}
	if (element.elems.length > 0)
	{
		var firstChild = parseElementList(element.elems)[0];
		result.x = firstChild.x;
		result.y = firstChild.y;
		result.width = firstChild.width;
		result.height = firstChild.height;
		result.bound = {x: result.x, y: result.y, width: result.width, height: result.height};
	}
	result.name = "dragBar";
	return result;
}

function parseLabel(element)
{
	var result = new Object();
	var obj = parseLayerElementName(element);
	result.name = obj.name;
	result.type = obj.type;
	return parseStateElement(element, result, "Label", atomParseTextElement);
}

function parseImage(element)
{
	var result = new Object();
	var obj = parseLayerElementName(element);
	result.name = obj.name;
	result.type = obj.type;
	return parseStateElement(element, result, "Image", atomParseImageElement);
}

function parseScaleImage(element)
{
	var result = new Object();
	var obj = parseLayerElementName(element);
	result.name = obj.name;
	result.type = obj.type;
	var paramArr = obj.param.split(",");
	result.top = paramArr[0];
	result.right = paramArr[1];
	result.bottom = paramArr[2];
	result.left = paramArr[3];
	return parseStateElement(element, result, "ScaleImage", atomParseImageElement);
}

//StateElement:Label, Image, ScaleImage
function parseStateElement(element, preprocessResult, typeName, atomParser)
{
	var result = preprocessResult;
	var elementList = element.elems;
	var len = elementList.length;
	if (len == 0)
	{
		logError(typeName + " " + result.name + " 格式错误！文件夹内容为空。");
		return result;
	}
	var children = new Array();
	for (var i = 0; i < len; i++)
	{
		var subElement = elementList[i];
		subElementName = eliminateElementDummyToken(subElement);
		verifyStateName(element.name, subElementName);
		if (subElement.isLayer == false)
		{
			logError(typeName + " " + result.name + " 格式错误！文件夹内容包含非状态文件夹内容！");
			return result;
		}
		if (subElement.isLayer == true && subElement.elems.length == 0)
		{
			logError(typeName + " " + result.name + " 格式错误！状态文件夹内容为空！");
			return result;
		}
		result[subElementName] = atomParser(subElement.elems[0]);
		children.push(result[subElementName]);
	}
	result.bound = calculateContainerBound(children);
	adjustContainerBound(result);
	adjustChildBound(children, result.bound);
	return result;
}

function verifyStateName(elementName, stateName)
{
	var len = stateNameList.length;
	for(var i = 0; i < len; i++)
	{
		if(stateName.match(stateNameRegExpList[i]) != null)
		{
			logError(elementName + " 状态名错误:‘" + stateName + "’应为‘" + stateNameList[i] + "'");
		}
	}
}

function parseSimpleImageElement(element)
{
	var result = new Object();
	var obj = parseImageElementName(element);
	result.name = obj.name;
	result.type = "Image";
	result.normal = atomParseImageElement(element);
	result.bound = unionRectangle([result.normal]);
	adjustContainerBound(result);
	result.normal.x = result.normal.x - result.bound.x;
	result.normal.y = result.normal.y - result.bound.y;
	return result;
}

function parseSimpleTextElement(element)
{
	var result = new Object();
	result.name = eliminateElementDummyToken(element);
	result.type = "Label";
	result.normal = atomParseTextElement(element)
	result.bound = unionRectangle([result.normal]);
	adjustContainerBound(result);
	result.normal.x = result.normal.x - result.bound.x;
	result.normal.y = result.normal.y - result.bound.y;
	return result;
}

//---------------------------------------------------------------------------------
//Validate document parse result
//---------------------------------------------------------------------------------
function validateParseResult()
{
	var validator = getComponentValidator(parseResult.type);
	if(validator != null)
	{
		validator(parseResult);
	}
}

function validateContainer(obj)
{
	validateComponentNameFirstToken(obj);
	validateChildrenName(obj);
	var len = obj.children != null ? obj.children.length : 0;
	for (var i = 0; i < len; i++)
	{
		var child = obj.children[i];
		var validator = getComponentValidator(child.type);
		if(validator != null)
		{
			validator(child);
		}
	}
}

function validateList(obj)
{
	validateComponentNameFirstToken(obj);
	if(obj.item == null)
	{
		logError(obj.type + " " + obj.name + " 格式错误！未包含名为Item的子文件夹");
		return;
	}
	validateContainer(obj.item);
}

function validateImage(obj)
{
	validateComponentNameFirstToken(obj);
	for(var state in obj)
	{
		if(obj[state] instanceof Object)
		{
			if(obj[state].link != null)
			{
				var link = obj[state].link;
				var imageName = link.substring(link.indexOf(".") + 1);
				validateComponentNameFirstToken({type:"Image", name:imageName});
				if (imageName.match(chineseCharRegExp) != null)
				{
					logError("图像图层 " + imageName + " 命名格式错误！名字中含有中文字符！");
				}
			}
		}
	}
}

function validateLabel(obj)
{
	validateComponentNameFirstToken(obj);
}

function validateChildrenName(obj)
{
	var regExp = getComponentRegExp(obj.type);
	if (regExp == null)
	{
		return;
	}
	requiredTotalNum = regExp.required.length;
	var children = obj.children;
	var len = children.length;
	outer:
	for(var i = 0; i < requiredTotalNum; i++)
	{
		var required = regExp.required[i];
		for(var j = 0; j < len; j++)
		{
			var child = children[j];
			var candidate = child.type + "_" + child.name;
			if(candidate.match(required) != null)
			{
				continue outer;
			}
		}
		var content = obj.type + " 组件 " + obj.name + " 格式错误！";
		content += "子元素 " + required.replace("$", "") + " 未找到 ";
		logError(content);
	}
}

function validateComponentNameFirstToken(obj)
{
	if (obj.name.match(firstTokenRegExp) != null)
	{
		logError(obj.type + " 组件 " + obj.name + " 命名格式错误！命名以数字或特殊符号开始！");
	}
}

function getComponentRegExp(type)
{
	return regExpList[findTypeIndex(type)];
}

function getComponentValidator(type)
{
	return validatorList[findTypeIndex(type)];
}

//--------------------------------------------------------------------------
//generate skin output string
//--------------------------------------------------------------------------
function getTypeGenerator(type)
{
	return generatorList[findTypeIndex(type)];
}

function generateChildrenStr(children, indent)
{
	var result = indent + "[" + "\n";
	children.reverse();
	var len = children.length;
	for (var i = 0; i < len; i++)
	{
		var obj = children[i];
		var generator = getTypeGenerator(obj.type);
		result += generator(obj, indent + "\t");
		if (i < (len - 1))
		{
			result += ",\n";
		}
	}
	result += "\n" + indent + "]\n"
	return result;
}

function generateContainerSkin(obj, indent)
{
	var result = indent + "{";
	result += atomGeneratePropertyListStr(obj, ["name", "type", "x", "y", "width", "height"], [1, 1, 0, 0, 0, 0]) + ",";
	result += "\n";
	result += indent + "\t" + "children:\n";
	result += generateChildrenStr(obj.children, indent + "\t");
	result += indent + "}";
	return result;
}

function generateListSkin(obj, indent)
{
	var result = indent + "{";
	result += atomGeneratePropertyListStr(obj, ["name", "type", "x", "y", "width", "height"], [1, 1, 0, 0, 0, 0]) + ",";
	result += "\n";
	result += indent + "\t" + "item:\n";
	var generator = getTypeGenerator(obj.item.type);
	result += "\t" + generator(obj.item, indent + "\t") + ",";
	result += "\n";
	result += indent + "\t" + "children:\n";
	result += generateChildrenStr(obj.children, indent + "\t");
	result += indent + "}";
	return result;
}

function generateDragBarSkin(obj, indent)
{
	var result = indent + "{";
	result += atomGeneratePropertyListStr(obj, ["name", "type", "x", "y", "width", "height"], [1, 1, 0, 0, 0, 0]);
	result += "}";
	return result;
}

function generateImageSkin(obj, indent)
{
	var result = indent + "{";
	result += atomGeneratePropertyListStr(obj, ["name", "type", "x", "y", "width", "height"], [1, 1, 0, 0, 0, 0]) + ",";
	if (obj.normal != null)
	{
		result += "\n" + indent + "\t" + "normal:" + atomGenerateImageObjStr(obj.normal);
	}
	if (obj.over != null)
	{
		result += ",\n" + indent + "\t" + "over:" + atomGenerateImageObjStr(obj.over);
	}
	if (obj.down != null)
	{
		result += ",\n" + indent + "\t" + "down:" + atomGenerateImageObjStr(obj.down);
	}
	if (obj.disable != null)
	{
		result += ",\n" + indent + "\t" + "disable:" + atomGenerateImageObjStr(obj.disable);
	}
	result += "\n" + indent + "}"
	return result;
}

function generateScaleImageSkin(obj, indent)
{
	var result = indent + "{";
	result += atomGeneratePropertyListStr(obj, ["name", "type", "x", "y", "width", "height", "top", "right", "bottom", "left"], [1, 1, 0, 0, 0, 0, 0, 0, 0, 0]) + ",";
	if (obj.normal != null)
	{
		result += "\n" + indent + "\t" + "normal:" + atomGenerateImageObjStr(obj.normal);
	}
	if (obj.over != null)
	{
		result += ",\n" + indent + "\t" + "over:" + atomGenerateImageObjStr(obj.over);
	}
	if (obj.down != null)
	{
		result += ",\n" + indent + "\t" + "down:" + atomGenerateImageObjStr(obj.down);
	}
	if (obj.disable != null)
	{
		result += ",\n" + indent + "\t" + "disable:" + atomGenerateImageObjStr(obj.disable);
	}
	result += "\n" + indent + "}"
	return result;
}

function generateLabelSkin(obj, indent)
{
	var result = indent + "{";
	result += atomGeneratePropertyListStr(obj, ["name", "type", "x", "y", "width", "height"], [1, 1, 0, 0, 0, 0]) + ",";
	if (obj.normal != null)
	{
		result += "\n" + indent + "\t" + "normal:" + atomGenerateTextObjStr(obj.normal);
	}
	if (obj.over != null)
	{
		result += ",\n" + indent + "\t" + "over:" + atomGenerateTextObjStr(obj.over);
	}
	if (obj.down != null)
	{
		result += ",\n" + indent + "\t" + "down:" + atomGenerateTextObjStr(obj.down);
	}
	if (obj.disable != null)
	{
		result += ",\n" + indent + "\t" + "disable:" + atomGenerateTextObjStr(obj.disable);
	}
	result += "\n" + indent + "}";
	return result;
}

//---------------------------------------------------------------------------------
//atom operation
//---------------------------------------------------------------------------------
function atomParseTextElement(element)
{
	if((element instanceof Text) == false)
	{
		logError(element.name + " 为图像图层，在Label组件中应为文本图层！");
		return;
	}
	var result = new Object();
	result.name = eliminateElementDummyToken(element);
	result.x = element.left;
	result.y = element.top + 1;
	result.width = element.width;
	result.height = element.height;
	result.content = "";
	result.rawContent = "";
	var textRunsArr = element.textRuns.textRuns;
	result.format = parseTextDefaultTextFormat(element.textRuns.initialAttrs);
	var len = textRunsArr.length;
	for (var i = 0; i < len; i++)
	{
		var content = textRunsArr[i].characters;
		if (typeof (content) == "string")
		{
			content = content.replace(/\r/g, "\\r");
		}
		result.rawContent += content;
		var obj = textRunsArr[i].changedAttrs;
		if (obj.underline == true)
		{
			content = "<u>" + content + "</u>";
		}
		else
		{
			result.format.underline = false;
		}
		if (obj.bold == true)
		{
			content = "<b>" + content + "</b>";
		}
		else
		{
			result.format.bold = false;
		}
		content = "<font color='" + obj.fillColor + "'>" + content + "</font>";
		result.content += content;
	}
	result.width = refineTextElementWidth(result, element.textRuns.initialAttrs);
	result.bound = {x: element.left, y: element.top + 1, width: element.width, height: element.height + 1};
	return result;
}

function refineTextElementWidth(textObj, textAttrs)
{
	var result = textObj.width;
	var rawContent = textObj.rawContent;
	var kerning = textAttrs.rangeKerning;
	var refinedKerning = Math.round(kerning);
	var lineList = rawContent.split("\\r");
	var len = lineList != null ? lineList.length : 0;
	var maxCharNum = 0;
	for(var i = 0; i < len; i++)
	{
		var line = lineList[i];
		if(line.length > maxCharNum)
		{
			maxCharNum = line.length;
		}
	}
	result += (refinedKerning - kerning) * maxCharNum;
	result = Math.ceil(result);
	return result;
}

function parseTextDefaultTextFormat(textAttrs)
{
	var result = new Object();
	result.align = textAttrs.alignment;
	result.bold = textAttrs.bold;
	result.color = textAttrs.fillColor.replace("#", "0x");
	result.font = textAttrs.face;
	result.italic = textAttrs.italic;
	result.size = parseFontSize(textAttrs.size);
	result.letterSpacing = textAttrs.rangeKerning;
	var leading = 0;
	if(textAttrs.leadingMode == "percentage")
	{
		leading = result.size * (textAttrs.leading - 1) ;
	}
	else
	{
		leading = textAttrs.leading - result.size;
	}
	leading = leading > 0 ? leading : 0;
	result.leading = Math.round(leading * 100) * 0.01;
	result.underline = textAttrs.underline;
	return result;
}

function parseFontSize(sizeStr)
{
	var result = sizeStr.replace("pt", "");
	return parseInt(result);
}

function atomParseImageElement(element)
{
	if((element instanceof Text) == true)
	{
		logError(element.name + " 为文本图层，在Image组件中应为图像图层！");
		return;
	}
	var result = new Object();
	var obj = parseImageElementName(element);
	if(assetMap[obj.name] == undefined || obj.quality > parseInt(assetMap[obj.name]))
	{
		assetMap[obj.name] = obj.quality;
	}
	var prefix = psdName;
	if (sharedAssetMap[obj.name] != null)
	{
		prefix = SHARED;
	}
	result.link = prefix + "." + obj.name;
	var rect = element.pixelRect;
	result.x = rect.left;
	result.y = rect.top;
	result.width = rect.right - rect.left;
	result.height = rect.bottom - rect.top;
	result.bound = {x: element.left, y: element.top, width: element.width, height: element.height};
	return result;
}

function atomGenerateTextObjStr(obj)
{
	var result = "{";
	result += atomGeneratePropertyListStr(obj, ["x", "y", "width", "height", "content"], [0, 0, 0, 0, 1]) + ",";
	result += "format:{";
	result += atomGeneratePropertyListStr(obj.format, ["align", "bold", "color", "font", "italic", "leading", "letterSpacing", "size", "underline"], [1, 0, 0, 1, 0, 0, 0, 0, 0]);
	result += "}}";
	return result;
}

function atomGenerateImageObjStr(obj)
{
	return "{" + atomGeneratePropertyListStr(obj, ["link", "x", "y", "width", "height"], [1, 0, 0, 0, 0]) + "}";
}

//0为数字，1为字符串
function atomGeneratePropertyListStr(obj, propertyList, typeList)
{
	if (propertyList.length != typeList.length)
	{
		logError("属性长度和属性类型长度不符");
		return "";
	}
	var result = "";
	var len = propertyList.length;
	for (var i = 0; i < len; i++)
	{
		result += atomGenerateObjPropertyStr(obj, propertyList[i], typeList[i]);
		if (i < (len - 1))
		{
			result += ",";
		}
	}
	return result;
}

function atomGenerateObjPropertyStr(obj, property, type)
{
	var result = "";
	if (type == 0)
	{
		result += property + ":" + obj[property];
	}
	else
	{
		result += property + ":" + "\"" + obj[property] + "\"";
	}
	return result;
}

//----------------------------------------------------------------
//Tools
//----------------------------------------------------------------
function parseImageElementName(element)
{
	var str = eliminateElementDummyToken(element);
	var obj = new Object();
	var arr = str.split("_");
	obj.name = arr[0];
	obj.quality = arr[1] == undefined ? DEFAULT_IMAGE_QUALITY : arr[1];
	return obj;
}

function parseLayerElementName(element)
{
	var str = eliminateElementDummyToken(element);
	var obj = new Object();
	var arr = str.split("_");
	obj.name = extractElementName(arr);
	obj.type = extractElementType(arr);
	obj.param = extractElementParam(arr);
	return obj;
}

function getLayerElementParser(element)
{
	var obj = parseLayerElementName(element);
	var type = obj.type;
	var index = findTypeIndex(type);
	if (index > -1)
	{
		return parserList[index];
	}
	return null;
}

//example:Button_myBtn;
function extractElementType(arr)
{
	var type = arr[0];
	var index = findTypeIndex(type);
	if (index > -1)
	{
		return type;
	}
	return "Container";
}

function findTypeIndex(type)
{
	var len = typeList.length;
	for (var i = 0; i < len; i++)
	{
		if (typeList[i] == type)
		{
			return i;
		}
	}
	return -1;
}

//example:Button_myBtn return myBtn, Button return myButton
function extractElementName(arr)
{
	if (arr[1] == undefined)
	{
		return "my" + arr[0];
	}
	return arr[1];
}

//example:ScaleImage_myImage_4,4,4,4
function extractElementParam(arr)
{
	if (arr[2] == undefined)
	{
		return "4,4,4,4"; //default value
	}
	return arr[2];
}

function eliminateElementDummyToken(element)
{
	var name = element.name;
	var len = dummyTokenList.length;
	for (var i = 0; i < len; i++)
	{
		name = name.replace(dummyTokenList[i], "");
	}
	//replace legacy type
	var typeLen = oldTypeList.length;
	for (var j = 0; j < typeLen; j++)
	{
		name = name.replace(oldTypeList[j], newTypeList[j]);
	}
	return name;
}

function unionRectangle(rectArr)
{
	if(rectArr.length == 0)
	{
		return {x:0, y:0, width:0, height:0};
	}
	var result = new Object();
	var left = 1048576;
	var top = 1048576;
	var right = -1048576;
	var bottom = -1048576;
	var len = rectArr.length;
	for (var i = 0; i < len; i++)
	{
		var rect = rectArr[i];
		if (left > rect.x)
		{
			left = rect.x;
		}
		if (top > rect.y)
		{
			top = rect.y;
		}
		if (right < (rect.width + rect.x))
		{
			right = rect.width + rect.x;
		}
		if (bottom < (rect.height + rect.y))
		{
			bottom = rect.height + rect.y;
		}
	}
	result.x = left;
	result.y = top;
	result.width = right - left;
	result.height = bottom - top;
	return result;
}

function calculateContainerBound(children)
{
	var rectArr = new Array();
	var len = children.length;
	for (var i = 0; i < len; i++)
	{
		rectArr.push(children[i].bound);
	}
	return unionRectangle(rectArr);
}

function adjustContainerBound(obj)
{
	var bound = obj.bound;
	obj.x = bound.x;
	obj.y = bound.y;
	obj.width = bound.width;
	obj.height = bound.height;
}

function adjustChildBound(children, parentBound)
{
	var len = children.length;
	for (var j = 0; j < len; j++)
	{
		var childObj = children[j];
		childObj.x = childObj.bound.x - parentBound.x;
		childObj.y = childObj.bound.y - parentBound.y;
	}
}

function dumpSimpleObj(obj)
{
	var result = "";
	for (var str in obj)
	{
		if (obj[str] instanceof Object)
		{
			result += "\t" + str + " :" + dumpSimpleObj(obj[str]);
		}
		else
		{
			result += str + " :" + obj[str] + "\n";
		}
	}
	return result;
}

//----------------------
//http://www.xlobby.com/forum/viewtopic.php?f=7&t=5606
//----------------------
function exportAllElementsToPNG()
{
	var dom = fw.getDocumentDOM();
	var elems = new Array().concat(fw.selection);
	dom.selectNone();

	dom.setDocumentCanvasColor("#ffffff00");
	var sXO = dom.exportOptions;
	var oldcrop = sXO.crop;
	sXO.crop = true;
	sXO.ditherMode = "none";
	sXO.ditherPercent = 100;
	sXO.exportFormat = "PNG";
	sXO.colorMode = "32 bit";
	sXO.optimized = true;
	sXO.paletteTransparencyType = "rgba";

	var f = dom.currentFrameNum;
	var n = dom.layers.length;
	var i, j, m, elem;
	var visArr = new Array();
	for (i = 0; i < n; i++)
	{
		var layer = dom.layers[i];
		if (layer.layerType == "web") continue;
		if(layer.frames[f].visible == false)
		{
			dom.setLayerVisible(-1, -1, true, true);
		}
		m = layer.frames[f].elements.length;
		for (j = 0; j < m; j++)
		{
			elem = layer.frames[f].elements[j];
			elem.visible = false;
			visArr.push(elem);
		}
	}

	var rect, name, filename;
	for (i = 0; i < n; i++)
	{
		var layer = dom.layers[i];
		if (layer.layerType == "web") continue;
		m = layer.frames[f].elements.length;
		for (j = 0; j < m; j++)
		{
			elem = layer.frames[f].elements[j];
			if (elem instanceof Text) continue; //ignore text elements
			rect = elem.pixelRect;
			elem.visible = true;
			name = parseImageElementName(elem).name;
			var folderPath = psdFolder + "/" + psdName;
			createInexistentFolder(folderPath);
			filename = folderPath + "/" + name + ".png";
			sXO.cropLeft = rect.left;
			sXO.cropRight = rect.right;
			sXO.cropTop = rect.top;
			sXO.cropBottom = rect.bottom;
			fw.exportDocumentAs(dom, filename, sXO);
			elem.visible = false;
		}
	}
	i = visArr.length;
	while (i--) visArr[i].visible = true;
	sXO.crop = oldcrop;
	dom.lastExportDirectory = psdFolder;
	fw.selection = elems;
}

function convertFileName(fileName)
{
	fileName = fileName.replace("file:///", "");
	fileName = fileName.replace("|", ":");
	fileName = fileName.replace(/\//g, "\\");
	return fileName;
}

function logError(msg)
{
	throw new Error(msg);
}

function createInexistentFolder(path)
{
	if (Files.exists(path) == false)
	{
		if(Files.createDirectory(path) == false)
		{
			logError("创建路径" + path + "失败! 请检查路径是否存在。");
		}
	}
}

function convertPathToUrl(path)
{
	var result = path.replace(/\\/g, "/");
	result = result.replace(/([cdefg])\:/ig, "file:///$1|"); 
	return result;
}