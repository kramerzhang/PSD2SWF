/**
 * ...
 * @author KramerZhang(QQ:21524742)
 * 重要概念：
 * Element在Fireworks可以是图层文件夹也可以基本图层
 * fw.launchApp("file:///C|/Program Files (x86)/Adobe/Flash Professional CS5.5/Adobe Flash CS5.5/Flash.exe", ["file:///D|/Temp/Panel/EquipExchange.fla"]); fw中调用Flash的方法
 */
var doc = fw.getDocumentDOM();
//psd文件名称
var psdName = "";
//psd文件全路径
var psdPath = "";
//psd文件所在目录路径
var psdFolder = "";

var typeList = 		["Image", "ScaleImage", "Label", "Button", "ComboBox", "Container", "DragBar", "List", "RadioButton", "RadioButtonGroup", "ScrollBar", "Slider", "Stepper"];
var parserList = 	[parseImage, parseScaleImage, parseLabel, parseContainer, parseContainer, parseContainer, parseDragBar, parseList, parseContainer, parseContainer, parseContainer, parseContainer, parseContainer];
var generatorList = [generateImageStr, generateScaleImageStr, generateLabelStr, generateContainerStr, generateContainerStr, generateContainerStr, generateDragBarStr, generateListStr, generateContainerStr, generateContainerStr, generateContainerStr, generateContainerStr, generateContainerStr];
var validatorList = [imageValidator, scaleImageValidator, labelValidator, buttonValidator, comboBoxValidator, containerValidator, dragBarValidator, listValidator, radioButtonValidator, radioButtonGroupValidator, scrollBarValidator, sliderValidator, stepperValidator];

//Component validator, 使用正则表达式对组件名称进行验证，$表示名称结尾
var imageValidator = 			null;
var scaleImageValidator = 		null;
var labelValidator = 			null;
var buttonValidator = 			{required: ["(Image|ScaleImage)_.*"]};
var comboBoxValidator = 		{required: ["Label_label$", "List_list$", "Button_btn$"], optional: ["ScrollBar_scrollBar$"]};
var containerValidator = 		null;
var dragBarValidator = 			null;
var listValidator = 			null;
var radioButtonValidator = 		{required: ["(Image|ScaleImage)_.*"]};
var radioButtonGroupValidator = {required: ["RadioButton_.*"]};
var scrollBarValidator = 		{required: ["Button_arrowDown$", "Button_arrowUp$", "Button_thumb$", ".*_track$"], optional: ["Image_thumbIcon$"]};
var sliderValidator = 			{required: ["Button_btn$", ".*_track$"]};
var stepperValidator = 			{required: ["Label_txt$", "Button_nextBtn$", "Button_prevBtn$"], optional: ["Button_lastBtn$", "Button_firstBtn$"]};

//资源名称命名验证正则表达式，1.不允许数字和特殊符号作为命名开始，2.图像图层命名中不能包含中文字符
var firstTokenValidator = /^([0-9]|\~|\!|\@|\#|\^|\*)/;
var chineseCharValidator = /[\u4e00-\u9fa5]/;
//消除图层命名中的无意义字符
var dummyTokenList = [/ /g, /副本\d*/g, /copy\d*/g];

var oldTypeList = ["Bitmap", "ScaleBitmap", "Scroll_", "GroupRadioButton_"];
var newTypeList = ["Image", "ScaleImage", "ScrollBar_", "RadioButtonGroup_"];

//默认Skin模板,模板可根据项目需要调整
var template = "package game.skin\n{\n${assetImport}\n\tpublic class ${className}\n\t{\n\t\tpublic static var skin:Object=\n${placeholder};\n\t}\n}";
var outputFile = null;
var assetXML = "";
var assetImportCode = "";
var assetImportMap = {};
//---------------------------------
var CODE_FOLDER = "0_code";
var SHARED = "shared";
//公共资源列表，从PSD文件所在目录下的shared.xml中读取,shared.xml记录了模块间公共资源信息
var sharedResourceMap = {};
//将运行结果回报给Photoshop
var feedbackContent = "";
//---------------------------------

main();

function main()
{
    try
    {
        resizeDocumentCanvas();
        extractFileInfo();
        loadSharedXml(psdFolder);
        var result = parseDocument();
        validateParseResult(result);
        var skinContent = generateContainerStr(result, "\t\t\t");
        exportAllElementsToPNG();
        writeSkinFile(skinContent, assetImportCode);
        writeAssetXMLFile(assetXML);
    }
    catch (e)
    {
        feedbackContent = psdName + ".psd--" + e.message;
    }
    return feedbackContent;
}

function resizeDocumentCanvas()
{
    doc.setDocumentCanvasSizeToDocumentExtents(true);
    doc.selectNone();
}

function extractFileInfo()
{
    psdPath = doc.filePathForRevert;
    var lastSlashIndex = psdPath.lastIndexOf("/");
    var psdFullName = psdPath.substring(lastSlashIndex + 1, psdPath.length);
    var dotIndex = psdFullName.indexOf(".");
    psdName = psdFullName.substring(0, dotIndex);
    psdFolder = psdPath.substring(0, lastSlashIndex);
}

function loadSharedXml(psdFolder)
{
    var sharedXmlPath = psdFolder + "/shared.xml";
    sharedResourceMap = {};
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
                sharedResourceMap[sharedResourceKey] = 1;
            }
            line = file.readlineUTF8();
        } while (line != null);
        file.close();
    }
}

