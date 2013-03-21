/*@author Kramer
公共资源提取进行频率很低。
该脚本从各系统中资源xml中提取重用度大于设定值INDEX_THRESHOLD值的资源生成shared.xml.
INDEX_THRESHOLD值的设定由shared.swf文件体积大小而定，可调节。
该脚本执行之后，需要将各系统资源重新生成一次。
*/
var xmlMask = "*.xml";
var pngMask = "*.png";
var imageMap = {};
var sharedXml = null;
var INDEX_THRESHOLD = 1;
var folderPath = "";
var SHARED = "shared";

//main();

function main()
{
	fl.outputPanel.clear();
	folderPath = fl.browseForFolderURL("请选择xml目录");
	var xmlList = FLfile.listFolder(folderPath + "/" + xmlMask, "files");
	var len = xmlList.length;
	for(var i = 0; i < len; i++)
	{
		xmlPath = folderPath + "/" + xmlList[i];
		xml = XML(FLfile.read(xmlPath));
		if(xml.@name == SHARED)
		{
			continue;
		}
		parseXml();
	}
	clearSharedImage();
	generateSharedXml();
}

function parseXml()
{
	for each(var node in xml.node)
	{
		var imageName = eliminateDir(node.toString());
		var recordObj;
		if(imageMap[imageName] == null)
		{
			recordObj = {};
			recordObj.heat = 1;
			recordObj.quality = 0;
			imageMap[imageName] = recordObj;
		}
		else
		{
			recordObj = imageMap[imageName];
			recordObj.heat += 1;
		}
		var quality = parseInt(node.@quality);
		quality = isNaN(quality) ? 80 : quality;
		if(quality > recordObj.quality)
		{
			recordObj.quality = quality;
		}
		recordObj.moduleName = xml.@name;
		recordObj.imageName = imageName;
		recordObj.imagePath = node.toString();
	}
}

function generateSharedXml()
{
	fl.outputPanel.trace("<data name=\"" + SHARED + "\">");
	for(var k in imageMap)
	{
		var recordObj = imageMap[k];
		if(recordObj.heat < INDEX_THRESHOLD)
		{
			continue;
		}
		var imagePath = recordObj.imagePath
		var sharedPath = imagePath.replace(recordObj.moduleName, SHARED);
		copyImageToSharedFolder(recordObj);
		var nodeStr = "\t<node heat=\"" + recordObj.heat + "\" quality=\"" + recordObj.quality + "\">" + sharedPath + "</node>";
		fl.outputPanel.trace(nodeStr);
	}
	fl.outputPanel.trace("</data>");
	var xmlName = "shared.xml";
	var xmlPath = folderPath + "/" + xmlName;
	fl.outputPanel.save(xmlPath);
}

function clearSharedImage()
{
	var pngList = FLfile.listFolder(folderPath + "/" + SHARED + "/" + pngMask, "files");
	var len = pngList.length;
	for(var i = 0; i < len; i++)
	{
		pngPath = folderPath + "/" + SHARED + "/" + pngList[i];
		FLfile.remove(pngPath);
	}
}

function copyImageToSharedFolder(recordObj)
{
	var sourcePath = folderPath + "/" + recordObj.moduleName + "/" + recordObj.imageName;
	var sharedFolderPath = folderPath + "/shared";
	if(FLfile.exists(sharedFolderPath) == false)
	{
		FLfile.createFolder(sharedFolderPath);
	}
	var targetPath = sharedFolderPath + "/" + recordObj.imageName;
	FLfile.copy(sourcePath, targetPath);
}

function eliminateDir(pathStr)
{
	var index = pathStr.lastIndexOf("\\");
	var lastIndex = pathStr.length;
	var result = pathStr.substr((index + 1), lastIndex);
	return result;
}
