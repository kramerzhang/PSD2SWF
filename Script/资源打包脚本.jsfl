/*@author Kramer
UI资源打包工具，将每个面板的资源打包为一个SWC。
资源打包过程中会自动忽略公共资源（文件名）
1.单一文件打包模式：选择模块资源描述XML文件。
2.批量文件打包模式：选择资源保存目录，程序将自动读取目录下资源描述文件进行打包。
*/
var xmlPath = "";
var profileXML = null;
var xmlFileName ="";
var moduleName = "";
var xml = null;
var imageMap = {};
var qualityMap = {};
var doc = null;
var mode = 0; //0:单一文件模式，1:批量文件模式
var xmlMask = "*.xml";
var logStr = "";
var folderPath = "";
var SHARED = "shared";
//打包生成文件缺省为PSD文件目录下的子目录
var FLA_FOLDER = "1_fla";
var SWF_FOLDER = "2_swf";
var SWC_FOLDER = "3_swc";
var SETTING_FILE_NAME = "PSD2SWF.ini";
var FLA_FOLDER_TOKEN = "FLA_FOLDER=";
var SWF_FOLDER_TOKEN = "SWF_FOLDER=";
var SWC_FOLDER_TOKEN = "SWC_FOLDER=";

//main();

function main()
{
	mode = prompt("请选择模式：0：单一文件模式，1：批量文件模式", "0");
	if(mode == 0)
	{
		packSingle();
	}
	else if(mode == 1)
	{
		packBatch();
	}
}

function packSingle()
{
	imageMap={};
	readXml();
	createDoc();
	writeLog(folderPath);
}

function packBatch()
{
	folderPath = fl.browseForFolderURL("请选择xml目录");
	folderPath = folderPath + "/";
	readSetting();
	var xmlList = FLfile.listFolder(folderPath + xmlMask, "files");
	var len = xmlList.length;
	for(var i = 0; i < len; i++)
	{
		if(xmlList[i] == "shared.xml")continue;
		xmlPath = folderPath + xmlList[i];
		xml = XML(FLfile.read(xmlPath));
		imageMap={};
		parseXml();
		createDoc();
	}
	writeLog(folderPath);
}

function readXml()
{
	xmlPath = fl.browseForFileURL('open', '选择资源配置文件');
	xml = XML(FLfile.read(xmlPath));
	var index = xmlPath.lastIndexOf("/");
	folderPath = xmlPath.substr(0, index + 1);
	readSetting();
	parseXml();
}

function initFolderDefaultSetting()
{
	FLA_FOLDER = FLfile.uriToPlatformPath(folderPath + FLA_FOLDER);
	FLA_FOLDER = FLA_FOLDER.replace(/\\/g, "/");
	SWF_FOLDER = FLfile.uriToPlatformPath(folderPath + SWF_FOLDER);
	SWF_FOLDER = SWF_FOLDER.replace(/\\/g, "/");
	SWC_FOLDER = FLfile.uriToPlatformPath(folderPath + SWC_FOLDER);
	SWC_FOLDER = SWC_FOLDER.replace(/\\/g, "/");
}