function writeSkinFile(content, assetImport)
{
    var skinClassName = psdName + "Skin";
    var skinFolder = psdFolder + "/" + CODE_FOLDER;
    createInexistentFolder(skinFolder);
    skinFolder = skinFolder + "/game";
    createInexistentFolder(skinFolder);
    skinFolder = skinFolder + "/skin";
    createInexistentFolder(skinFolder);
    var skinPath = skinFolder + "/" + skinClassName + ".as";
    Files.deleteFileIfExisting(skinPath);
    var file = Files.open(skinPath, true, "unicode");
    var str = template.replace("${assetImport}", assetImport);
    str = str.replace("${className}", skinClassName);
    str = str.replace("${placeholder}", content);
    file.writeUTF8(str);
    file.close();
}

function writeAssetXMLFile(content)
{
    var xmlPath = psdPath.replace(/\.(psd|PSD|png)/g, ".xml");
    Files.deleteFileIfExisting(xmlPath);
    var file = Files.open(xmlPath, true, "unicode");
    file.writeUTF8(content);
    file.close();
}

function parseDocument()
{
    var layerList = doc.topLayers;
    var len = layerList.length;
    var result = new Object();
    for (var i = 0; i < len; i++)
    {
        var layer = layerList[i];
        if (layer.layerType == "normal")
        {
            result = parseTopContainer(layer);
        }
    }
    return result;
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
    var rectArr = new Array();
    var len = result.children.length;
    for (var i = 0; i < len; i++)
    {
        rectArr.push(result.children[i].bound);
    }
    result.bound = unionRectangle(rectArr);
    return result;
}

function parseContainer(element)
{
    var result = new Object();
    var obj = parseElementName(element);
    result.name = obj.name;
    result.type = obj.type;
    var children = parseElementList(element.elems);
    var rectArr = new Array();
    var len = children.length;
    for (var i = 0; i < len; i++)
    {
        rectArr.push(children[i].bound);
    }
    result.bound = unionRectangle(rectArr);
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
            var parser = getElementParser(element);
            if (parser != null)
            {
                obj = parser(element);
            }
            else
            {
                logError(parseElementName(element).type + "  " + "未找到对应解析函数");
            }
        }
        else
        {
            if (element instanceof Text)
            {
                obj = parseSimpleTextElement(element);
            }
            else
            {
                obj = parseSimpleImageElement(element);
            }
        }
        if (obj != null)
        {
            result.push(obj);
        }
    }
    return result;
}

function parseList(element)
{
    var result = parseContainer(element);
    var children = result.children;
    var len = children.length;
    var itemIndex = -1;
    var hasItem = false;
    for (var i = 0; i < len; i++)
    {
        var child = children[i];
        if (child.name == "myItem")
        {
            hasItem = true;
            result.item = child;
            itemIndex = i;
            break;
        }
    }
    children.splice(itemIndex, 1);
    if (hasItem == false)
    {
        logError(result.type + " " + result.name + " 格式错误！未包含名为Item的子文件夹");
    }
    return result;
}

