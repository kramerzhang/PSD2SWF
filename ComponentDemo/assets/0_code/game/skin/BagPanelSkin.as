package game.skin
{
	import BagPanel.beibaotxtbiaoti;beibaotxtbiaoti;
	import BagPanel.biaoti;biaoti;
	import BagPanel.huawen1;huawen1;
	import BagPanel.huawen2;huawen2;
	import BagPanel.dibanmoji;dibanmoji;
	import BagPanel.diban;diban;
	import BagPanel.neidiban;neidiban;
	import BagPanel.xuanguakuang;xuanguakuang;
	import BagPanel.anniu4;anniu4;
	import BagPanel.anniu3;anniu3;
	import BagPanel.anniu2;anniu2;
	import BagPanel.anniu1;anniu1;
	import BagPanel.biaoqian4;biaoqian4;
	import BagPanel.biaoqian3;biaoqian3;
	import BagPanel.biaoqian2;biaoqian2;
	import BagPanel.biaoqian1;biaoqian1;
	import BagPanel.redanniu3;redanniu3;
	import BagPanel.shurukuang;shurukuang;
	import BagPanel.close3;close3;
	import BagPanel.close2;close2;
	import BagPanel.close1;close1;

	/*
	BagPanel:Container
		close:Button
		dragBar:DragBar
		txtCopperBind:Label
		txtBindMoney:Label
		txtCopper:Label
		txtMoney:Label
		绑定铜币:Label
		绑定元宝:Label
		铜币:Label
		元宝:Label
		shurukuang3:ScaleImage
		shurukuang1:ScaleImage
		shurukuang2:ScaleImage
		shurukuang0:ScaleImage
		txtBeibaorongliangshuzi:Label
		背包容量:Label
		VIPguaji:Button
		ptgj:Button
		divide:Button
		sale:Button
		sort:Button
		pageList:RadioButtonGroup
		tabs:RadioButtonGroup
		beibaotxtbiaoti:Image
		biaoti:Image
		huawen1:Image
		huawen2:Image
		myvipanniuContainer:Container
			yaunchengck:Button
			yuancgy:Button
			huicheng:Button
			vip:Button
			xuanguakuang:Image
		neidiban:Container
			mynormal:Container
				neidiban:Image
		diban:ScaleImage
		底板墨迹:ScaleImage
	*/
	public class BagPanelSkin
	{
		public static var skin:Object=
			{name:"BagPanel",type:"Container",x:0,y:0,width:361,height:457,
				children:
				[
					{name:"close",type:"Button",x:252,y:15,width:29,height:28,
						children:
						[
							{name:"myImage",type:"Image",x:0,y:0,width:29,height:28,
								normal:{link:"BagPanel.close1",x:0,y:0,width:29,height:28},
								over:{link:"BagPanel.close2",x:0,y:0,width:29,height:28},
								down:{link:"BagPanel.close3",x:0,y:0,width:29,height:28}
							}
						]
					},
					{name:"dragBar",type:"DragBar",x:0,y:0,width:295,height:45},
					{name:"txtCopperBind",type:"Label",x:198,y:405,width:67,height:18,
						normal:{x:0,y:0,width:69,height:17,content:"<font color='#ffffff'>999999000</font>",format:{align:"left",bold:false,color:0xffffff,font:"SimSun",italic:false,leading:5.499999999999999,letterSpacing:0.8,size:12,underline:false}}
					},
					{name:"txtBindMoney",type:"Label",x:198,y:382,width:69,height:17,
						normal:{x:0,y:0,width:69,height:17,content:"<font color='#ffffff'>999999000</font>",format:{align:"left",bold:false,color:0xffffff,font:"SimSun",italic:false,leading:5.499999999999999,letterSpacing:0.8,size:12,underline:false}}
					},
					{name:"txtCopper",type:"Label",x:60,y:405,width:69,height:17,
						normal:{x:0,y:0,width:69,height:17,content:"<font color='#ffffff'>999999000</font>",format:{align:"left",bold:false,color:0xffffff,font:"SimSun",italic:false,leading:5.499999999999999,letterSpacing:0.8,size:12,underline:false}}
					},
					{name:"txtMoney",type:"Label",x:60,y:382,width:69,height:17,
						normal:{x:0,y:0,width:69,height:17,content:"<font color='#ffffff'>999999000</font>",format:{align:"left",bold:false,color:0xffffff,font:"SimSun",italic:false,leading:5.499999999999999,letterSpacing:0.8,size:12,underline:false}}
					},
					{name:"绑定铜币",type:"Label",x:137,y:404,width:57,height:17,
						normal:{x:0,y:0,width:57,height:17,content:"<font color='#ac8123'>绑定铜币</font>",format:{align:"left",bold:false,color:0xac8123,font:"SimSun",italic:false,leading:5.499999999999999,letterSpacing:0.6,size:12,underline:false}}
					},
					{name:"绑定元宝",type:"Label",x:137,y:381,width:57,height:17,
						normal:{x:0,y:0,width:57,height:17,content:"<font color='#ac8123'>绑定元宝</font>",format:{align:"left",bold:false,color:0xac8123,font:"SimSun",italic:false,leading:5.499999999999999,letterSpacing:0.6,size:12,underline:false}}
					},
					{name:"铜币",type:"Label",x:24,y:404,width:31,height:17,
						normal:{x:0,y:0,width:31,height:17,content:"<font color='#ac8123'>铜币</font>",format:{align:"left",bold:false,color:0xac8123,font:"SimSun",italic:false,leading:5.499999999999999,letterSpacing:0.6,size:12,underline:false}}
					},
					{name:"元宝",type:"Label",x:24,y:382,width:31,height:17,
						normal:{x:0,y:0,width:31,height:17,content:"<font color='#ac8123'>元宝</font>",format:{align:"left",bold:false,color:0xac8123,font:"SimSun",italic:false,leading:5.499999999999999,letterSpacing:0.6,size:12,underline:false}}
					},
					{name:"shurukuang3",type:"ScaleImage",x:190,y:403,width:81,height:20,top:4,right:4,bottom:4,left:4,
						normal:{link:"BagPanel.shurukuang",x:0,y:0,width:81,height:20}
					},
					{name:"shurukuang1",type:"ScaleImage",x:52,y:403,width:81,height:20,top:4,right:4,bottom:4,left:4,
						normal:{link:"BagPanel.shurukuang",x:0,y:0,width:81,height:20}
					},
					{name:"shurukuang2",type:"ScaleImage",x:190,y:380,width:81,height:20,top:4,right:4,bottom:4,left:4,
						normal:{link:"BagPanel.shurukuang",x:0,y:0,width:81,height:20}
					},
					{name:"shurukuang0",type:"ScaleImage",x:52,y:380,width:81,height:20,top:4,right:4,bottom:4,left:4,
						normal:{link:"BagPanel.shurukuang",x:0,y:0,width:81,height:20}
					},
					{name:"txtBeibaorongliangshuzi",type:"Label",x:225,y:329,width:55,height:17,
						normal:{x:0,y:0,width:55,height:17,content:"<font color='#ffffff'>000/000</font>",format:{align:"left",bold:false,color:0xffffff,font:"SimSun",italic:false,leading:9,letterSpacing:0.6,size:12,underline:false}}
					},
					{name:"背包容量",type:"Label",x:194,y:328,width:45,height:17,
						normal:{x:0,y:0,width:45,height:17,content:"<font color='#ac8123'>容量：</font>",format:{align:"left",bold:false,color:0xac8123,font:"SimSun",italic:false,leading:5.499999999999999,letterSpacing:0.6,size:12,underline:false}}
					},
					{name:"VIPguaji",type:"Button",x:212,y:353,width:60,height:22,
						children:
						[
							{name:"VIP会员",type:"Label",x:7,y:3,width:46,height:17,
								normal:{x:0,y:0,width:46,height:17,content:"<font color='#ffffff'>VIP会员</font>",format:{align:"left",bold:false,color:0xffffff,font:"SimSun",italic:false,leading:0,letterSpacing:0,size:12,underline:false}}
							},
							{name:"myScaleImage",type:"ScaleImage",x:0,y:0,width:60,height:22,top:4,right:4,bottom:4,left:4,
								normal:{link:"BagPanel.anniu1",x:0,y:0,width:60,height:22},
								over:{link:"BagPanel.anniu2",x:0,y:0,width:60,height:22},
								down:{link:"BagPanel.anniu3",x:0,y:0,width:60,height:22},
								disable:{link:"BagPanel.anniu4",x:0,y:0,width:60,height:22}
							}
						]
					},
					{name:"ptgj",type:"Button",x:212,y:353,width:60,height:22,
						children:
						[
							{name:"普通挂机",type:"Label",x:4,y:3,width:52,height:17,
								normal:{x:0,y:0,width:52,height:17,content:"<font color='#ffffff'>普通挂机</font>",format:{align:"left",bold:false,color:0xffffff,font:"SimSun",italic:false,leading:0,letterSpacing:0,size:12,underline:false}}
							},
							{name:"myScaleImage",type:"ScaleImage",x:0,y:0,width:60,height:22,top:4,right:4,bottom:4,left:4,
								normal:{link:"BagPanel.anniu1",x:0,y:0,width:60,height:22},
								over:{link:"BagPanel.anniu2",x:0,y:0,width:60,height:22},
								down:{link:"BagPanel.anniu3",x:0,y:0,width:60,height:22},
								disable:{link:"BagPanel.anniu4",x:0,y:0,width:60,height:22}
							}
						]
					},
					{name:"divide",type:"Button",x:149,y:353,width:60,height:22,
						children:
						[
							{name:"拆分",type:"Label",x:13,y:3,width:40,height:17,
								normal:{x:0,y:0,width:40,height:17,content:"<font color='#ffffff'>拆  分</font>",format:{align:"left",bold:false,color:0xffffff,font:"SimSun",italic:false,leading:0,letterSpacing:0,size:12,underline:false}}
							},
							{name:"myScaleImage",type:"ScaleImage",x:0,y:0,width:60,height:22,top:4,right:4,bottom:4,left:4,
								normal:{link:"BagPanel.anniu1",x:0,y:0,width:60,height:22},
								over:{link:"BagPanel.anniu2",x:0,y:0,width:60,height:22},
								down:{link:"BagPanel.anniu3",x:0,y:0,width:60,height:22},
								disable:{link:"BagPanel.anniu4",x:0,y:0,width:60,height:22}
							}
						]
					},
					{name:"sale",type:"Button",x:87,y:353,width:60,height:22,
						children:
						[
							{name:"txtSell",type:"Label",x:13,y:3,width:40,height:17,
								normal:{x:0,y:0,width:40,height:17,content:"<font color='#ffffff'>出  售</font>",format:{align:"left",bold:false,color:0xffffff,font:"SimSun",italic:false,leading:0,letterSpacing:0,size:12,underline:false}}
							},
							{name:"myScaleImage",type:"ScaleImage",x:0,y:0,width:60,height:22,top:4,right:4,bottom:4,left:4,
								normal:{link:"BagPanel.anniu1",x:0,y:0,width:60,height:22},
								over:{link:"BagPanel.anniu2",x:0,y:0,width:60,height:22},
								down:{link:"BagPanel.anniu3",x:0,y:0,width:60,height:22},
								disable:{link:"BagPanel.anniu4",x:0,y:0,width:60,height:22}
							}
						]
					},
					{name:"sort",type:"Button",x:24,y:353,width:60,height:22,
						children:
						[
							{name:"txtSort",type:"Label",x:13,y:3,width:40,height:17,
								normal:{x:0,y:0,width:40,height:17,content:"<font color='#ffffff'>整  理</font>",format:{align:"left",bold:false,color:0xffffff,font:"SimSun",italic:false,leading:0,letterSpacing:0,size:12,underline:false}}
							},
							{name:"myScaleImage",type:"ScaleImage",x:0,y:0,width:60,height:22,top:4,right:4,bottom:4,left:4,
								normal:{link:"BagPanel.anniu1",x:0,y:0,width:60,height:22},
								over:{link:"BagPanel.anniu2",x:0,y:0,width:60,height:22},
								down:{link:"BagPanel.anniu3",x:0,y:0,width:60,height:22},
								disable:{link:"BagPanel.anniu4",x:0,y:0,width:60,height:22}
							}
						]
					},
					{name:"pageList",type:"RadioButtonGroup",x:29,y:325,width:164,height:22,
						children:
						[
							{name:"page5",type:"RadioButton",x:132,y:0,width:32,height:22,
								children:
								[
									{name:"txt5",type:"Label",x:11,y:3,width:10,height:17,
										normal:{x:0,y:0,width:10,height:17,content:"<font color='#ffffff'>5</font>",format:{align:"left",bold:false,color:0xffffff,font:"SimSun",italic:false,leading:0,letterSpacing:0,size:12,underline:false}}
									},
									{name:"myScaleImage",type:"ScaleImage",x:0,y:0,width:32,height:22,top:4,right:4,bottom:4,left:4,
										normal:{link:"BagPanel.anniu1",x:0,y:0,width:32,height:22},
										over:{link:"BagPanel.anniu2",x:0,y:0,width:32,height:22},
										down:{link:"BagPanel.redanniu3",x:0,y:0,width:32,height:22},
										disable:{link:"BagPanel.anniu4",x:0,y:0,width:32,height:22}
									}
								]
							},
							{name:"page4",type:"RadioButton",x:99,y:0,width:32,height:22,
								children:
								[
									{name:"txt4",type:"Label",x:11,y:3,width:10,height:17,
										normal:{x:0,y:0,width:10,height:17,content:"<font color='#ffffff'>4</font>",format:{align:"left",bold:false,color:0xffffff,font:"SimSun",italic:false,leading:0,letterSpacing:0,size:12,underline:false}}
									},
									{name:"myScaleImage",type:"ScaleImage",x:0,y:0,width:32,height:22,top:4,right:4,bottom:4,left:4,
										normal:{link:"BagPanel.anniu1",x:0,y:0,width:32,height:22},
										over:{link:"BagPanel.anniu2",x:0,y:0,width:32,height:22},
										down:{link:"BagPanel.anniu3",x:0,y:0,width:32,height:22},
										disable:{link:"BagPanel.anniu4",x:0,y:0,width:32,height:22}
									}
								]
							},
							{name:"page3",type:"RadioButton",x:66,y:0,width:32,height:22,
								children:
								[
									{name:"txt3",type:"Label",x:11,y:3,width:12,height:17,
										normal:{x:0,y:0,width:12,height:17,content:"<font color='#ffffff'>3</font>",format:{align:"left",bold:false,color:0xffffff,font:"SimSun",italic:false,leading:9,letterSpacing:0.6,size:12,underline:false}}
									},
									{name:"myScaleImage",type:"ScaleImage",x:0,y:0,width:32,height:22,top:4,right:4,bottom:4,left:4,
										normal:{link:"BagPanel.anniu1",x:0,y:0,width:32,height:22},
										over:{link:"BagPanel.anniu2",x:0,y:0,width:32,height:22},
										down:{link:"BagPanel.anniu3",x:0,y:0,width:32,height:22},
										disable:{link:"BagPanel.anniu4",x:0,y:0,width:32,height:22}
									}
								]
							},
							{name:"page2",type:"RadioButton",x:33,y:0,width:32,height:22,
								children:
								[
									{name:"txt2",type:"Label",x:11,y:3,width:12,height:17,
										normal:{x:0,y:0,width:12,height:17,content:"<font color='#ffffff'>2</font>",format:{align:"left",bold:false,color:0xffffff,font:"SimSun",italic:false,leading:5.499999999999999,letterSpacing:0.6,size:12,underline:false}}
									},
									{name:"myScaleImage",type:"ScaleImage",x:0,y:0,width:32,height:22,top:4,right:4,bottom:4,left:4,
										normal:{link:"BagPanel.anniu1",x:0,y:0,width:32,height:22},
										over:{link:"BagPanel.anniu2",x:0,y:0,width:32,height:22},
										down:{link:"BagPanel.anniu3",x:0,y:0,width:32,height:22},
										disable:{link:"BagPanel.anniu4",x:0,y:0,width:32,height:22}
									}
								]
							},
							{name:"page1",type:"RadioButton",x:0,y:0,width:32,height:22,
								children:
								[
									{name:"txt1",type:"Label",x:11,y:3,width:10,height:17,
										normal:{x:0,y:0,width:10,height:17,content:"<font color='#ffffff'>1</font>",format:{align:"left",bold:false,color:0xffffff,font:"SimSun",italic:false,leading:0,letterSpacing:0,size:12,underline:false}}
									},
									{name:"myScaleImage",type:"ScaleImage",x:0,y:0,width:32,height:22,top:4,right:4,bottom:4,left:4,
										normal:{link:"BagPanel.anniu1",x:0,y:0,width:32,height:22},
										over:{link:"BagPanel.anniu2",x:0,y:0,width:32,height:22},
										down:{link:"BagPanel.anniu3",x:0,y:0,width:32,height:22},
										disable:{link:"BagPanel.anniu4",x:0,y:0,width:32,height:22}
									}
								]
							}
						]
					},
					{name:"tabs",type:"RadioButtonGroup",x:27,y:52,width:243,height:22,
						children:
						[
							{name:"other",type:"RadioButton",x:192,y:0,width:51,height:22,
								children:
								[
									{name:"other",type:"Label",x:12,y:5,width:33,height:17,
										normal:{x:0,y:0,width:33,height:17,content:"<font color='#ffffff'>其他</font>",format:{align:"left",bold:false,color:0xffffff,font:"SimSun",italic:false,leading:0,letterSpacing:1.6,size:12,underline:false}}
									},
									{name:"myScaleImage",type:"ScaleImage",x:0,y:0,width:51,height:21,top:4,right:4,bottom:4,left:4,
										normal:{link:"BagPanel.biaoqian1",x:0,y:0,width:51,height:21},
										over:{link:"BagPanel.biaoqian2",x:0,y:0,width:51,height:21},
										down:{link:"BagPanel.biaoqian3",x:0,y:0,width:51,height:21},
										disable:{link:"BagPanel.biaoqian4",x:0,y:0,width:51,height:21}
									}
								]
							},
							{name:"gem",type:"RadioButton",x:144,y:0,width:51,height:22,
								children:
								[
									{name:"gem",type:"Label",x:12,y:5,width:31,height:17,
										normal:{x:0,y:0,width:31,height:17,content:"<font color='#ffffff'>宝石</font>",format:{align:"left",bold:false,color:0xffffff,font:"SimSun",italic:false,leading:5.499999999999999,letterSpacing:0.6,size:12,underline:false}}
									},
									{name:"myScaleImage",type:"ScaleImage",x:0,y:0,width:51,height:21,top:4,right:4,bottom:4,left:4,
										normal:{link:"BagPanel.biaoqian1",x:0,y:0,width:51,height:21},
										over:{link:"BagPanel.biaoqian2",x:0,y:0,width:51,height:21},
										down:{link:"BagPanel.biaoqian3",x:0,y:0,width:51,height:21},
										disable:{link:"BagPanel.biaoqian4",x:0,y:0,width:51,height:21}
									}
								]
							},
							{name:"drug",type:"RadioButton",x:96,y:0,width:51,height:22,
								children:
								[
									{name:"drug",type:"Label",x:13,y:5,width:31,height:17,
										normal:{x:0,y:0,width:31,height:17,content:"<font color='#ffffff'>药品</font>",format:{align:"left",bold:false,color:0xffffff,font:"SimSun",italic:false,leading:5.499999999999999,letterSpacing:0.8,size:12,underline:false}}
									},
									{name:"myScaleImage",type:"ScaleImage",x:0,y:0,width:51,height:21,top:4,right:4,bottom:4,left:4,
										normal:{link:"BagPanel.biaoqian1",x:0,y:0,width:51,height:21},
										over:{link:"BagPanel.biaoqian2",x:0,y:0,width:51,height:21},
										down:{link:"BagPanel.biaoqian3",x:0,y:0,width:51,height:21},
										disable:{link:"BagPanel.biaoqian4",x:0,y:0,width:51,height:21}
									}
								]
							},
							{name:"equip",type:"RadioButton",x:48,y:0,width:51,height:22,
								children:
								[
									{name:"equip",type:"Label",x:13,y:5,width:31,height:17,
										normal:{x:0,y:0,width:31,height:17,content:"<font color='#ffffff'>装备</font>",format:{align:"left",bold:false,color:0xffffff,font:"SimSun",italic:false,leading:5.499999999999999,letterSpacing:0.8,size:12,underline:false}}
									},
									{name:"myScaleImage",type:"ScaleImage",x:0,y:0,width:51,height:21,top:4,right:4,bottom:4,left:4,
										normal:{link:"BagPanel.biaoqian1",x:0,y:0,width:51,height:21},
										over:{link:"BagPanel.biaoqian2",x:0,y:0,width:51,height:21},
										down:{link:"BagPanel.biaoqian3",x:0,y:0,width:51,height:21},
										disable:{link:"BagPanel.biaoqian4",x:0,y:0,width:51,height:21}
									}
								]
							},
							{name:"all",type:"RadioButton",x:0,y:0,width:51,height:22,
								children:
								[
									{name:"all",type:"Label",x:12,y:5,width:28,height:17,
										normal:{x:0,y:0,width:28,height:17,content:"<font color='#ffffff'>全部</font>",format:{align:"left",bold:false,color:0xffffff,font:"SimSun",italic:false,leading:0,letterSpacing:0,size:12,underline:false}}
									},
									{name:"myScaleImage",type:"ScaleImage",x:0,y:0,width:51,height:21,top:4,right:4,bottom:4,left:4,
										normal:{link:"BagPanel.biaoqian1",x:0,y:0,width:51,height:21},
										over:{link:"BagPanel.biaoqian2",x:0,y:0,width:51,height:21},
										down:{link:"BagPanel.biaoqian3",x:0,y:0,width:51,height:21},
										disable:{link:"BagPanel.biaoqian4",x:0,y:0,width:51,height:21}
									}
								]
							}
						]
					},
					{name:"beibaotxtbiaoti",type:"Image",x:119,y:17,width:61,height:26,
						normal:{link:"BagPanel.beibaotxtbiaoti",x:0,y:0,width:61,height:26}
					},
					{name:"biaoti",type:"Image",x:77,y:17,width:142,height:25,
						normal:{link:"BagPanel.biaoti",x:0,y:0,width:142,height:25}
					},
					{name:"huawen1",type:"Image",x:162,y:14,width:117,height:33,
						normal:{link:"BagPanel.huawen1",x:0,y:0,width:117,height:33}
					},
					{name:"huawen2",type:"Image",x:17,y:14,width:117,height:33,
						normal:{link:"BagPanel.huawen2",x:0,y:0,width:117,height:33}
					},
					{name:"myvipanniuContainer",type:"Container",x:282,y:151,width:79,height:246,
						children:
						[
							{name:"yaunchengck",type:"Button",x:7,y:70,width:60,height:22,
								children:
								[
									{name:"yuanchengc",type:"Label",x:5,y:3,width:52,height:17,
										normal:{x:0,y:0,width:52,height:17,content:"<font color='#ffffff'>远程仓库</font>",format:{align:"left",bold:false,color:0xffffff,font:"SimSun",italic:false,leading:0,letterSpacing:0,size:12,underline:false}}
									},
									{name:"myScaleImage",type:"ScaleImage",x:0,y:0,width:60,height:22,top:4,right:4,bottom:4,left:4,
										normal:{link:"BagPanel.anniu1",x:0,y:0,width:60,height:22},
										over:{link:"BagPanel.anniu2",x:0,y:0,width:60,height:22},
										down:{link:"BagPanel.anniu3",x:0,y:0,width:60,height:22},
										disable:{link:"BagPanel.anniu4",x:0,y:0,width:60,height:22}
									}
								]
							},
							{name:"yuancgy",type:"Button",x:7,y:97,width:60,height:22,
								children:
								[
									{name:"yuancgy",type:"Label",x:5,y:3,width:52,height:17,
										normal:{x:0,y:0,width:52,height:17,content:"<font color='#ffffff'>远程购药</font>",format:{align:"left",bold:false,color:0xffffff,font:"SimSun",italic:false,leading:0,letterSpacing:0,size:12,underline:false}}
									},
									{name:"myScaleImage",type:"ScaleImage",x:0,y:0,width:60,height:22,top:4,right:4,bottom:4,left:4,
										normal:{link:"BagPanel.anniu1",x:0,y:0,width:60,height:22},
										over:{link:"BagPanel.anniu2",x:0,y:0,width:60,height:22},
										down:{link:"BagPanel.anniu3",x:0,y:0,width:60,height:22},
										disable:{link:"BagPanel.anniu4",x:0,y:0,width:60,height:22}
									}
								]
							},
							{name:"huicheng",type:"Button",x:7,y:124,width:60,height:22,
								children:
								[
									{name:"huicheng",type:"Label",x:5,y:3,width:52,height:17,
										normal:{x:0,y:0,width:52,height:17,content:"<font color='#ffffff'>回    城</font>",format:{align:"left",bold:false,color:0xffffff,font:"SimSun",italic:false,leading:0,letterSpacing:0,size:12,underline:false}}
									},
									{name:"myScaleImage",type:"ScaleImage",x:0,y:0,width:60,height:22,top:4,right:4,bottom:4,left:4,
										normal:{link:"BagPanel.anniu1",x:0,y:0,width:60,height:22},
										over:{link:"BagPanel.anniu2",x:0,y:0,width:60,height:22},
										down:{link:"BagPanel.anniu3",x:0,y:0,width:60,height:22},
										disable:{link:"BagPanel.anniu4",x:0,y:0,width:60,height:22}
									}
								]
							},
							{name:"vip",type:"Button",x:7,y:151,width:60,height:22,
								children:
								[
									{name:"VIPfuli",type:"Label",x:5,y:3,width:52,height:17,
										normal:{x:0,y:0,width:52,height:17,content:"<font color='#ffffff'>VIP 福利</font>",format:{align:"left",bold:false,color:0xffffff,font:"SimSun",italic:false,leading:0,letterSpacing:0,size:12,underline:false}}
									},
									{name:"myScaleImage",type:"ScaleImage",x:0,y:0,width:60,height:22,top:4,right:4,bottom:4,left:4,
										normal:{link:"BagPanel.anniu1",x:0,y:0,width:60,height:22},
										over:{link:"BagPanel.anniu2",x:0,y:0,width:60,height:22},
										down:{link:"BagPanel.anniu3",x:0,y:0,width:60,height:22},
										disable:{link:"BagPanel.anniu4",x:0,y:0,width:60,height:22}
									}
								]
							},
							{name:"xuanguakuang",type:"Image",x:0,y:0,width:79,height:246,
								normal:{link:"BagPanel.xuanguakuang",x:0,y:0,width:79,height:246}
							}
						]
					},
					{name:"neidiban",type:"Container",x:24,y:73,width:248,height:248,
						children:
						[
							{name:"mynormal",type:"Container",x:0,y:0,width:248,height:248,
								children:
								[
									{name:"neidiban",type:"Image",x:0,y:0,width:248,height:248,
										normal:{link:"BagPanel.neidiban",x:0,y:0,width:248,height:248}
									}
								]
							}
						]
					},
					{name:"diban",type:"ScaleImage",x:13,y:12,width:270,height:429,top:80,right:12,bottom:12,left:40,
						normal:{link:"BagPanel.diban",x:0,y:0,width:270,height:429}
					},
					{name:"底板墨迹",type:"ScaleImage",x:0,y:0,width:294,height:457,top:24,right:24,bottom:24,left:24,
						normal:{link:"BagPanel.dibanmoji",x:0,y:0,width:294,height:457}
					}
				]
			};
	}
}