function readSetting()
{
	initFolderDefaultSetting();
	var path = folderPath + SETTING_FILE_NAME;
	var setting = FLfile.read(path);
	var matchResult = setting.match(/^[^\#\s]+?$/igm);
	if(matchResult != null)
	{
		for(var i = 0; i < matchResult.length; i++)
		{
			var line = matchResult[i];
			readFlaFolderSetting(line);
			readSwfFolderSetting(line);
			readSwcFolderSetting(line);
		}
	}
}

function readFlaFolderSetting(line)
{
	var folder = readFolderSetting(line, FLA_FOLDER_TOKEN);
	if(folder != null)
	{
		FLA_FOLDER = folder;
	}
}

function readSwfFolderSetting(line)
{
	var folder = readFolderSetting(line, SWF_FOLDER_TOKEN);
	if(folder != null)
	{
		SWF_FOLDER = folder;
	}
}

function readSwcFolderSetting(line)
{
	var folder = readFolderSetting(line, SWC_FOLDER_TOKEN);
	if(folder != null)
	{
		SWC_FOLDER = folder;
	}
}

function readFolderSetting(line, token)
{
	var result = null;
	var index = line.indexOf(token);
	if(index != -1)
	{
		result = line.substring(token.length); 
		result = result.replace(/\\/g, "/");
	}
	return result;
}

function parseXml()
{
	moduleName = xml.@name;
	for each(var node in xml.node)
	{
		var nodeContent = node.toString();
		var qualityValue = node.@quality ? node.@quality : 80;
		if(moduleName != SHARED && nodeContent.indexOf("\\" + SHARED + "\\") != -1)
		{
			continue;
		}
		var imagePath = convertToUrl(nodeContent);
		if(imageMap[imagePath] == null)
		{
			imageMap[imagePath] = imagePath;
			qualityMap[imagePath] = qualityValue;
		}
	}
}

function createDoc()
{
	doc = fl.createDocument();
	importImage();
	addLinkageName();
	var flaFolder = FLfile.platformPathToURI(FLA_FOLDER + "/");
	var swfFolder = FLfile.platformPathToURI(SWF_FOLDER + "/");
	var swcFolder = FLfile.platformPathToURI(SWC_FOLDER + "/");
	createInexistentFolder(flaFolder);
	createInexistentFolder(swfFolder);
	createInexistentFolder(swcFolder)
	createPublishSWCProfile();
	var flaPath = flaFolder + moduleName + ".fla";
	fl.saveDocument(doc, flaPath);
	doc.publish();
	doc.close(false);
}

function createPublishSWCProfile()
{
	if(profileXML == null)
	{
		profileXML = XML(doc.exportPublishProfileString());
		profileXML.PublishFormatProperties.html = 0;
		profileXML.PublishFormatProperties.flash = 1;
		profileXML.PublishFormatProperties.swc = 1;
		profileXML.PublishFormatProperties.defaultNames = 0;
		profileXML.PublishFormatProperties.flashDefaultName = 0;
		profileXML.PublishFormatProperties.swcDefaultName = 0;
		profileXML.PublishFlashProperties.ExportSwc = 1;
		profileXML.PublishFlashProperties.IncludeXMP = 0;
	}
	profileXML.PublishFormatProperties.swcFileName = SWC_FOLDER + "/" + moduleName + ".swc";
	profileXML.PublishFormatProperties.flashFileName = SWF_FOLDER + "/" + moduleName + ".swf";
	doc.importPublishProfileString(profileXML);
}

function importImage()
{
	for(var str in imageMap)
	{
		var imagePath = folderPath + str;
		if(FLfile.exists(imagePath) == true)
		{
			doc.importFile(imagePath, true);
		}
		else
		{
			logStr += xmlPath + "  " + imagePath + "\t is not exists\r\n"; 
		}
	}
}

function convertToUrl(pathStr)
{
	result = FLfile.platformPathToURI(pathStr);
	result = result.replace(folderPath, "");
	return result;
}

function addLinkageName()
{
	var lib = fl.getDocumentDOM().library;
	var itemList = lib.items;
	var len = itemList.length;
	for(var i = 0; i < len; i++)
	{
		var item = itemList[i];
		lib.selectItem(item.name);
		var imageQuality = qualityMap[moduleName + "/" + item.name];
		imageQuality = parseInt(imageQuality);
		if(imageQuality == 100)
		{
			lib.setItemProperty('compressionType', 'lossless');
		}
		else
		{
			lib.setItemProperty('compressionType', 'photo');
			lib.setItemProperty('useImportedJPEGQuality', false);
			lib.setItemProperty('quality', imageQuality);
		}
		lib.setItemProperty('linkageExportForAS', true);
		lib.setItemProperty('linkageExportForRS', false);
		lib.setItemProperty('linkageExportInFirstFrame', true);
		var linkName = item.name.replace(/\.png|\.jpg/g, "");
		lib.setItemProperty('linkageClassName', moduleName + "." + linkName);
	}
}

function writeLog(folderPath)
{
	if(logStr == "")
	{
		return;
	}
	var date = new Date();
	var logName = "log_" + date.getFullYear() + "_" + (date.getMonth() + 1) + "_" + date.getDate() + "_" + date.getHours() + "_" + date.getMinutes() + ".txt" 
	var logPath = folderPath + logName;
	FLfile.write(logPath, logStr);
}

function createInexistentFolder(path)
{
	if(FLfile.exists(path) == false)
	{
		FLfile.createFolder(path);
	}
}