//兼容使用透明图片决定可拖拽范围的做法，并且以使用透明图片方式优先级最高
function parseDragBar(element)
{
    var result = new Object();
    var obj = parseElementName(element);
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
            result.bound = {
                x: result.x,
                y: result.y,
                width: result.width,
                height: result.height
            };
        }
    }
    if (element.elems.length > 0)
    {
        var firstChild = parseElementList(element.elems)[0];
        result.x = firstChild.x;
        result.y = firstChild.y;
        result.width = firstChild.width;
        result.height = firstChild.height;
        result.bound = {
            x: result.x,
            y: result.y,
            width: result.width,
            height: result.height
        };
    }
    result.name = "dragBar";
    return result;
}

function parseLabel(element)
{
    var result = new Object();
    var obj = parseElementName(element);
    result.name = obj.name;
    result.type = obj.type;
    return parseStateElement(element, result, "Label", atomParseTextElement);
}

function parseImage(element)
{
    var result = new Object();
    var obj = parseElementName(element);
    result.name = obj.name;
    result.type = obj.type;
    return parseStateElement(element, result, "Image", atomParseImageElement);
}

function parseScaleImage(element)
{
    var result = new Object();
    var obj = parseElementName(element);
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
    var rectArr = new Array();
    var children = new Array();
    for (var i = 0; i < len; i++)
    {
        var subElement = elementList[i];
        subElementName = eliminateElementDummyToken(subElement);
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
        rectArr.push(result[subElementName].bound);
    }
    result.bound = unionRectangle(rectArr);
    adjustContainerBound(result);
    adjustChildBound(children, result.bound);
    return result;
}

