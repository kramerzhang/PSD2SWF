package game.skin
{
	import MainMenuPanel.di;di;
	import MainMenuPanel.mpfa1;mpfa1;
	import MainMenuPanel.mofa;mofa;
	import MainMenuPanel.xuetiao1;xuetiao1;
	import MainMenuPanel.xuetiao;xuetiao;
	import MainMenuPanel.dishang;dishang;
	import MainMenuPanel.nu;nu;
	import MainMenuPanel.nuqidiank;nuqidiank;
	import MainMenuPanel.nuqidiankb;nuqidiankb;
	import MainMenuPanel.nuqidiang;nuqidiang;
	import MainMenuPanel.nuqidiangc;nuqidiangc;
	import MainMenuPanel.nuqidianc;nuqidianc;
	import MainMenuPanel.nuqidiancb;nuqidiancb;
	import MainMenuPanel.nuqidiand;nuqidiand;
	import MainMenuPanel.nuqidiandc;nuqidiandc;
	import MainMenuPanel.nuqidianh;nuqidianh;
	import MainMenuPanel.nuqidianhc;nuqidianhc;
	import MainMenuPanel.nuqidianl;nuqidianl;
	import MainMenuPanel.nuqidianlc;nuqidianlc;
	import MainMenuPanel.jingyantiao;jingyantiao;
	import MainMenuPanel.gege;gege;
	import MainMenuPanel.gezif;gezif;
	import MainMenuPanel.gezioo;gezioo;
	import MainMenuPanel.gezisrg;gezisrg;
	import MainMenuPanel.gezisgerh;gezisgerh;
	import MainMenuPanel.geziswefw3e;geziswefw3e;
	import MainMenuPanel.geziswe;geziswe;
	import MainMenuPanel.gezisergwe;gezisergwe;
	import MainMenuPanel.geziawa;geziawa;
	import MainMenuPanel.gezisad;gezisad;
	import MainMenuPanel.kuang1;kuang1;
	import MainMenuPanel.shagnchegn;shagnchegn;
	import MainMenuPanel.shangchengb;shangchengb;
	import MainMenuPanel.shangchengc;shangchengc;
	import MainMenuPanel.zhizuo;zhizuo;
	import MainMenuPanel.zhizuo1;zhizuo1;
	import MainMenuPanel.zhizuo2;zhizuo2;
	import MainMenuPanel.zhizuo3;zhizuo3;
	import MainMenuPanel.richang;richang;
	import MainMenuPanel.richagnb;richagnb;
	import MainMenuPanel.richagnc;richagnc;
	import MainMenuPanel.huoban;huoban;
	import MainMenuPanel.huoban1;huoban1;
	import MainMenuPanel.huoban2;huoban2;
	import MainMenuPanel.huoban3;huoban3;
	import MainMenuPanel.shenhun;shenhun;
	import MainMenuPanel.shenhunb;shenhunb;
	import MainMenuPanel.shenhunc;shenhunc;
	import MainMenuPanel.jineng;jineng;
	import MainMenuPanel.jinengb;jinengb;
	import MainMenuPanel.jinengc;jinengc;
	import MainMenuPanel.beibao;beibao;
	import MainMenuPanel.beibaob;beibaob;
	import MainMenuPanel.beibaoc;beibaoc;
	import MainMenuPanel.juese;juese;
	import MainMenuPanel.jueseb;jueseb;
	import MainMenuPanel.juesec;juesec;
	import MainMenuPanel.jialan;jialan;
	import MainMenuPanel.jialanb;jialanb;
	import MainMenuPanel.jialanc;jialanc;
	import MainMenuPanel.jiaxie;jiaxie;
	import MainMenuPanel.jiaxieb;jiaxieb;
	import MainMenuPanel.jiaxiec;jiaxiec;
	import MainMenuPanel.youbiao;youbiao;
	import MainMenuPanel.dazuo;dazuo;
	import MainMenuPanel.dazuob;dazuob;
	import MainMenuPanel.dazuoc;dazuoc;
	import MainMenuPanel.bangpai;bangpai;
	import MainMenuPanel.bangpai1;bangpai1;
	import MainMenuPanel.bangpai2;bangpai2;
	import MainMenuPanel.bangpai3;bangpai3;
	import MainMenuPanel.guaji;guaji;
	import MainMenuPanel.guaji1;guaji1;
	import MainMenuPanel.guaji2;guaji2;
	import MainMenuPanel.guaji3;guaji3;
	import MainMenuPanel.kaishi;kaishi;
	import MainMenuPanel.kaishi1;kaishi1;
	import MainMenuPanel.kaishi2;kaishi2;
	import MainMenuPanel.kaishi3;kaishi3;
	import MainMenuPanel.chfbang;chfbang;
	import MainMenuPanel.baoshib;baoshib;
	import MainMenuPanel.baoshic;baoshic;
	import MainMenuPanel.lianqi;lianqi;
	import MainMenuPanel.lianqix;lianqix;
	import MainMenuPanel.lianqiz;lianqiz;

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
			{name:"MainMenuPanel",type:"Container",x:0,y:0,width:898,height:128,
				children:
				[
					{name:"lianqi",type:"Button",x:530,y:24,width:34,height:42,
						children:
						[
							{name:"Image",type:"Image",x:0,y:0,width:34,height:42,
								normal:{link:"MainMenuPanel.lianqi",x:0,y:0,width:34,height:41},
								over:{link:"MainMenuPanel.lianqix",x:0,y:0,width:34,height:41},
								down:{link:"MainMenuPanel.lianqiz",x:0,y:0,width:34,height:42}
							}
						]
					},
					{name:"baoshi",type:"Button",x:568,y:24,width:34,height:42,
						children:
						[
							{name:"Image",type:"Image",x:0,y:0,width:34,height:42,
								normal:{link:"MainMenuPanel.chfbang",x:0,y:0,width:34,height:41},
								over:{link:"MainMenuPanel.baoshib",x:0,y:0,width:34,height:41},
								down:{link:"MainMenuPanel.baoshic",x:0,y:0,width:34,height:42}
							}
						]
					},
					{name:"guaji",type:"Button",x:645,y:24,width:34,height:41,
						children:
						[
							{name:"Image",type:"Image",x:0,y:0,width:34,height:41,
								normal:{link:"MainMenuPanel.kaishi",x:0,y:0,width:34,height:41},
								over:{link:"MainMenuPanel.kaishi1",x:0,y:0,width:34,height:41},
								down:{link:"MainMenuPanel.kaishi2",x:0,y:0,width:34,height:41},
								disable:{link:"MainMenuPanel.kaishi3",x:0,y:0,width:34,height:41}
							}
						]
					},
					{name:"zhanting",type:"Button",x:645,y:24,width:34,height:41,
						children:
						[
							{name:"Image",type:"Image",x:0,y:0,width:34,height:41,
								normal:{link:"MainMenuPanel.guaji",x:0,y:0,width:34,height:41},
								over:{link:"MainMenuPanel.guaji1",x:0,y:0,width:34,height:41},
								down:{link:"MainMenuPanel.guaji2",x:0,y:0,width:34,height:41},
								disable:{link:"MainMenuPanel.guaji3",x:0,y:0,width:34,height:41}
							}
						]
					},
					{name:"banghui",type:"Button",x:717,y:70,width:37,height:46,
						children:
						[
							{name:"Image",type:"Image",x:0,y:0,width:37,height:46,
								normal:{link:"MainMenuPanel.bangpai",x:0,y:0,width:37,height:45},
								over:{link:"MainMenuPanel.bangpai1",x:0,y:0,width:37,height:45},
								down:{link:"MainMenuPanel.bangpai2",x:0,y:0,width:37,height:46},
								disable:{link:"MainMenuPanel.bangpai3",x:0,y:0,width:37,height:45}
							}
						]
					},
					{name:"dazuo",type:"Button",x:606,y:24,width:34,height:41,
						children:
						[
							{name:"Image",type:"Image",x:0,y:0,width:34,height:41,
								normal:{link:"MainMenuPanel.dazuo",x:0,y:0,width:34,height:40},
								over:{link:"MainMenuPanel.dazuob",x:0,y:0,width:34,height:40},
								down:{link:"MainMenuPanel.dazuoc",x:0,y:0,width:34,height:41}
							}
						]
					},
					{name:"youbiao",type:"Button",x:446,y:10,width:9,height:25,
						children:
						[
							{name:"Image",type:"Image",x:0,y:0,width:9,height:25,
								normal:{link:"MainMenuPanel.youbiao",x:0,y:0,width:9,height:25}
							}
						]
					},
					{name:"youbiaob",type:"Button",x:446,y:10,width:9,height:25,
						children:
						[
							{name:"Image",type:"Image",x:0,y:0,width:9,height:25,
								normal:{link:"MainMenuPanel.youbiao",x:0,y:0,width:9,height:25}
							}
						]
					},
					{name:"jian",type:"Button",x:408,y:92,width:24,height:24,
						children:
						[
							{name:"Image",type:"Image",x:0,y:0,width:24,height:24,
								normal:{link:"MainMenuPanel.jiaxie",x:0,y:0,width:24,height:24},
								over:{link:"MainMenuPanel.jiaxieb",x:0,y:0,width:24,height:24},
								down:{link:"MainMenuPanel.jiaxiec",x:0,y:0,width:24,height:24}
							}
						]
					},
					{name:"jia",type:"Button",x:472,y:92,width:24,height:24,
						children:
						[
							{name:"Image",type:"Image",x:0,y:0,width:24,height:24,
								normal:{link:"MainMenuPanel.jialan",x:0,y:0,width:24,height:24},
								over:{link:"MainMenuPanel.jialanb",x:0,y:0,width:24,height:24},
								down:{link:"MainMenuPanel.jialanc",x:0,y:0,width:24,height:24}
							}
						]
					},
					{name:"jiaose",type:"Button",x:527,y:70,width:37,height:46,
						children:
						[
							{name:"Image",type:"Image",x:0,y:0,width:37,height:46,
								normal:{link:"MainMenuPanel.juese",x:0,y:0,width:37,height:45},
								over:{link:"MainMenuPanel.jueseb",x:0,y:0,width:37,height:45},
								down:{link:"MainMenuPanel.juesec",x:0,y:0,width:37,height:46}
							}
						]
					},
					{name:"beibao",type:"Button",x:565,y:70,width:37,height:46,
						children:
						[
							{name:"Image",type:"Image",x:0,y:0,width:37,height:46,
								normal:{link:"MainMenuPanel.beibao",x:0,y:0,width:37,height:45},
								over:{link:"MainMenuPanel.beibaob",x:0,y:0,width:37,height:45},
								down:{link:"MainMenuPanel.beibaoc",x:0,y:0,width:37,height:46}
							}
						]
					},
					{name:"jineng",type:"Button",x:603,y:70,width:37,height:46,
						children:
						[
							{name:"Image",type:"Image",x:0,y:0,width:37,height:46,
								normal:{link:"MainMenuPanel.jineng",x:0,y:0,width:37,height:45},
								over:{link:"MainMenuPanel.jinengb",x:0,y:0,width:37,height:45},
								down:{link:"MainMenuPanel.jinengc",x:0,y:0,width:37,height:46}
							}
						]
					},
					{name:"shenhun",type:"Button",x:641,y:70,width:37,height:46,
						children:
						[
							{name:"Image",type:"Image",x:0,y:0,width:37,height:46,
								normal:{link:"MainMenuPanel.shenhun",x:0,y:0,width:37,height:45},
								over:{link:"MainMenuPanel.shenhunb",x:0,y:0,width:37,height:45},
								down:{link:"MainMenuPanel.shenhunc",x:0,y:0,width:37,height:46}
							}
						]
					},
					{name:"wujiang",type:"Button",x:679,y:70,width:37,height:45,
						children:
						[
							{name:"Image",type:"Image",x:0,y:0,width:37,height:45,
								normal:{link:"MainMenuPanel.huoban",x:0,y:0,width:37,height:45},
								over:{link:"MainMenuPanel.huoban1",x:0,y:0,width:37,height:45},
								down:{link:"MainMenuPanel.huoban2",x:0,y:0,width:37,height:45},
								disable:{link:"MainMenuPanel.huoban3",x:0,y:0,width:37,height:45}
							}
						]
					},
					{name:"haoyou",type:"Button",x:755,y:70,width:37,height:46,
						children:
						[
							{name:"Image",type:"Image",x:0,y:0,width:37,height:46,
								normal:{link:"MainMenuPanel.richang",x:0,y:0,width:37,height:45},
								over:{link:"MainMenuPanel.richagnb",x:0,y:0,width:37,height:45},
								down:{link:"MainMenuPanel.richagnc",x:0,y:0,width:37,height:46}
							}
						]
					},
					{name:"zhizuo",type:"Button",x:793,y:70,width:37,height:45,
						children:
						[
							{name:"Image",type:"Image",x:0,y:0,width:37,height:45,
								normal:{link:"MainMenuPanel.zhizuo",x:0,y:0,width:37,height:45},
								over:{link:"MainMenuPanel.zhizuo1",x:0,y:0,width:37,height:45},
								down:{link:"MainMenuPanel.zhizuo2",x:0,y:0,width:37,height:45},
								disable:{link:"MainMenuPanel.zhizuo3",x:0,y:0,width:37,height:45}
							}
						]
					},
					{name:"shangcheng",type:"Button",x:831,y:70,width:37,height:46,
						children:
						[
							{name:"Image",type:"Image",x:0,y:0,width:37,height:46,
								normal:{link:"MainMenuPanel.shagnchegn",x:0,y:0,width:37,height:45},
								over:{link:"MainMenuPanel.shangchengb",x:0,y:0,width:37,height:45},
								down:{link:"MainMenuPanel.shangchengc",x:0,y:0,width:37,height:46}
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
								normal:{link:"MainMenuPanel.kuang1",x:0,y:0,width:343,height:42}
							}
						]
					},
					{name:"gezisad",type:"Image",x:831,y:70,width:37,height:43,
						normal:{link:"MainMenuPanel.gezisad",x:0,y:0,width:37,height:43}
					},
					{name:"geziawa",type:"Image",x:793,y:70,width:37,height:43,
						normal:{link:"MainMenuPanel.geziawa",x:0,y:0,width:37,height:43}
					},
					{name:"gezisergwe",type:"Image",x:755,y:70,width:37,height:43,
						normal:{link:"MainMenuPanel.gezisergwe",x:0,y:0,width:37,height:43}
					},
					{name:"geziswe",type:"Image",x:717,y:70,width:37,height:43,
						normal:{link:"MainMenuPanel.geziswe",x:0,y:0,width:37,height:43}
					},
					{name:"geziswefw3e",type:"Image",x:679,y:70,width:37,height:43,
						normal:{link:"MainMenuPanel.geziswefw3e",x:0,y:0,width:37,height:43}
					},
					{name:"gezisgerh",type:"Image",x:641,y:70,width:37,height:43,
						normal:{link:"MainMenuPanel.gezisgerh",x:0,y:0,width:37,height:43}
					},
					{name:"gezisrg",type:"Image",x:565,y:70,width:37,height:43,
						normal:{link:"MainMenuPanel.gezisrg",x:0,y:0,width:37,height:43}
					},
					{name:"gezioo",type:"Image",x:527,y:70,width:37,height:43,
						normal:{link:"MainMenuPanel.gezioo",x:0,y:0,width:37,height:43}
					},
					{name:"gezif",type:"Image",x:603,y:70,width:37,height:43,
						normal:{link:"MainMenuPanel.gezif",x:0,y:0,width:37,height:43}
					},
					{name:"gege",type:"Image",x:71,y:114,width:760,height:13,
						normal:{link:"MainMenuPanel.gege",x:0,y:0,width:760,height:13}
					},
					{name:"jingyantiao",type:"Image",x:26,y:118,width:848,height:6,
						normal:{link:"MainMenuPanel.jingyantiao",x:0,y:0,width:848,height:6}
					},
					{name:"circle0",type:"Container",x:424,y:73,width:9,height:9,
						children:
						[
							{name:"nuqidianlc",type:"Image",x:0,y:3,width:9,height:6,
								normal:{link:"MainMenuPanel.nuqidianlc",x:0,y:0,width:9,height:6}
							},
							{name:"nuqidianl",type:"Image",x:0,y:0,width:9,height:9,
								normal:{link:"MainMenuPanel.nuqidianl",x:0,y:0,width:9,height:9}
							}
						]
					},
					{name:"circle1",type:"Container",x:427,y:57,width:9,height:9,
						children:
						[
							{name:"nuqidianhc",type:"Image",x:0,y:2,width:9,height:7,
								normal:{link:"MainMenuPanel.nuqidianhc",x:0,y:0,width:9,height:7}
							},
							{name:"nuqidianh",type:"Image",x:0,y:0,width:9,height:9,
								normal:{link:"MainMenuPanel.nuqidianh",x:0,y:0,width:9,height:9}
							}
						]
					},
					{name:"circle2",type:"Container",x:440,y:47,width:9,height:9,
						children:
						[
							{name:"nuqidiandc",type:"Image",x:0,y:0,width:6,height:9,
								normal:{link:"MainMenuPanel.nuqidiandc",x:0,y:0,width:6,height:9}
							},
							{name:"nuqidiand",type:"Image",x:0,y:0,width:9,height:9,
								normal:{link:"MainMenuPanel.nuqidiand",x:0,y:0,width:9,height:9}
							}
						]
					},
					{name:"circle3",type:"Container",x:455,y:47,width:9,height:9,
						children:
						[
							{name:"nuqidiancb",type:"Image",x:0,y:0,width:7,height:9,
								normal:{link:"MainMenuPanel.nuqidiancb",x:0,y:0,width:7,height:9}
							},
							{name:"nuqidianc",type:"Image",x:0,y:0,width:9,height:9,
								normal:{link:"MainMenuPanel.nuqidianc",x:0,y:0,width:9,height:9}
							}
						]
					},
					{name:"circle4",type:"Container",x:469,y:57,width:9,height:9,
						children:
						[
							{name:"nuqidiangc",type:"Image",x:0,y:0,width:9,height:7,
								normal:{link:"MainMenuPanel.nuqidiangc",x:0,y:0,width:9,height:7}
							},
							{name:"nuqidiang",type:"Image",x:0,y:0,width:9,height:9,
								normal:{link:"MainMenuPanel.nuqidiang",x:0,y:0,width:9,height:9}
							}
						]
					},
					{name:"circle5",type:"Container",x:472,y:73,width:9,height:9,
						children:
						[
							{name:"nuqidiankb",type:"Image",x:0,y:0,width:9,height:6,
								normal:{link:"MainMenuPanel.nuqidiankb",x:0,y:0,width:9,height:6}
							},
							{name:"nuqidiank",type:"Image",x:0,y:0,width:9,height:9,
								normal:{link:"MainMenuPanel.nuqidiank",x:0,y:0,width:9,height:9}
							}
						]
					},
					{name:"nu",type:"Image",x:420,y:43,width:65,height:53,
						normal:{link:"MainMenuPanel.nu",x:0,y:0,width:65,height:53}
					},
					{name:"dishang",type:"Image",x:24,y:0,width:853,height:128,
						normal:{link:"MainMenuPanel.dishang",x:0,y:0,width:853,height:128}
					},
					{name:"hp",type:"Container",x:388,y:10,width:62,height:118,
						children:
						[
							{name:"xuetiao",type:"Image",x:0,y:0,width:62,height:118,
								normal:{link:"MainMenuPanel.xuetiao",x:0,y:0,width:62,height:118}
							}
						]
					},
					{name:"xuetiao1",type:"Image",x:388,y:10,width:62,height:118,
						normal:{link:"MainMenuPanel.xuetiao1",x:0,y:0,width:62,height:118}
					},
					{name:"mp",type:"Container",x:450,y:10,width:63,height:118,
						children:
						[
							{name:"mofa",type:"Image",x:0,y:0,width:63,height:118,
								normal:{link:"MainMenuPanel.mofa",x:0,y:0,width:63,height:118}
							}
						]
					},
					{name:"mpfa1",type:"Image",x:450,y:10,width:63,height:118,
						normal:{link:"MainMenuPanel.mpfa1",x:0,y:0,width:63,height:118}
					},
					{name:"di",type:"Image",x:0,y:9,width:898,height:119,
						normal:{link:"MainMenuPanel.di",x:0,y:0,width:898,height:119}
					}
				]
			};
		public static var resource:Array=[{type:"Image", link:"MainMenuPanel.lianqi"}, {type:"Image", link:"MainMenuPanel.lianqix"}, {type:"Image", link:"MainMenuPanel.lianqiz"}, {type:"Image", link:"MainMenuPanel.chfbang"}, {type:"Image", link:"MainMenuPanel.baoshib"}, {type:"Image", link:"MainMenuPanel.baoshic"}, {type:"Image", link:"MainMenuPanel.kaishi"}, {type:"Image", link:"MainMenuPanel.kaishi1"}, {type:"Image", link:"MainMenuPanel.kaishi2"}, {type:"Image", link:"MainMenuPanel.kaishi3"}, {type:"Image", link:"MainMenuPanel.guaji"}, {type:"Image", link:"MainMenuPanel.guaji1"}, {type:"Image", link:"MainMenuPanel.guaji2"}, {type:"Image", link:"MainMenuPanel.guaji3"}, {type:"Image", link:"MainMenuPanel.bangpai"}, {type:"Image", link:"MainMenuPanel.bangpai1"}, {type:"Image", link:"MainMenuPanel.bangpai2"}, {type:"Image", link:"MainMenuPanel.bangpai3"}, {type:"Image", link:"MainMenuPanel.dazuo"}, {type:"Image", link:"MainMenuPanel.dazuob"}, {type:"Image", link:"MainMenuPanel.dazuoc"}, {type:"Image", link:"MainMenuPanel.youbiao"}, {type:"Image", link:"MainMenuPanel.youbiao"}, {type:"Image", link:"MainMenuPanel.jiaxie"}, {type:"Image", link:"MainMenuPanel.jiaxieb"}, {type:"Image", link:"MainMenuPanel.jiaxiec"}, {type:"Image", link:"MainMenuPanel.jialan"}, {type:"Image", link:"MainMenuPanel.jialanb"}, {type:"Image", link:"MainMenuPanel.jialanc"}, {type:"Image", link:"MainMenuPanel.juese"}, {type:"Image", link:"MainMenuPanel.jueseb"}, {type:"Image", link:"MainMenuPanel.juesec"}, {type:"Image", link:"MainMenuPanel.beibao"}, {type:"Image", link:"MainMenuPanel.beibaob"}, {type:"Image", link:"MainMenuPanel.beibaoc"}, {type:"Image", link:"MainMenuPanel.jineng"}, {type:"Image", link:"MainMenuPanel.jinengb"}, {type:"Image", link:"MainMenuPanel.jinengc"}, {type:"Image", link:"MainMenuPanel.shenhun"}, {type:"Image", link:"MainMenuPanel.shenhunb"}, {type:"Image", link:"MainMenuPanel.shenhunc"}, {type:"Image", link:"MainMenuPanel.huoban"}, {type:"Image", link:"MainMenuPanel.huoban1"}, {type:"Image", link:"MainMenuPanel.huoban2"}, {type:"Image", link:"MainMenuPanel.huoban3"}, {type:"Image", link:"MainMenuPanel.richang"}, {type:"Image", link:"MainMenuPanel.richagnb"}, {type:"Image", link:"MainMenuPanel.richagnc"}, {type:"Image", link:"MainMenuPanel.zhizuo"}, {type:"Image", link:"MainMenuPanel.zhizuo1"}, {type:"Image", link:"MainMenuPanel.zhizuo2"}, {type:"Image", link:"MainMenuPanel.zhizuo3"}, {type:"Image", link:"MainMenuPanel.shagnchegn"}, {type:"Image", link:"MainMenuPanel.shangchengb"}, {type:"Image", link:"MainMenuPanel.shangchengc"}, {type:"Image", link:"MainMenuPanel.kuang1"}, {type:"Image", link:"MainMenuPanel.gezisad"}, {type:"Image", link:"MainMenuPanel.geziawa"}, {type:"Image", link:"MainMenuPanel.gezisergwe"}, {type:"Image", link:"MainMenuPanel.geziswe"}, {type:"Image", link:"MainMenuPanel.geziswefw3e"}, {type:"Image", link:"MainMenuPanel.gezisgerh"}, {type:"Image", link:"MainMenuPanel.gezisrg"}, {type:"Image", link:"MainMenuPanel.gezioo"}, {type:"Image", link:"MainMenuPanel.gezif"}, {type:"Image", link:"MainMenuPanel.gege"}, {type:"Image", link:"MainMenuPanel.jingyantiao"}, {type:"Image", link:"MainMenuPanel.nuqidianlc"}, {type:"Image", link:"MainMenuPanel.nuqidianl"}, {type:"Image", link:"MainMenuPanel.nuqidianhc"}, {type:"Image", link:"MainMenuPanel.nuqidianh"}, {type:"Image", link:"MainMenuPanel.nuqidiandc"}, {type:"Image", link:"MainMenuPanel.nuqidiand"}, {type:"Image", link:"MainMenuPanel.nuqidiancb"}, {type:"Image", link:"MainMenuPanel.nuqidianc"}, {type:"Image", link:"MainMenuPanel.nuqidiangc"}, {type:"Image", link:"MainMenuPanel.nuqidiang"}, {type:"Image", link:"MainMenuPanel.nuqidiankb"}, {type:"Image", link:"MainMenuPanel.nuqidiank"}, {type:"Image", link:"MainMenuPanel.nu"}, {type:"Image", link:"MainMenuPanel.dishang"}, {type:"Image", link:"MainMenuPanel.xuetiao"}, {type:"Image", link:"MainMenuPanel.xuetiao1"}, {type:"Image", link:"MainMenuPanel.mofa"}, {type:"Image", link:"MainMenuPanel.mpfa1"}, {type:"Image", link:"MainMenuPanel.di"}];
	}
}