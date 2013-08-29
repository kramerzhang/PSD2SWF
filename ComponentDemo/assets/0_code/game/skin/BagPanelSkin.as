package game.skin
{
	import BagPanel.beijing;beijing;
	import BagPanel.vipbeijing;vipbeijing;
	import BagPanel.xingzhuang2;xingzhuang2;
	import BagPanel.guanbidi1;guanbidi1;
	import BagPanel.guanbidi2;guanbidi2;
	import BagPanel.shurukuang;shurukuang;
	import BagPanel.kuang;kuang;
	import BagPanel.kuangb;kuangb;
	import BagPanel.vip;vip;
	import BagPanel.quanbu1;quanbu1;
	import BagPanel.quanbu2;quanbu2;
	import BagPanel.quanbu3;quanbu3;
	import BagPanel.guashoudi1;guashoudi1;
	import BagPanel.guashoudi2;guashoudi2;
	import BagPanel.guashoudi3;guashoudi3;
	import BagPanel.zhuang1;zhuang1;
	import BagPanel.zhuang2;zhuang2;
	import BagPanel.zhuang3;zhuang3;
	import BagPanel.baoshi1;baoshi1;
	import BagPanel.baoshi2;baoshi2;
	import BagPanel.baoshi3;baoshi3;
	import BagPanel.baoguo;baoguo;
	import BagPanel.chacha;chacha;
	import BagPanel.chacha2;chacha2;

	/*组件结构大纲
	BagPanel:Container
		close:Button
		dragBar:DragBar
		baoguo:Image
		tabs:RadioButtonGroup
		vip:Button
		pageList:RadioButtonGroup
		shenqingjiaru:Button
		txtstx120/120:Label
		shurukuang:Image
		txtrongliang:Label
		vipgongneng:Container
			vipditu:Button
			vipfuli:Button
			piliangchushou:Button
			yaunchengyaodian:Button
			yaunchengck:Button
			vipbeijing:Image
		beijing:Image
	*/
	public class BagPanelSkin
	{
		public static var skin:Object=
			{name:"BagPanel",type:"Container",x:0,y:0,width:488,height:579,
				children:
				[
					{name:"close",type:"Button",x:352,y:18,width:38,height:39,
						children:
						[
							{name:"Image",type:"Image",x:0,y:0,width:38,height:39,
								normal:{link:"BagPanel.chacha",x:0,y:0,width:38,height:39},
								over:{link:"BagPanel.chacha2",x:0,y:0,width:38,height:39},
								down:{link:"BagPanel.chacha2",x:0,y:0,width:38,height:39}
							}
						]
					},
					{name:"dragBar",type:"DragBar",x:0,y:0,width:399,height:48},
					{name:"baoguo",type:"Image",x:1,y:0,width:396,height:86,
						normal:{link:"BagPanel.baoguo",x:0,y:0,width:396,height:86}
					},
					{name:"tabs",type:"RadioButtonGroup",x:10,y:46,width:335,height:48,
						children:
						[
							{name:"xianlu",type:"RadioButton",x:251,y:0,width:84,height:48,
								children:
								[
									{name:"Image",type:"Image",x:0,y:0,width:84,height:48,
										normal:{link:"BagPanel.baoshi1",x:0,y:0,width:84,height:40},
										over:{link:"BagPanel.baoshi2",x:0,y:1,width:83,height:39},
										down:{link:"BagPanel.baoshi3",x:0,y:1,width:84,height:47}
									}
								]
							},
							{name:"jifen",type:"RadioButton",x:84,y:0,width:85,height:48,
								children:
								[
									{name:"Image",type:"Image",x:0,y:0,width:85,height:48,
										normal:{link:"BagPanel.zhuang1",x:0,y:0,width:85,height:40},
										over:{link:"BagPanel.zhuang2",x:1,y:1,width:83,height:39},
										down:{link:"BagPanel.zhuang3",x:1,y:1,width:84,height:47}
									}
								]
							},
							{name:"chenghao",type:"RadioButton",x:168,y:0,width:84,height:48,
								children:
								[
									{name:"Image",type:"Image",x:0,y:0,width:84,height:48,
										normal:{link:"BagPanel.guashoudi1",x:0,y:0,width:84,height:40},
										over:{link:"BagPanel.guashoudi2",x:0,y:1,width:83,height:39},
										down:{link:"BagPanel.guashoudi3",x:0,y:1,width:84,height:47}
									}
								]
							},
							{name:"rnewu",type:"RadioButton",x:0,y:0,width:85,height:48,
								children:
								[
									{name:"Image",type:"Image",x:0,y:0,width:85,height:48,
										normal:{link:"BagPanel.quanbu1",x:0,y:0,width:85,height:40},
										over:{link:"BagPanel.quanbu2",x:1,y:1,width:83,height:39},
										down:{link:"BagPanel.quanbu3",x:1,y:1,width:84,height:47}
									}
								]
							}
						]
					},
					{name:"vip",type:"Button",x:348,y:67,width:36,height:14,
						children:
						[
							{name:"Image",type:"Image",x:0,y:0,width:36,height:14,
								normal:{link:"BagPanel.vip",x:0,y:0,width:36,height:14},
								down:{link:"BagPanel.vip",x:0,y:0,width:36,height:14}
							}
						]
					},
					{name:"pageList",type:"RadioButtonGroup",x:28,y:527,width:116,height:26,
						children:
						[
							{name:"pageFour",type:"RadioButton",x:90,y:0,width:26,height:26,
								children:
								[
									{name:"txtfourtss",type:"Label",x:7,y:3,width:12,height:22,
										normal:{x:0,y:0,width:12,height:22,content:"<font color='#ffffff'>4</font>",format:{align:"center",bold:false,color:0xffffff,font:"ArialMT",italic:false,leading:18,letterSpacing:0,size:14,underline:false}}
									},
									{name:"ScaleImage",type:"ScaleImage",x:0,y:0,width:26,height:26,top:4,right:4,bottom:4,left:4,
										normal:{link:"BagPanel.kuang",x:0,y:0,width:26,height:26},
										down:{link:"BagPanel.kuangb",x:0,y:0,width:26,height:26}
									}
								]
							},
							{name:"pagethree",type:"RadioButton",x:60,y:0,width:26,height:26,
								children:
								[
									{name:"txthellot",type:"Label",x:7,y:3,width:12,height:22,
										normal:{x:0,y:0,width:12,height:22,content:"<font color='#ffffff'>3</font>",format:{align:"center",bold:false,color:0xffffff,font:"ArialMT",italic:false,leading:18,letterSpacing:0,size:14,underline:false}}
									},
									{name:"ScaleImage",type:"ScaleImage",x:0,y:0,width:26,height:26,top:4,right:4,bottom:4,left:4,
										normal:{link:"BagPanel.kuang",x:0,y:0,width:26,height:26},
										down:{link:"BagPanel.kuangb",x:0,y:0,width:26,height:26}
									}
								]
							},
							{name:"pagetwo",type:"RadioButton",x:30,y:0,width:26,height:26,
								children:
								[
									{name:"txtherool",type:"Label",x:7,y:3,width:12,height:22,
										normal:{x:0,y:0,width:12,height:22,content:"<font color='#ffffff'>2</font>",format:{align:"center",bold:false,color:0xffffff,font:"ArialMT",italic:false,leading:18,letterSpacing:0,size:14,underline:false}}
									},
									{name:"ScaleImage",type:"ScaleImage",x:0,y:0,width:26,height:26,top:4,right:4,bottom:4,left:4,
										normal:{link:"BagPanel.kuang",x:0,y:0,width:26,height:26},
										down:{link:"BagPanel.kuangb",x:0,y:0,width:26,height:26}
									}
								]
							},
							{name:"pageone",type:"RadioButton",x:0,y:0,width:26,height:26,
								children:
								[
									{name:"txthellot",type:"Label",x:7,y:3,width:12,height:22,
										normal:{x:0,y:0,width:12,height:22,content:"<font color='#ffffff'>1</font>",format:{align:"center",bold:false,color:0xffffff,font:"ArialMT",italic:false,leading:18,letterSpacing:0,size:14,underline:false}}
									},
									{name:"ScaleImage",type:"ScaleImage",x:0,y:0,width:26,height:26,top:4,right:4,bottom:4,left:4,
										normal:{link:"BagPanel.kuang",x:0,y:0,width:26,height:26},
										down:{link:"BagPanel.kuangb",x:0,y:0,width:26,height:26}
									}
								]
							}
						]
					},
					{name:"shenqingjiaru",type:"Button",x:296,y:527,width:76,height:26,
						children:
						[
							{name:"txtguanbi",type:"Label",x:23,y:5,width:28,height:17,
								normal:{x:0,y:0,width:28,height:17,content:"<font color='#ffffff'>整理</font>",format:{align:"left",bold:false,color:0xffffff,font:"NSimSun",italic:false,leading:21,letterSpacing:0,size:12,underline:false}}
							},
							{name:"ScaleImage",type:"ScaleImage",x:0,y:0,width:76,height:26,top:4,right:4,bottom:4,left:4,
								normal:{link:"BagPanel.xingzhuang2",x:0,y:0,width:76,height:26},
								over:{link:"BagPanel.guanbidi1",x:0,y:0,width:76,height:26},
								down:{link:"BagPanel.guanbidi2",x:0,y:0,width:76,height:26}
							}
						]
					},
					{name:"txtstx120/120",type:"Label",x:219,y:533,width:46,height:17,
						normal:{x:0,y:0,width:46,height:17,content:"<font color='#ffffff'>120/120</font>",format:{align:"center",bold:false,color:0xffffff,font:"SimSun",italic:false,leading:20,letterSpacing:0,size:12,underline:false}}
					},
					{name:"shurukuang",type:"Image",x:202,y:527,width:75,height:27,
						normal:{link:"BagPanel.shurukuang",x:0,y:0,width:75,height:27}
					},
					{name:"txtrongliang",type:"Label",x:163,y:533,width:40,height:17,
						normal:{x:0,y:0,width:40,height:17,content:"<font color='#ffffff'>容量: </font>",format:{align:"center",bold:false,color:0xffffff,font:"SimSun",italic:false,leading:20,letterSpacing:0,size:12,underline:false}}
					},
					{name:"vipgongneng",type:"Container",x:387,y:65,width:101,height:217,
						children:
						[
							{name:"vipditu",type:"Button",x:11,y:167,width:78,height:26,
								children:
								[
									{name:"txtguaji",type:"Label",x:16,y:5,width:46,height:17,
										normal:{x:0,y:0,width:46,height:17,content:"<font color='#ffffff'>VIP挂机</font>",format:{align:"left",bold:false,color:0xffffff,font:"NSimSun",italic:false,leading:21,letterSpacing:0,size:12,underline:false}}
									},
									{name:"ScaleImage",type:"ScaleImage",x:0,y:0,width:78,height:26,top:4,right:4,bottom:4,left:4,
										normal:{link:"BagPanel.xingzhuang2",x:0,y:0,width:78,height:26},
										over:{link:"BagPanel.guanbidi1",x:0,y:0,width:78,height:26},
										down:{link:"BagPanel.guanbidi2",x:0,y:0,width:78,height:26}
									}
								]
							},
							{name:"vipfuli",type:"Button",x:11,y:137,width:78,height:26,
								children:
								[
									{name:"txtfuli",type:"Label",x:16,y:5,width:46,height:17,
										normal:{x:0,y:0,width:46,height:17,content:"<font color='#ffffff'>VIP福利</font>",format:{align:"left",bold:false,color:0xffffff,font:"NSimSun",italic:false,leading:21,letterSpacing:0,size:12,underline:false}}
									},
									{name:"ScaleImage",type:"ScaleImage",x:0,y:0,width:78,height:26,top:4,right:4,bottom:4,left:4,
										normal:{link:"BagPanel.xingzhuang2",x:0,y:0,width:78,height:26},
										over:{link:"BagPanel.guanbidi1",x:0,y:0,width:78,height:26},
										down:{link:"BagPanel.guanbidi2",x:0,y:0,width:78,height:26}
									}
								]
							},
							{name:"piliangchushou",type:"Button",x:11,y:107,width:78,height:26,
								children:
								[
									{name:"txtchushou",type:"Label",x:14,y:5,width:52,height:17,
										normal:{x:0,y:0,width:52,height:17,content:"<font color='#ffffff'>批量出售</font>",format:{align:"left",bold:false,color:0xffffff,font:"NSimSun",italic:false,leading:21,letterSpacing:0,size:12,underline:false}}
									},
									{name:"ScaleImage",type:"ScaleImage",x:0,y:0,width:78,height:26,top:4,right:4,bottom:4,left:4,
										normal:{link:"BagPanel.xingzhuang2",x:0,y:0,width:78,height:26},
										over:{link:"BagPanel.guanbidi1",x:0,y:0,width:78,height:26},
										down:{link:"BagPanel.guanbidi2",x:0,y:0,width:78,height:26}
									}
								]
							},
							{name:"yaunchengyaodian",type:"Button",x:11,y:77,width:78,height:26,
								children:
								[
									{name:"txtyaodian",type:"Label",x:14,y:5,width:52,height:17,
										normal:{x:0,y:0,width:52,height:17,content:"<font color='#ffffff'>远程药店</font>",format:{align:"left",bold:false,color:0xffffff,font:"NSimSun",italic:false,leading:21,letterSpacing:0,size:12,underline:false}}
									},
									{name:"ScaleImage",type:"ScaleImage",x:0,y:0,width:78,height:26,top:4,right:4,bottom:4,left:4,
										normal:{link:"BagPanel.xingzhuang2",x:0,y:0,width:78,height:26},
										over:{link:"BagPanel.guanbidi1",x:0,y:0,width:78,height:26},
										down:{link:"BagPanel.guanbidi2",x:0,y:0,width:78,height:26}
									}
								]
							},
							{name:"yaunchengck",type:"Button",x:11,y:47,width:78,height:26,
								children:
								[
									{name:"txtcangku",type:"Label",x:14,y:5,width:52,height:17,
										normal:{x:0,y:0,width:52,height:17,content:"<font color='#ffffff'>远程仓库</font>",format:{align:"left",bold:false,color:0xffffff,font:"NSimSun",italic:false,leading:21,letterSpacing:0,size:12,underline:false}}
									},
									{name:"ScaleImage",type:"ScaleImage",x:0,y:0,width:78,height:26,top:4,right:4,bottom:4,left:4,
										normal:{link:"BagPanel.xingzhuang2",x:0,y:0,width:78,height:26},
										over:{link:"BagPanel.guanbidi1",x:0,y:0,width:78,height:26},
										down:{link:"BagPanel.guanbidi2",x:0,y:0,width:78,height:26}
									}
								]
							},
							{name:"vipbeijing",type:"Image",x:0,y:0,width:101,height:217,
								normal:{link:"BagPanel.vipbeijing",x:0,y:0,width:101,height:217}
							}
						]
					},
					{name:"beijing",type:"Image",x:0,y:18,width:397,height:561,
						normal:{link:"BagPanel.beijing",x:0,y:0,width:397,height:561}
					}
				]
			};
		public static var resource:Array=[{type:"Image", link:"BagPanel.chacha"}, {type:"Image", link:"BagPanel.chacha2"}, {type:"Image", link:"BagPanel.chacha2"}, {type:"Image", link:"BagPanel.baoguo"}, {type:"Image", link:"BagPanel.baoshi1"}, {type:"Image", link:"BagPanel.baoshi2"}, {type:"Image", link:"BagPanel.baoshi3"}, {type:"Image", link:"BagPanel.zhuang1"}, {type:"Image", link:"BagPanel.zhuang2"}, {type:"Image", link:"BagPanel.zhuang3"}, {type:"Image", link:"BagPanel.guashoudi1"}, {type:"Image", link:"BagPanel.guashoudi2"}, {type:"Image", link:"BagPanel.guashoudi3"}, {type:"Image", link:"BagPanel.quanbu1"}, {type:"Image", link:"BagPanel.quanbu2"}, {type:"Image", link:"BagPanel.quanbu3"}, {type:"Image", link:"BagPanel.vip"}, {type:"Image", link:"BagPanel.vip"}, {type:"ScaleImage", link:"BagPanel.kuang", width:26, height:26, top:4, right:4, bottom:4, left:4}, {type:"ScaleImage", link:"BagPanel.kuangb", width:26, height:26, top:4, right:4, bottom:4, left:4}, {type:"ScaleImage", link:"BagPanel.kuang", width:26, height:26, top:4, right:4, bottom:4, left:4}, {type:"ScaleImage", link:"BagPanel.kuangb", width:26, height:26, top:4, right:4, bottom:4, left:4}, {type:"ScaleImage", link:"BagPanel.kuang", width:26, height:26, top:4, right:4, bottom:4, left:4}, {type:"ScaleImage", link:"BagPanel.kuangb", width:26, height:26, top:4, right:4, bottom:4, left:4}, {type:"ScaleImage", link:"BagPanel.kuang", width:26, height:26, top:4, right:4, bottom:4, left:4}, {type:"ScaleImage", link:"BagPanel.kuangb", width:26, height:26, top:4, right:4, bottom:4, left:4}, {type:"ScaleImage", link:"BagPanel.xingzhuang2", width:76, height:26, top:4, right:4, bottom:4, left:4}, {type:"ScaleImage", link:"BagPanel.guanbidi1", width:76, height:26, top:4, right:4, bottom:4, left:4}, {type:"ScaleImage", link:"BagPanel.guanbidi2", width:76, height:26, top:4, right:4, bottom:4, left:4}, {type:"Image", link:"BagPanel.shurukuang"}, {type:"ScaleImage", link:"BagPanel.xingzhuang2", width:78, height:26, top:4, right:4, bottom:4, left:4}, {type:"ScaleImage", link:"BagPanel.guanbidi1", width:78, height:26, top:4, right:4, bottom:4, left:4}, {type:"ScaleImage", link:"BagPanel.guanbidi2", width:78, height:26, top:4, right:4, bottom:4, left:4}, {type:"ScaleImage", link:"BagPanel.xingzhuang2", width:78, height:26, top:4, right:4, bottom:4, left:4}, {type:"ScaleImage", link:"BagPanel.guanbidi1", width:78, height:26, top:4, right:4, bottom:4, left:4}, {type:"ScaleImage", link:"BagPanel.guanbidi2", width:78, height:26, top:4, right:4, bottom:4, left:4}, {type:"ScaleImage", link:"BagPanel.xingzhuang2", width:78, height:26, top:4, right:4, bottom:4, left:4}, {type:"ScaleImage", link:"BagPanel.guanbidi1", width:78, height:26, top:4, right:4, bottom:4, left:4}, {type:"ScaleImage", link:"BagPanel.guanbidi2", width:78, height:26, top:4, right:4, bottom:4, left:4}, {type:"ScaleImage", link:"BagPanel.xingzhuang2", width:78, height:26, top:4, right:4, bottom:4, left:4}, {type:"ScaleImage", link:"BagPanel.guanbidi1", width:78, height:26, top:4, right:4, bottom:4, left:4}, {type:"ScaleImage", link:"BagPanel.guanbidi2", width:78, height:26, top:4, right:4, bottom:4, left:4}, {type:"ScaleImage", link:"BagPanel.xingzhuang2", width:78, height:26, top:4, right:4, bottom:4, left:4}, {type:"ScaleImage", link:"BagPanel.guanbidi1", width:78, height:26, top:4, right:4, bottom:4, left:4}, {type:"ScaleImage", link:"BagPanel.guanbidi2", width:78, height:26, top:4, right:4, bottom:4, left:4}, {type:"Image", link:"BagPanel.vipbeijing"}, {type:"Image", link:"BagPanel.beijing"}];
	}
}