function parseSimpleImageElement(element)
{
    var result = new Object();
    var obj = parseImageName(element);
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
//Component validator
//---------------------------------------------------------------------------------
function validateParseResult(result)
{
    validateComponent(result);
    var len = result.children != null ? result.children.length : 0;
    for (var i = 0; i < len; i++)
    {
        var child = result.children[i];
        validateParseResult(child);
    }
}

function validateComponent(obj)
{
    validateComponentNameFirstToken(obj.type, obj.name);
    var validator = getTypeValidator(obj.type);
    if (validator == null)
    {
        return;
    }
    var requiredHitNum = 0;
    var requiredTotalNum = 0;
    requiredTotalNum = validator.required.length;
    var childrenValidateResult = [];
    var children = obj.children;
    var len = children.length;
    for (var i = 0; i < len; i++)
    {
        var child = children[i];
        validateComponentNameFirstToken(child.type, child.name);
        var candidate = child.type + "_" + child.name;
        for (var j = 0; j < requiredTotalNum; j++)
        {
            if (candidate.match(validator.required[j]) != null)
            {
                childrenValidateResult[j] = 1;
                requiredHitNum++;
                break;
            }
        }
    }
    if (requiredHitNum < requiredTotalNum)
    {
        var content = obj.type + " 组件 " + obj.name + " 格式错误！";
        for (var i = 0; i < requiredTotalNum; i++)
        {
            if (childrenValidateResult[i] == undefined)
            {
                var dummy = validator.required[i];
                dummy = dummy.replace("$", "");
                content += "子元素 " + dummy + " 未找到 ";
            }
        }
        logError(content);
    }
}

function validateComponentNameFirstToken(type, name)
{
    if (name.match(firstTokenValidator) != null)
    {
        logError(type + " 组件 " + name + " 命名格式错误！命名以数字或特殊符号开始！");
    }
}

function validateImageName(name)
{
    if (name.match(chineseCharValidator) != null)
    {
        logError("图像图层 " + name + " 命名格式错误！名字中含有中文字符！");
    }
}

function getTypeValidator(type)
{
    var len = typeList.length;
    for (var i = 0; i < len; i++)
    {
        if (type == typeList[i])
        {
            return validatorList[i];
        }
    }
    return null;
}

//--------------------------------------------------------------------------
//generate skin output string
//--------------------------------------------------------------------------
function getTypeGenerator(type)
{
    var len = typeList.length;
    for (var i = 0; i < len; i++)
    {
        if (type == typeList[i])
        {
            return generatorList[i];
        }
    }
    return null;
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

function generateContainerStr(obj, indent)
{
    var result = indent + "{";
    result += atomGenerateObjPropertyStr(obj, "name", 1) + ",";
    result += atomGenerateObjPropertyStr(obj, "type", 1) + ",";
    result += atomGenerateObjPropertyStr(obj, "x", 0) + ",";
    result += atomGenerateObjPropertyStr(obj, "y", 0) + ",";
    result += atomGenerateObjPropertyStr(obj, "width", 0) + ",";
    result += atomGenerateObjPropertyStr(obj, "height", 0) + ",";
    result += "\n";
    result += indent + "\t" + "children:\n";
    result += generateChildrenStr(obj.children, indent + "\t");
    result += indent + "}";
    return result;
}

function generateListStr(obj, indent)
{
    var result = indent + "{";
    result += atomGenerateObjPropertyStr(obj, "name", 1) + ",";
    result += atomGenerateObjPropertyStr(obj, "type", 1) + ",";
    result += atomGenerateObjPropertyStr(obj, "x", 0) + ",";
    result += atomGenerateObjPropertyStr(obj, "y", 0) + ",";
    result += atomGenerateObjPropertyStr(obj, "width", 0) + ",";
    result += atomGenerateObjPropertyStr(obj, "height", 0) + ",";
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

function generateDragBarStr(obj, indent)
{
    var result = indent + "{";
    result += atomGenerateObjPropertyStr(obj, "name", 1) + ",";
    result += atomGenerateObjPropertyStr(obj, "type", 1) + ",";
    result += atomGenerateObjPropertyStr(obj, "x", 0) + ",";
    result += atomGenerateObjPropertyStr(obj, "y", 0) + ",";
    result += atomGenerateObjPropertyStr(obj, "width", 0) + ",";
    result += atomGenerateObjPropertyStr(obj, "height", 0);
    result += "}";
    return result;
}

function generateImageStr(obj, indent)
{
    var result = indent + "{";
    result += atomGenerateObjPropertyStr(obj, "name", 1) + ",";
    result += atomGenerateObjPropertyStr(obj, "type", 1) + ",";
    result += atomGenerateObjPropertyStr(obj, "x", 0) + ",";
    result += atomGenerateObjPropertyStr(obj, "y", 0) + ",";
    result += atomGenerateObjPropertyStr(obj, "width", 0) + ",";
    result += atomGenerateObjPropertyStr(obj, "height", 0) + ",";
    if (obj.normal != null)
    {
        result += "\n";
        result += indent + "\t" + "normal:" + atomGenerateImageObjStr(obj.normal);
    }
    if (obj.over != null)
    {
        result += ",";
        result += "\n";
        result += indent + "\t" + "over:" + atomGenerateImageObjStr(obj.over);
    }
    if (obj.down != null)
    {
        result += ",";
        result += "\n";
        result += indent + "\t" + "down:" + atomGenerateImageObjStr(obj.down);
    }
    if (obj.disable != null)
    {
        result += ",";
        result += "\n";
        result += indent + "\t" + "disable:" + atomGenerateImageObjStr(obj.disable);
    }
    result += "\n";
    result += indent + "}"
    return result;
}

function generateScaleImageStr(obj, indent)
{
    var result = indent + "{";
    result += atomGenerateObjPropertyStr(obj, "name", 1) + ",";
    result += atomGenerateObjPropertyStr(obj, "type", 1) + ",";
    result += atomGenerateObjPropertyStr(obj, "x", 0) + ",";
    result += atomGenerateObjPropertyStr(obj, "y", 0) + ",";
    result += atomGenerateObjPropertyStr(obj, "width", 0) + ",";
    result += atomGenerateObjPropertyStr(obj, "height", 0) + ",";
    result += atomGenerateObjPropertyStr(obj, "top", 0) + ",";
    result += atomGenerateObjPropertyStr(obj, "right", 0) + ",";
    result += atomGenerateObjPropertyStr(obj, "bottom", 0) + ",";
    result += atomGenerateObjPropertyStr(obj, "left", 0) + ",";
    if (obj.normal != null)
    {
        result += "\n";
        result += indent + "\t" + "normal:" + atomGenerateImageObjStr(obj.normal);
    }
    if (obj.over != null)
    {
        result += ",";
        result += "\n";
        result += indent + "\t" + "over:" + atomGenerateImageObjStr(obj.over);
    }
    if (obj.down != null)
    {
        result += ",";
        result += "\n";
        result += indent + "\t" + "down:" + atomGenerateImageObjStr(obj.down);
    }
    if (obj.disable != null)
    {
        result += ",";
        result += "\n";
        result += indent + "\t" + "disable:" + atomGenerateImageObjStr(obj.disable);
    }
    result += "\n";
    result += indent + "}"
    return result;
}

function generateLabelStr(obj, indent)
{
    var result = indent + "{";
    result += atomGenerateObjPropertyStr(obj, "name", 1) + ",";
    result += atomGenerateObjPropertyStr(obj, "type", 1) + ",";
    result += atomGenerateObjPropertyStr(obj, "x", 0) + ",";
    result += atomGenerateObjPropertyStr(obj, "y", 0) + ",";
    result += atomGenerateObjPropertyStr(obj, "width", 0) + ",";
    result += atomGenerateObjPropertyStr(obj, "height", 0) + ",";
    if (obj.normal != null)
    {
        result += "\n";
        result += indent + "\t" + "normal:" + atomGenerateTextObjStr(obj.normal);
    }
    if (obj.over != null)
    {
        result += ",";
        result += "\n";
        result += indent + "\t" + "over:" + atomGenerateTextObjStr(obj.over);
    }
    if (obj.down != null)
    {
        result += ",";
        result += "\n";
        result += indent + "\t" + "down:" + atomGenerateTextObjStr(obj.down);
    }
    if (obj.disable != null)
    {
        result += ",";
        result += "\n";
        result += indent + "\t" + "disable:" + atomGenerateTextObjStr(obj.disable);
    }
    result += "\n";
    result += indent + "}";
    return result;
}

//---------------------------------------------------------------------------------
//atom operation
//---------------------------------------------------------------------------------
function atomParseTextElement(element)
{
    var result = new Object();
    result.name = eliminateElementDummyToken(element);
    validateComponentNameFirstToken("Label", result.name);
    result.x = element.left;
    result.y = element.top + 1;
    result.width = element.width;
    result.height = element.height;
    result.content = "";
    var textRunsArr = element.textRuns.textRuns;
    result.format = parseTextDefaultTextFormat(element.textRuns.initialAttrs);
    var len = textRunsArr.length;
    for (var i = 0; i < len; i++)
    {
        var content = textRunsArr[i].characters;
        if (typeof (content) == "string")
        {
            content = content.replace(/\r/g, "\\n");
        }
        var obj = textRunsArr[i].changedAttrs;
        if (obj.underline == true)
        {
            content = "<u>" + content + "</u>";
        }
        if (obj.bold == true)
        {
            content = "<b>" + content + "</b>";
        }
        content = "<font color='" + obj.fillColor + "'>" + content + "</font>";
        result.content += content;
    }
    result.bound = {
        x: element.left,
        y: element.top + 1,
        width: element.width,
        height: element.height + 1
    };
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
    result.letterSpacing = Math.round(textAttrs.rangeKerning * result.size * 0.1 * 100) * 0.01;
    var leading = Math.round(result.size * (textAttrs.leading - 1));
    if (leading < 0)
    {
        leading = 0;
    }
    result.leading = leading;
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
    var result = new Object();
    var obj = parseImageName(element);
    var prefix = psdName;
    validateComponentNameFirstToken("Image", obj.name);
    validateImageName(obj.name);
    if (sharedResourceMap[obj.name] != null)
    {
        prefix = SHARED;
    }
    result.link = prefix + "." + obj.name;
    var rect = element.pixelRect;
    result.x = rect.left;
    result.y = rect.top;
    result.width = rect.right - rect.left;
    result.height = rect.bottom - rect.top;
    result.bound = {
        x: element.left,
        y: element.top,
        width: element.width,
        height: element.height
    };
    return result;
}

function atomGenerateTextObjStr(obj)
{
    var result = "{";
    result += atomGenerateObjPropertyStr(obj, "x", 0) + ",";
    result += atomGenerateObjPropertyStr(obj, "y", 0) + ",";
    result += atomGenerateObjPropertyStr(obj, "width", 0) + ",";
    result += atomGenerateObjPropertyStr(obj, "height", 0) + ",";
    result += atomGenerateObjPropertyStr(obj, "content", 1) + ",";
    result += "format:{";
    result += atomGenerateObjPropertyStr(obj.format, "align", 1) + ",";
    result += atomGenerateObjPropertyStr(obj.format, "bold", 0) + ",";
    result += atomGenerateObjPropertyStr(obj.format, "color", 0) + ",";
    result += atomGenerateObjPropertyStr(obj.format, "font", 1) + ",";
    result += atomGenerateObjPropertyStr(obj.format, "italic", 0) + ",";
    result += atomGenerateObjPropertyStr(obj.format, "leading", 0) + ",";
    result += atomGenerateObjPropertyStr(obj.format, "letterSpacing", 0) + ",";
    result += atomGenerateObjPropertyStr(obj.format, "size", 0) + ",";
    result += atomGenerateObjPropertyStr(obj.format, "underline", 0);
    result += "}}";
    return result;
}

function atomGenerateImageObjStr(obj)
{
    return atomGenerateObjStr(obj, ["link", "x", "y", "width", "height"], [1, 0, 0, 0, 0]);
}

//0为数字，1为字符串
function atomGenerateObjStr(obj, propertyList, typeList)
{
    if (propertyList.length != typeList.length)
    {
        logError("属性长度和属性类型长度不符");
        return "";
    }
    var result = "{";
    var len = propertyList.length;
    for (var i = 0; i < len; i++)
    {
        result += atomGenerateObjPropertyStr(obj, propertyList[i], typeList[i]);
        if (i < (len - 1))
        {
            result += ",";
        }
    }
    result += "}";
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
function parseImageName(element)
{
    var str = eliminateElementDummyToken(element);
    var obj = new Object();
    var arr = str.split("_");
    obj.name = arr[0];
    obj.quality = arr[1] == undefined ? 80 : arr[1];
    return obj;
}

function parseElementName(element)
{
    var str = eliminateElementDummyToken(element);
    var obj = new Object();
    var arr = str.split("_");
    obj.name = extractElementName(arr);
    obj.type = extractElementType(arr);
    obj.param = extractElementParam(arr);
    return obj;
}

function getElementParser(element)
{
    var obj = parseElementName(element);
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
    var result = new Object();
    var left = 1048576;
    var top = 1048576;
    var right = 0;
    var bottom = 0;
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
    //var filepath = fw.browseForFileURL("save");
    //if (filepath == null) return false;
    //var defaultname = Files.getFilename(filepath);
    defaultname = "image";
    var filepath = Files.getDirectory(psdPath);
    //var filePath = psdPath;
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
        if (dom.layers[i].layerType == "web" || dom.layers[i].frames[f].visible == false) continue;
        m = dom.layers[i].frames[f].elements.length;
        for (j = 0; j < m; j++)
        {
            elem = dom.layers[i].frames[f].elements[j];
            if (elem.visible)
            {
                elem.visible = false;
                visArr.push(elem);
            }
            else
            {
                visArr["_" + i + "_" + j] = true;
            }
        }
    }

    var rect, name, filename, counter = 1;
    var quality = 80;
    assetXML = "<data name=\"" + psdName + "\">\n";
    for (i = 0; i < n; i++)
    {
        if (dom.layers[i].layerType == "web" || dom.layers[i].frames[f].visible == false) continue;
        m = dom.layers[i].frames[f].elements.length;
        for (j = 0; j < m; j++)
        {
            if (visArr["_" + i + "_" + j]) continue;
            elem = dom.layers[i].frames[f].elements[j];
            if (elem instanceof Text) continue; //ignore text elements
            rect = elem.pixelRect;
            elem.visible = true;
            var obj = parseImageName(elem);
            name = obj.name;
            if (name == null) name = defaultname + (counter++);
            var folder = "";
            var tempAssetImportCode = "";
            if (sharedResourceMap[name] != null)
            {
                folder = filepath + "/" + SHARED;
                createInexistentFolder(folder);
                filename = folder + "/" + name + ".png";
                tempAssetImportCode = "\timport " + SHARED + "." + name + ";" + name + ";\n";
            }
            else
            {
                folder = filepath + "/" + psdName;
                createInexistentFolder(folder);
                filename = folder + "/" + name + ".png";
                tempAssetImportCode = "\timport " + psdName + "." + name + ";" + name + ";\n";
            }
            if (assetImportMap[tempAssetImportCode] == null)
            {
                assetImportCode += tempAssetImportCode;
                assetImportMap[tempAssetImportCode] = 1;
            }
            assetXML += "\t<node quality='" + obj.quality + "'>" + convertFileName(filename) + "</node>\n";
            sXO.cropLeft = rect.left;
            sXO.cropRight = rect.right;
            sXO.cropTop = rect.top;
            sXO.cropBottom = rect.bottom;
            fw.exportDocumentAs(dom, filename, sXO);
            elem.visible = false;
        }
    }
    assetXML += "</data>";
    i = visArr.length;
    while (i--) visArr[i].visible = true;
    sXO.crop = oldcrop;
    dom.lastExportDirectory = filepath;
    fw.selection = elems;
    return true;
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
        Files.createDirectory(path);
    }
}