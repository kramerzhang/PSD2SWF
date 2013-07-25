package game.skin
{
	import shared.di;di;
	import shared.mpfa1;mpfa1;
	import shared.mofa;mofa;
	import shared.xuetiao1;xuetiao1;
	import shared.xuetiao;xuetiao;
	import shared.dishang;dishang;
	import shared.nu;nu;
	import shared.nuqidiank;nuqidiank;
	import shared.nuqidiankb;nuqidiankb;
	import shared.nuqidiang;nuqidiang;
	import shared.nuqidiangc;nuqidiangc;
	import shared.nuqidianc;nuqidianc;
	import shared.nuqidiancb;nuqidiancb;
	import shared.nuqidiand;nuqidiand;
	import shared.nuqidiandc;nuqidiandc;
	import shared.nuqidianh;nuqidianh;
	import shared.nuqidianhc;nuqidianhc;
	import shared.nuqidianl;nuqidianl;
	import shared.nuqidianlc;nuqidianlc;
	import shared.jingyantiao;jingyantiao;
	import shared.gege;gege;
	import shared.gezif;gezif;
	import shared.gezioo;gezioo;
	import shared.gezisrg;gezisrg;
	import shared.gezisgerh;gezisgerh;
	import shared.geziswefw3e;geziswefw3e;
	import shared.geziswe;geziswe;
	import shared.gezisergwe;gezisergwe;
	import shared.geziawa;geziawa;
	import shared.gezisad;gezisad;
	import shared.kuang1;kuang1;
	import shared.shagnchegn;shagnchegn;
	import shared.shangchengb;shangchengb;
	import shared.shangchengc;shangchengc;
	import shared.zhizuo;zhizuo;
	import shared.zhizuo1;zhizuo1;
	import shared.zhizuo2;zhizuo2;
	import shared.zhizuo3;zhizuo3;
	import shared.richang;richang;
	import shared.richagnb;richagnb;
	import shared.richagnc;richagnc;
	import shared.huoban;huoban;
	import shared.huoban1;huoban1;
	import shared.huoban2;huoban2;
	import shared.huoban3;huoban3;
	import shared.shenhun;shenhun;
	import shared.shenhunb;shenhunb;
	import shared.shenhunc;shenhunc;
	import shared.jineng;jineng;
	import shared.jinengb;jinengb;
	import shared.jinengc;jinengc;
	import shared.beibao;beibao;
	import shared.beibaob;beibaob;
	import shared.beibaoc;beibaoc;
	import shared.juese;juese;
	import shared.jueseb;jueseb;
	import shared.juesec;juesec;
	import shared.jialan;jialan;
	import shared.jialanb;jialanb;
	import shared.jialanc;jialanc;
	import shared.jiaxie;jiaxie;
	import shared.jiaxieb;jiaxieb;
	import shared.jiaxiec;jiaxiec;
	import shared.youbiao;youbiao;
	import shared.dazuo;dazuo;
	import shared.dazuob;dazuob;
	import shared.dazuoc;dazuoc;
	import shared.bangpai;bangpai;
	import shared.bangpai1;bangpai1;
	import shared.bangpai2;bangpai2;
	import shared.bangpai3;bangpai3;
	import shared.guaji;guaji;
	import shared.guaji1;guaji1;
	import shared.guaji2;guaji2;
	import shared.guaji3;guaji3;
	import shared.kaishi;kaishi;
	import shared.kaishi1;kaishi1;
	import shared.kaishi2;kaishi2;
	import shared.kaishi3;kaishi3;
	import shared.chfbang;chfbang;
	import shared.baoshib;baoshib;
	import shared.baoshic;baoshic;
	import shared.lianqi;lianqi;
	import shared.lianqix;lianqix;
	import shared.lianqiz;lianqiz;

	/*组件结构大纲
	MainMenuPanel:Container
		lianqi:Button
		baoshi:Button
		guaji:Button
		zhanting:Button
		banghui:Button
		dazuo:Button
		youbiao:Button
		youbiaob:Button
		jian:Button
		jia:Button
		jiaose:Button
		beibao:Button
		jineng:Button
		shenhun:Button
		wujiang:Button
		haoyou:Button
		zhizuo:Button
		shangcheng:Button
		txtjingyanzhi:Label
		skillMenu:Container
			txt8:Label
			txt7:Label
			txt6:Label
			txt5:Label
			txt4:Label
			txt3:Label
			txt2:Label
			txt1:Label
			kuang1:Image
		gezisad:Image
		geziawa:Image
		gezisergwe:Image
		geziswe:Image
		geziswefw3e:Image
		gezisgerh:Image
		gezisrg:Image
		gezioo:Image
		gezif:Image
		gege:Image
		jingyantiao:Image
		circle0:Container
			nuqidianlc:Image
			nuqidianl:Image
		circle1:Container
			nuqidianhc:Image
			nuqidianh:Image
		circle2:Container
			nuqidiandc:Image
			nuqidiand:Image
		circle3:Container
			nuqidiancb:Image
			nuqidianc:Image
		circle4:Container
			nuqidiangc:Image
			nuqidiang:Image
		circle5:Container
			nuqidiankb:Image
			nuqidiank:Image
		nu:Image
		dishang:Image
		hp:Container
			xuetiao:Image
		xuetiao1:Image
		mp:Container
			mofa:Image
		mpfa1:Image
		di:Image
	*/
	public class MainMenuPanelSkin
	{
		public static var skin:Object=
			{name:"MainMenuPanel",type:"Container",x:0,y:0,width:898,height:131,
				children:
				[
					{name:"lianqi",type:"Button",x:530,y:24,width:34,height:42,
						children:
						[
							{name:"myImage",type:"Image",x:0,y:0,width:34,height:42,
								normal:{link:"shared.lianqi",x:0,y:0,width:34,height:41},
								over:{link:"shared.lianqix",x:0,y:0,width:34,height:41},
								down:{link:"shared.lianqiz",x:0,y:0,width:34,height:42}
							}
						]
					},
					{name:"baoshi",type:"Button",x:568,y:24,width:34,height:42,
						children:
						[
							{name:"myImage",type:"Image",x:0,y:0,width:34,height:42,
								normal:{link:"shared.chfbang",x:0,y:0,width:34,height:41},
								over:{link:"shared.baoshib",x:0,y:0,width:34,height:41},
								down:{link:"shared.baoshic",x:0,y:0,width:34,height:42}
							}
						]
					},
					{name:"guaji",type:"Button",x:645,y:24,width:34,height:41,
						children:
						[
							{name:"myImage",type:"Image",x:0,y:0,width:34,height:41,
								normal:{link:"shared.kaishi",x:0,y:0,width:34,height:41},
								over:{link:"shared.kaishi1",x:0,y:0,width:34,height:41},
								down:{link:"shared.kaishi2",x:0,y:0,width:34,height:41},
								disable:{link:"shared.kaishi3",x:0,y:0,width:34,height:41}
							}
						]
					},
					{name:"zhanting",type:"Button",x:645,y:24,width:34,height:41,
						children:
						[
							{name:"myImage",type:"Image",x:0,y:0,width:34,height:41,
								normal:{link:"shared.guaji",x:0,y:0,width:34,height:41},
								over:{link:"shared.guaji1",x:0,y:0,width:34,height:41},
								down:{link:"shared.guaji2",x:0,y:0,width:34,height:41},
								disable:{link:"shared.guaji3",x:0,y:0,width:34,height:41}
							}
						]
					},
					{name:"banghui",type:"Button",x:717,y:70,width:37,height:46,
						children:
						[
							{name:"myImage",type:"Image",x:0,y:0,width:37,height:46,
								normal:{link:"shared.bangpai",x:0,y:0,width:37,height:45},
								over:{link:"shared.bangpai1",x:0,y:0,width:37,height:45},
								down:{link:"shared.bangpai2",x:0,y:0,width:37,height:46},
								disable:{link:"shared.bangpai3",x:0,y:0,width:37,height:45}
							}
						]
					},
					{name:"dazuo",type:"Button",x:606,y:24,width:34,height:41,
						children:
						[
							{name:"myImage",type:"Image",x:0,y:0,width:34,height:41,
								normal:{link:"shared.dazuo",x:0,y:0,width:34,height:40},
								over:{link:"shared.dazuob",x:0,y:0,width:34,height:40},
								down:{link:"shared.dazuoc",x:0,y:0,width:34,height:41}
							}
						]
					},
					{name:"youbiao",type:"Button",x:446,y:10,width:9,height:25,
						children:
						[
							{name:"myImage",type:"Image",x:0,y:0,width:9,height:25,
								normal:{link:"shared.youbiao",x:0,y:0,width:9,height:25}
							}
						]
					},
					{name:"youbiaob",type:"Button",x:446,y:10,width:9,height:25,
						children:
						[
							{name:"myImage",type:"Image",x:0,y:0,width:9,height:25,
								normal:{link:"shared.youbiao",x:0,y:0,width:9,height:25}
							}
						]
					},
					{name:"jian",type:"Button",x:408,y:92,width:24,height:24,
						children:
						[
							{name:"myImage",type:"Image",x:0,y:0,width:24,height:24,
								normal:{link:"shared.jiaxie",x:0,y:0,width:24,height:24},
								over:{link:"shared.jiaxieb",x:0,y:0,width:24,height:24},
								down:{link:"shared.jiaxiec",x:0,y:0,width:24,height:24}
							}
						]
					},
					{name:"jia",type:"Button",x:472,y:92,width:24,height:24,
						children:
						[
							{name:"myImage",type:"Image",x:0,y:0,width:24,height:24,
								normal:{link:"shared.jialan",x:0,y:0,width:24,height:24},
								over:{link:"shared.jialanb",x:0,y:0,width:24,height:24},
								down:{link:"shared.jialanc",x:0,y:0,width:24,height:24}
							}
						]
					},
					{name:"jiaose",type:"Button",x:527,y:70,width:37,height:46,
						children:
						[
							{name:"myImage",type:"Image",x:0,y:0,width:37,height:46,
								normal:{link:"shared.juese",x:0,y:0,width:37,height:45},
								over:{link:"shared.jueseb",x:0,y:0,width:37,height:45},
								down:{link:"shared.juesec",x:0,y:0,width:37,height:46}
							}
						]
					},
					{name:"beibao",type:"Button",x:565,y:70,width:37,height:46,
						children:
						[
							{name:"myImage",type:"Image",x:0,y:0,width:37,height:46,
								normal:{link:"shared.beibao",x:0,y:0,width:37,height:45},
								over:{link:"shared.beibaob",x:0,y:0,width:37,height:45},
								down:{link:"shared.beibaoc",x:0,y:0,width:37,height:46}
							}
						]
					},
					{name:"jineng",type:"Button",x:603,y:70,width:37,height:46,
						children:
						[
							{name:"myImage",type:"Image",x:0,y:0,width:37,height:46,
								normal:{link:"shared.jineng",x:0,y:0,width:37,height:45},
								over:{link:"shared.jinengb",x:0,y:0,width:37,height:45},
								down:{link:"shared.jinengc",x:0,y:0,width:37,height:46}
							}
						]
					},
					{name:"shenhun",type:"Button",x:641,y:70,width:37,height:46,
						children:
						[
							{name:"myImage",type:"Image",x:0,y:0,width:37,height:46,
								normal:{link:"shared.shenhun",x:0,y:0,width:37,height:45},
								over:{link:"shared.shenhunb",x:0,y:0,width:37,height:45},
								down:{link:"shared.shenhunc",x:0,y:0,width:37,height:46}
							}
						]
					},
					{name:"wujiang",type:"Button",x:679,y:70,width:37,height:45,
						children:
						[
							{name:"myImage",type:"Image",x:0,y:0,width:37,height:45,
								normal:{link:"shared.huoban",x:0,y:0,width:37,height:45},
								over:{link:"shared.huoban1",x:0,y:0,width:37,height:45},
								down:{link:"shared.huoban2",x:0,y:0,width:37,height:45},
								disable:{link:"shared.huoban3",x:0,y:0,width:37,height:45}
							}
						]
					},
					{name:"haoyou",type:"Button",x:755,y:70,width:37,height:46,
						children:
						[
							{name:"myImage",type:"Image",x:0,y:0,width:37,height:46,
								normal:{link:"shared.richang",x:0,y:0,width:37,height:45},
								over:{link:"shared.richagnb",x:0,y:0,width:37,height:45},
								down:{link:"shared.richagnc",x:0,y:0,width:37,height:46}
							}
						]
					},
					{name:"zhizuo",type:"Button",x:793,y:70,width:37,height:45,
						children:
						[
							{name:"myImage",type:"Image",x:0,y:0,width:37,height:45,
								normal:{link:"shared.zhizuo",x:0,y:0,width:37,height:45},
								over:{link:"shared.zhizuo1",x:0,y:0,width:37,height:45},
								down:{link:"shared.zhizuo2",x:0,y:0,width:37,height:45},
								disable:{link:"shared.zhizuo3",x:0,y:0,width:37,height:45}
							}
						]
					},
					{name:"shangcheng",type:"Button",x:831,y:70,width:37,height:46,
						children:
						[
							{name:"myImage",type:"Image",x:0,y:0,width:37,height:46,
								normal:{link:"shared.shagnchegn",x:0,y:0,width:37,height:45},
								over:{link:"shared.shangchengb",x:0,y:0,width:37,height:45},
								down:{link:"shared.shangchengc",x:0,y:0,width:37,height:46}
							}
						]
					},
					{name:"txtjingyanzhi",type:"Label",x:440,y:116,width:24,height:14,
						normal:{x:0,y:0,width:24,height:14,content:"<font color='#ffffff'>70%</font>",format:{align:"left",bold:false,color:0xffffff,font:"Tahoma",italic:false,leading:13.75,letterSpacing:0,size:9,underline:false}}
					},
					{name:"skillMenu",type:"Container",x:28,y:71,width:343,height:42,
						children:
						[
							{name:"txt8",type:"Label",x:305,y:4,width:9,height:15,
								normal:{x:0,y:0,width:9,height:15,content:"<font color='#ffffff'>8</font>",format:{align:"left",bold:false,color:0xffffff,font:"ArialMT",italic:false,leading:24,letterSpacing:0,size:9,underline:false}}
							},
							{name:"txt7",type:"Label",x:262,y:4,width:9,height:15,
								normal:{x:0,y:0,width:9,height:15,content:"<font color='#ffffff'>7</font>",format:{align:"left",bold:false,color:0xffffff,font:"ArialMT",italic:false,leading:24,letterSpacing:0,size:9,underline:false}}
							},
							{name:"txt6",type:"Label",x:219,y:4,width:9,height:15,
								normal:{x:0,y:0,width:9,height:15,content:"<font color='#ffffff'>6</font>",format:{align:"left",bold:false,color:0xffffff,font:"ArialMT",italic:false,leading:24,letterSpacing:0,size:9,underline:false}}
							},
							{name:"txt5",type:"Label",x:176,y:4,width:9,height:15,
								normal:{x:0,y:0,width:9,height:15,content:"<font color='#ffffff'>5</font>",format:{align:"left",bold:false,color:0xffffff,font:"ArialMT",italic:false,leading:24,letterSpacing:0,size:9,underline:false}}
							},
							{name:"txt4",type:"Label",x:133,y:4,width:9,height:15,
								normal:{x:0,y:0,width:9,height:15,content:"<font color='#ffffff'>4</font>",format:{align:"left",bold:false,color:0xffffff,font:"ArialMT",italic:false,leading:24,letterSpacing:0,size:9,underline:false}}
							},
							{name:"txt3",type:"Label",x:90,y:4,width:9,height:15,
								normal:{x:0,y:0,width:9,height:15,content:"<font color='#ffffff'>3</font>",format:{align:"left",bold:false,color:0xffffff,font:"ArialMT",italic:false,leading:24,letterSpacing:0,size:9,underline:false}}
							},
							{name:"txt2",type:"Label",x:47,y:4,width:9,height:15,
								normal:{x:0,y:0,width:9,height:15,content:"<font color='#ffffff'>2</font>",format:{align:"left",bold:false,color:0xffffff,font:"ArialMT",italic:false,leading:24,letterSpacing:0,size:9,underline:false}}
							},
							{name:"txt1",type:"Label",x:4,y:4,width:9,height:15,
								normal:{x:0,y:0,width:9,height:15,content:"<font color='#ffffff'>1</font>",format:{align:"left",bold:false,color:0xffffff,font:"ArialMT",italic:false,leading:24,letterSpacing:0,size:9,underline:false}}
							},
							{name:"kuang1",type:"Image",x:0,y:0,width:343,height:42,
								normal:{link:"shared.kuang1",x:0,y:0,width:343,height:42}
							}
						]
					},
					{name:"gezisad",type:"Image",x:831,y:70,width:37,height:43,
						normal:{link:"shared.gezisad",x:0,y:0,width:37,height:43}
					},
					{name:"geziawa",type:"Image",x:793,y:70,width:37,height:43,
						normal:{link:"shared.geziawa",x:0,y:0,width:37,height:43}
					},
					{name:"gezisergwe",type:"Image",x:755,y:70,width:37,height:43,
						normal:{link:"shared.gezisergwe",x:0,y:0,width:37,height:43}
					},
					{name:"geziswe",type:"Image",x:717,y:70,width:37,height:43,
						normal:{link:"shared.geziswe",x:0,y:0,width:37,height:43}
					},
					{name:"geziswefw3e",type:"Image",x:679,y:70,width:37,height:43,
						normal:{link:"shared.geziswefw3e",x:0,y:0,width:37,height:43}
					},
					{name:"gezisgerh",type:"Image",x:641,y:70,width:37,height:43,
						normal:{link:"shared.gezisgerh",x:0,y:0,width:37,height:43}
					},
					{name:"gezisrg",type:"Image",x:565,y:70,width:37,height:43,
						normal:{link:"shared.gezisrg",x:0,y:0,width:37,height:43}
					},
					{name:"gezioo",type:"Image",x:527,y:70,width:37,height:43,
						normal:{link:"shared.gezioo",x:0,y:0,width:37,height:43}
					},
					{name:"gezif",type:"Image",x:603,y:70,width:37,height:43,
						normal:{link:"shared.gezif",x:0,y:0,width:37,height:43}
					},
					{name:"gege",type:"Image",x:71,y:114,width:760,height:13,
						normal:{link:"shared.gege",x:0,y:0,width:760,height:13}
					},
					{name:"jingyantiao",type:"Image",x:26,y:118,width:848,height:6,
						normal:{link:"shared.jingyantiao",x:0,y:0,width:848,height:6}
					},
					{name:"circle0",type:"Container",x:424,y:73,width:9,height:9,
						children:
						[
							{name:"nuqidianlc",type:"Image",x:0,y:3,width:9,height:6,
								normal:{link:"shared.nuqidianlc",x:0,y:0,width:9,height:6}
							},
							{name:"nuqidianl",type:"Image",x:0,y:0,width:9,height:9,
								normal:{link:"shared.nuqidianl",x:0,y:0,width:9,height:9}
							}
						]
					},
					{name:"circle1",type:"Container",x:427,y:57,width:9,height:9,
						children:
						[
							{name:"nuqidianhc",type:"Image",x:0,y:2,width:9,height:7,
								normal:{link:"shared.nuqidianhc",x:0,y:0,width:9,height:7}
							},
							{name:"nuqidianh",type:"Image",x:0,y:0,width:9,height:9,
								normal:{link:"shared.nuqidianh",x:0,y:0,width:9,height:9}
							}
						]
					},
					{name:"circle2",type:"Container",x:440,y:47,width:9,height:9,
						children:
						[
							{name:"nuqidiandc",type:"Image",x:0,y:0,width:6,height:9,
								normal:{link:"shared.nuqidiandc",x:0,y:0,width:6,height:9}
							},
							{name:"nuqidiand",type:"Image",x:0,y:0,width:9,height:9,
								normal:{link:"shared.nuqidiand",x:0,y:0,width:9,height:9}
							}
						]
					},
					{name:"circle3",type:"Container",x:455,y:47,width:9,height:9,
						children:
						[
							{name:"nuqidiancb",type:"Image",x:0,y:0,width:7,height:9,
								normal:{link:"shared.nuqidiancb",x:0,y:0,width:7,height:9}
							},
							{name:"nuqidianc",type:"Image",x:0,y:0,width:9,height:9,
								normal:{link:"shared.nuqidianc",x:0,y:0,width:9,height:9}
							}
						]
					},
					{name:"circle4",type:"Container",x:469,y:57,width:9,height:9,
						children:
						[
							{name:"nuqidiangc",type:"Image",x:0,y:0,width:9,height:7,
								normal:{link:"shared.nuqidiangc",x:0,y:0,width:9,height:7}
							},
							{name:"nuqidiang",type:"Image",x:0,y:0,width:9,height:9,
								normal:{link:"shared.nuqidiang",x:0,y:0,width:9,height:9}
							}
						]
					},
					{name:"circle5",type:"Container",x:472,y:73,width:9,height:9,
						children:
						[
							{name:"nuqidiankb",type:"Image",x:0,y:0,width:9,height:6,
								normal:{link:"shared.nuqidiankb",x:0,y:0,width:9,height:6}
							},
							{name:"nuqidiank",type:"Image",x:0,y:0,width:9,height:9,
								normal:{link:"shared.nuqidiank",x:0,y:0,width:9,height:9}
							}
						]
					},
					{name:"nu",type:"Image",x:420,y:43,width:65,height:53,
						normal:{link:"shared.nu",x:0,y:0,width:65,height:53}
					},
					{name:"dishang",type:"Image",x:24,y:0,width:853,height:128,
						normal:{link:"shared.dishang",x:0,y:0,width:853,height:128}
					},
					{name:"hp",type:"Container",x:388,y:10,width:62,height:118,
						children:
						[
							{name:"xuetiao",type:"Image",x:0,y:0,width:62,height:118,
								normal:{link:"shared.xuetiao",x:0,y:0,width:62,height:118}
							}
						]
					},
					{name:"xuetiao1",type:"Image",x:388,y:10,width:62,height:118,
						normal:{link:"shared.xuetiao1",x:0,y:0,width:62,height:118}
					},
					{name:"mp",type:"Container",x:450,y:10,width:63,height:118,
						children:
						[
							{name:"mofa",type:"Image",x:0,y:0,width:63,height:118,
								normal:{link:"shared.mofa",x:0,y:0,width:63,height:118}
							}
						]
					},
					{name:"mpfa1",type:"Image",x:450,y:10,width:63,height:118,
						normal:{link:"shared.mpfa1",x:0,y:0,width:63,height:118}
					},
					{name:"di",type:"Image",x:0,y:9,width:898,height:119,
						normal:{link:"shared.di",x:0,y:0,width:898,height:119}
					}
				]
			};
		public static var resource:Array=[{type:"Image", link:"shared.lianqi"}, {type:"Image", link:"shared.lianqix"}, {type:"Image", link:"shared.lianqiz"}, {type:"Image", link:"shared.chfbang"}, {type:"Image", link:"shared.baoshib"}, {type:"Image", link:"shared.baoshic"}, {type:"Image", link:"shared.kaishi"}, {type:"Image", link:"shared.kaishi1"}, {type:"Image", link:"shared.kaishi2"}, {type:"Image", link:"shared.kaishi3"}, {type:"Image", link:"shared.guaji"}, {type:"Image", link:"shared.guaji1"}, {type:"Image", link:"shared.guaji2"}, {type:"Image", link:"shared.guaji3"}, {type:"Image", link:"shared.bangpai"}, {type:"Image", link:"shared.bangpai1"}, {type:"Image", link:"shared.bangpai2"}, {type:"Image", link:"shared.bangpai3"}, {type:"Image", link:"shared.dazuo"}, {type:"Image", link:"shared.dazuob"}, {type:"Image", link:"shared.dazuoc"}, {type:"Image", link:"shared.youbiao"}, {type:"Image", link:"shared.youbiao"}, {type:"Image", link:"shared.jiaxie"}, {type:"Image", link:"shared.jiaxieb"}, {type:"Image", link:"shared.jiaxiec"}, {type:"Image", link:"shared.jialan"}, {type:"Image", link:"shared.jialanb"}, {type:"Image", link:"shared.jialanc"}, {type:"Image", link:"shared.juese"}, {type:"Image", link:"shared.jueseb"}, {type:"Image", link:"shared.juesec"}, {type:"Image", link:"shared.beibao"}, {type:"Image", link:"shared.beibaob"}, {type:"Image", link:"shared.beibaoc"}, {type:"Image", link:"shared.jineng"}, {type:"Image", link:"shared.jinengb"}, {type:"Image", link:"shared.jinengc"}, {type:"Image", link:"shared.shenhun"}, {type:"Image", link:"shared.shenhunb"}, {type:"Image", link:"shared.shenhunc"}, {type:"Image", link:"shared.huoban"}, {type:"Image", link:"shared.huoban1"}, {type:"Image", link:"shared.huoban2"}, {type:"Image", link:"shared.huoban3"}, {type:"Image", link:"shared.richang"}, {type:"Image", link:"shared.richagnb"}, {type:"Image", link:"shared.richagnc"}, {type:"Image", link:"shared.zhizuo"}, {type:"Image", link:"shared.zhizuo1"}, {type:"Image", link:"shared.zhizuo2"}, {type:"Image", link:"shared.zhizuo3"}, {type:"Image", link:"shared.shagnchegn"}, {type:"Image", link:"shared.shangchengb"}, {type:"Image", link:"shared.shangchengc"}, {type:"Image", link:"shared.kuang1"}, {type:"Image", link:"shared.gezisad"}, {type:"Image", link:"shared.geziawa"}, {type:"Image", link:"shared.gezisergwe"}, {type:"Image", link:"shared.geziswe"}, {type:"Image", link:"shared.geziswefw3e"}, {type:"Image", link:"shared.gezisgerh"}, {type:"Image", link:"shared.gezisrg"}, {type:"Image", link:"shared.gezioo"}, {type:"Image", link:"shared.gezif"}, {type:"Image", link:"shared.gege"}, {type:"Image", link:"shared.jingyantiao"}, {type:"Image", link:"shared.nuqidianlc"}, {type:"Image", link:"shared.nuqidianl"}, {type:"Image", link:"shared.nuqidianhc"}, {type:"Image", link:"shared.nuqidianh"}, {type:"Image", link:"shared.nuqidiandc"}, {type:"Image", link:"shared.nuqidiand"}, {type:"Image", link:"shared.nuqidiancb"}, {type:"Image", link:"shared.nuqidianc"}, {type:"Image", link:"shared.nuqidiangc"}, {type:"Image", link:"shared.nuqidiang"}, {type:"Image", link:"shared.nuqidiankb"}, {type:"Image", link:"shared.nuqidiank"}, {type:"Image", link:"shared.nu"}, {type:"Image", link:"shared.dishang"}, {type:"Image", link:"shared.xuetiao"}, {type:"Image", link:"shared.xuetiao1"}, {type:"Image", link:"shared.mofa"}, {type:"Image", link:"shared.mpfa1"}, {type:"Image", link:"shared.di"}];
	}
}