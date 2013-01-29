package game.skin
{
	import Compound.hecheng;hecheng;
	import Compound.hechengdiban;hechengdiban;
	import Compound.diban1;diban1;
	import Compound.biaoqian4;biaoqian4;
	import Compound.biaoqian3;biaoqian3;
	import Compound.biaoqian2;biaoqian2;
	import Compound.biaoqian1;biaoqian1;
	import Compound.diban2;diban2;
	import Compound.gouxuan2;gouxuan2;
	import Compound.gouxuan1;gouxuan1;
	import Compound.zengjia1;zengjia1;
	import Compound.zengjia2;zengjia2;
	import Compound.jianshao2;jianshao2;
	import Compound.jianshao1;jianshao1;
	import Compound.shurukuangdiban;shurukuangdiban;
	import Compound.jian1;jian1;
	import Compound.jian2;jian2;
	import Compound.jia1;jia1;
	import Compound.jia2;jia2;
	import Compound.jinguodiban;jinguodiban;
	import Compound.dianjidiban;dianjidiban;
	import Compound.gundongdiban;gundongdiban;
	import Compound.shang1;shang1;
	import Compound.shang2;shang2;
	import Compound.xia1;xia1;
	import Compound.xia2;xia2;
	import Compound.huatiao1;huatiao1;
	import Compound.huatiao;huatiao;
	import Compound.daanniu4;daanniu4;
	import Compound.daanniu3;daanniu3;
	import Compound.daanniu2;daanniu2;
	import Compound.daanniu1;daanniu1;
	import Compound.guanbi3;guanbi3;
	import Compound.guanbi2;guanbi2;
	import Compound.guanbi1;guanbi1;

	public class CompoundSkin
	{
		public static var skin:Object=
			{name:"Compound",type:"Container",x:0,y:0,width:593,height:535,
				children:
				[
					{name:"guanbi",type:"Button",x:561,y:7,width:25,height:24,
						children:
						[
							{name:"myImage",type:"Image",x:0,y:0,width:25,height:24,
								normal:{link:"Compound.guanbi1",x:0,y:0,width:25,height:24},
								over:{link:"Compound.guanbi2",x:0,y:0,width:25,height:24},
								down:{link:"Compound.guanbi3",x:0,y:0,width:25,height:24}
							}
						]
					},
					{name:"dragBar",type:"DragBar",x:0,y:0,width:56,height:35},
					{name:"hecheng",type:"Image",x:258,y:9,width:50,height:19,
						normal:{link:"Compound.hecheng",x:0,y:0,width:50,height:19}
					},
					{name:"cailiao",type:"Label",x:398,y:239,width:28,height:17,
						normal:{x:0,y:0,width:28,height:17,content:"<font color='#795b01'>材料</font>",format:{align:"left",bold:false,color:0x795b01,font:"SimSun",italic:false,leading:12,letterSpacing:0,size:12,underline:false}}
					},
					{name:"cailiao",type:"Label",x:489,y:240,width:28,height:17,
						normal:{x:0,y:0,width:28,height:17,content:"<font color='#795b01'>材料</font>",format:{align:"left",bold:false,color:0x795b01,font:"SimSun",italic:false,leading:12,letterSpacing:0,size:12,underline:false}}
					},
					{name:"lingzhumingcheng",type:"Label",x:233,y:272,width:64,height:17,
						normal:{x:0,y:0,width:64,height:17,content:"<font color='#ffe400'>三级血灵珠</font>",format:{align:"left",bold:false,color:0xffe400,font:"SimSun",italic:false,leading:12,letterSpacing:0,size:12,underline:false}}
					},
					{name:"xianqishuzhi",type:"Label",x:460,y:366,width:46,height:17,
						normal:{x:0,y:0,width:46,height:17,content:"<font color='#fff000'>8888888</font>",format:{align:"left",bold:false,color:0xfff000,font:"SimSun",italic:false,leading:12,letterSpacing:0,size:12,underline:false}}
					},
					{name:"suoxvxianqi",type:"Label",x:398,y:366,width:64,height:17,
						normal:{x:0,y:0,width:64,height:17,content:"<font color='#dddddd'>所需仙气：</font>",format:{align:"left",bold:false,color:0xdddddd,font:"SimSun",italic:false,leading:12,letterSpacing:0,size:12,underline:false}}
					},
					{name:"baifenbi",type:"Label",x:301,y:366,width:28,height:17,
						normal:{x:0,y:0,width:28,height:17,content:"<font color='#ffe400'>100%</font>",format:{align:"left",bold:false,color:0xffe400,font:"SimSun",italic:false,leading:12,letterSpacing:0,size:12,underline:false}}
					},
					{name:"chenggonglv",type:"Label",x:255,y:366,width:52,height:17,
						normal:{x:0,y:0,width:52,height:17,content:"<font color='#dddddd'>成功率：</font>",format:{align:"left",bold:false,color:0xdddddd,font:"SimSun",italic:false,leading:12,letterSpacing:0,size:12,underline:false}}
					},
					{name:"txtcailiao1",type:"Label",x:491,y:181,width:28,height:17,
						normal:{x:0,y:0,width:28,height:17,content:"<font color='#ff0000'>6</font><font color='#dddddd'>/30</font>",format:{align:"left",bold:false,color:0xff0000,font:"SimSun",italic:false,leading:12,letterSpacing:0,size:12,underline:false}}
					},
					{name:"txtcailiao0",type:"Label",x:391,y:180,width:40,height:17,
						normal:{x:0,y:0,width:40,height:17,content:"<font color='#dddddd'>999/30</font>",format:{align:"left",bold:false,color:0xdddddd,font:"SimSun",italic:false,leading:12,letterSpacing:0,size:12,underline:false}}
					},
					{name:"hechenganniu",type:"Button",x:354,y:457,width:71,height:31,
						children:
						[
							{name:"hecheng",type:"Label",x:21,y:7,width:28,height:17,
								normal:{x:0,y:0,width:28,height:17,content:"<font color='#fffefe'>合成</font>",format:{align:"left",bold:false,color:0xfffefe,font:"SimSun",italic:false,leading:13,letterSpacing:0,size:12,underline:false}}
							},
							{name:"myImage",type:"Image",x:0,y:0,width:71,height:31,
								normal:{link:"Compound.daanniu1",x:0,y:0,width:71,height:31},
								over:{link:"Compound.daanniu2",x:0,y:0,width:71,height:31},
								down:{link:"Compound.daanniu3",x:0,y:0,width:71,height:31},
								disable:{link:"Compound.daanniu4",x:0,y:0,width:71,height:31}
							}
						]
					},
					{name:"gundongtiao",type:"ScrollBar",x:177,y:80,width:15,height:435,
						children:
						[
							{name:"thumb",type:"Button",x:2,y:71,width:11,height:36,
								children:
								[
									{name:"thumb",type:"ScaleImage",x:0,y:0,width:11,height:36,top:15,right:2,bottom:15,left:2,
										normal:{link:"Compound.huatiao",x:0,y:0,width:11,height:36},
										over:{link:"Compound.huatiao1",x:0,y:0,width:11,height:36}
									}
								]
							},
							{name:"arrowDown",type:"Button",x:0,y:420,width:15,height:15,
								children:
								[
									{name:"myImage",type:"Image",x:0,y:0,width:15,height:15,
										normal:{link:"Compound.xia2",x:0,y:0,width:15,height:15},
										over:{link:"Compound.xia1",x:0,y:0,width:15,height:15}
									}
								]
							},
							{name:"arrowUp",type:"Button",x:0,y:0,width:15,height:15,
								children:
								[
									{name:"myImage",type:"Image",x:0,y:0,width:15,height:15,
										normal:{link:"Compound.shang2",x:0,y:0,width:15,height:15},
										over:{link:"Compound.shang1",x:0,y:0,width:15,height:15}
									}
								]
							},
							{name:"track",type:"Container",x:2,y:15,width:11,height:405,
								children:
								[
									{name:"gundongdiban",type:"Image",x:0,y:0,width:11,height:405,
										normal:{link:"Compound.gundongdiban",x:0,y:0,width:11,height:405}
									}
								]
							},
							{name:"gundongdiban",type:"Image",x:2,y:8,width:11,height:420,
								normal:{link:"Compound.gundongdiban",x:0,y:0,width:11,height:420}
							}
						]
					},
					{name:"xianqi",type:"Label",x:203,y:84,width:40,height:17,
						normal:{x:0,y:0,width:40,height:17,content:"<font color='#664700'>仙气：</font>",format:{align:"left",bold:false,color:0x664700,font:"SimSun",italic:false,leading:8,letterSpacing:0,size:12,underline:false}}
					},
					{name:"xianqizhi",type:"Label",x:239,y:84,width:46,height:17,
						normal:{x:0,y:0,width:46,height:17,content:"<font color='#a07501'>9999999</font>",format:{align:"left",bold:false,color:0xa07501,font:"SimSun",italic:false,leading:8,letterSpacing:0,size:12,underline:false}}
					},
					{name:"liebiao",type:"List",x:23,y:84,width:153,height:66,
						item:
							{name:"myItem",type:"Container",x:0,y:0,width:153,height:66,
							children:
							[
								{name:"lingzhuleixing",type:"Label",x:22,y:1,width:52,height:17,
									normal:{x:0,y:0,width:52,height:17,content:"<font color='#ff7b06'>攻击灵珠</font>",format:{align:"left",bold:false,color:0xff7b06,font:"SimSun",italic:false,leading:12,letterSpacing:0,size:12,underline:false}}
								},
								{name:"lingzhushuliang",type:"Label",x:71,y:1,width:46,height:17,
									normal:{x:0,y:0,width:46,height:17,content:"<font color='#ff7b06'>(88666)</font>",format:{align:"left",bold:false,color:0xff7b06,font:"SimSun",italic:false,leading:12,letterSpacing:0,size:12,underline:false}}
								},
								{name:"三级血量灵珠",type:"Label",x:22,y:46,width:76,height:17,
									normal:{x:0,y:0,width:76,height:17,content:"<font color='#dddddd'>三级血量灵珠</font>",format:{align:"left",bold:false,color:0xdddddd,font:"SimSun",italic:false,leading:12,letterSpacing:0,size:12,underline:false}}
								},
								{name:"lingzhushuliang",type:"Label",x:96,y:46,width:34,height:17,
									normal:{x:0,y:0,width:34,height:17,content:"<font color='#dddddd'>（6）</font>",format:{align:"left",bold:false,color:0xdddddd,font:"SimSun",italic:false,leading:12,letterSpacing:0,size:12,underline:false}}
								},
								{name:"dengjilingzhu",type:"Label",x:22,y:22,width:76,height:17,
									normal:{x:0,y:0,width:76,height:17,content:"<font color='#dddddd'>二级血量灵珠</font>",format:{align:"left",bold:false,color:0xdddddd,font:"SimSun",italic:false,leading:12,letterSpacing:0,size:12,underline:false}}
								},
								{name:"dianjidiban",type:"ScaleImage",x:19,y:44,width:134,height:22,top:7,right:10,bottom:7,left:10,
									normal:{link:"Compound.dianjidiban",x:0,y:0,width:134,height:22}
								},
								{name:"jinguodiban",type:"ScaleImage",x:19,y:19,width:134,height:24,top:7,right:10,bottom:7,left:10,
									normal:{link:"Compound.jinguodiban",x:0,y:0,width:134,height:24}
								},
								{name:"jia",type:"Button",x:0,y:0,width:20,height:19,
									children:
									[
										{name:"mynormal",type:"Container",x:0,y:0,width:20,height:19,
											children:
											[
												{name:"jia2",type:"Image",x:0,y:0,width:20,height:19,
													normal:{link:"Compound.jia2",x:0,y:0,width:20,height:19}
												}
											]
										},
										{name:"myover",type:"Container",x:0,y:0,width:20,height:19,
											children:
											[
												{name:"jia1",type:"Image",x:0,y:0,width:20,height:19,
													normal:{link:"Compound.jia1",x:0,y:0,width:20,height:19}
												}
											]
										}
									]
								},
								{name:"jian",type:"Button",x:0,y:0,width:20,height:19,
									children:
									[
										{name:"mynormal",type:"Container",x:0,y:0,width:20,height:19,
											children:
											[
												{name:"jian2",type:"Image",x:0,y:0,width:20,height:19,
													normal:{link:"Compound.jian2",x:0,y:0,width:20,height:19}
												}
											]
										},
										{name:"myover",type:"Container",x:0,y:0,width:20,height:19,
											children:
											[
												{name:"jian1",type:"Image",x:0,y:0,width:20,height:19,
													normal:{link:"Compound.jian1",x:0,y:0,width:20,height:19}
												}
											]
										}
									]
								}
							]
						},
						children:
						[

						]
					},
					{name:"hechengshuliang",type:"Label",x:270,y:416,width:64,height:17,
						normal:{x:0,y:0,width:64,height:17,content:"<font color='#dddddd'>合成数量：</font>",format:{align:"left",bold:false,color:0xdddddd,font:"SimSun",italic:false,leading:12,letterSpacing:0,size:12,underline:false}}
					},
					{name:"pagination",type:"Stepper",x:328,y:413,width:126,height:24,
						children:
						[
							{name:"txt",type:"Label",x:48,y:2,width:25,height:20,
								normal:{x:0,y:0,width:25,height:20,content:"<font color='#ffffff'>100</font>",format:{align:"left",bold:false,color:0xffffff,font:"SimSun",italic:false,leading:10,letterSpacing:0,size:14,underline:false}}
							},
							{name:"shurukuangdiban",type:"ScaleImage",x:26,y:0,width:74,height:24,top:6,right:6,bottom:6,left:6,
								normal:{link:"Compound.shurukuangdiban",x:0,y:0,width:74,height:24}
							},
							{name:"nextBtn",type:"Button",x:0,y:0,width:24,height:23,
								children:
								[
									{name:"myImage",type:"Image",x:0,y:0,width:24,height:23,
										normal:{link:"Compound.jianshao1",x:0,y:0,width:24,height:23},
										over:{link:"Compound.jianshao2",x:0,y:0,width:24,height:23}
									}
								]
							},
							{name:"prevBtn",type:"Button",x:102,y:1,width:24,height:23,
								children:
								[
									{name:"myImage",type:"Image",x:0,y:0,width:24,height:23,
										normal:{link:"Compound.zengjia1",x:0,y:0,width:24,height:23}
									}
								]
							}
						]
					},
					{name:"zidonggoumaixianqi",type:"RadioButton",x:473,y:491,width:97,height:19,
						children:
						[
							{name:"zidonggoumaixianqi",type:"Label",x:21,y:0,width:76,height:17,
								normal:{x:0,y:0,width:76,height:17,content:"<font color='#dddddd'>自动购买仙气</font>",format:{align:"left",bold:false,color:0xdddddd,font:"SimSun",italic:false,leading:12,letterSpacing:0,size:12,underline:false}}
							},
							{name:"myImage",type:"Image",x:0,y:0,width:19,height:19,
								normal:{link:"Compound.gouxuan1",x:0,y:0,width:19,height:19},
								down:{link:"Compound.gouxuan2",x:0,y:0,width:19,height:19}
							}
						]
					},
					{name:"hechengdiban",type:"Image",x:194,y:78,width:382,height:439,
						normal:{link:"Compound.hechengdiban",x:0,y:0,width:382,height:439}
					},
					{name:"diban2",type:"ScaleImage",x:17,y:78,width:177,height:439,top:20,right:20,bottom:20,left:20,
						normal:{link:"Compound.diban2",x:0,y:0,width:177,height:439}
					},
					{name:"diban2",type:"ScaleImage",x:11,y:71,width:571,height:453,top:20,right:20,bottom:20,left:20,
						normal:{link:"Compound.diban2",x:0,y:0,width:571,height:453}
					},
					{name:"hecheng",type:"RadioButtonGroup",x:20,y:47,width:236,height:28,
						children:
						[
							{name:"shengji",type:"RadioButton",x:0,y:0,width:59,height:28,
								children:
								[
									{name:"myLabel",type:"Label",x:17,y:5,width:28,height:18,
										normal:{x:0,y:0,width:28,height:17,content:"<font color='#6bb58b'>升级</font>",format:{align:"left",bold:false,color:0x6bb58b,font:"SimSun",italic:false,leading:13,letterSpacing:0,size:12,underline:false}},
										down:{x:0,y:0,width:28,height:17,content:"<font color='#ffffff'>升级</font>",format:{align:"left",bold:false,color:0xffffff,font:"SimSun",italic:false,leading:13,letterSpacing:0,size:12,underline:false}}
									},
									{name:"biaoqian",type:"ScaleImage",x:0,y:0,width:59,height:28,top:10,right:15,bottom:10,left:15,
										normal:{link:"Compound.biaoqian1",x:0,y:0,width:59,height:28},
										over:{link:"Compound.biaoqian2",x:0,y:0,width:59,height:28},
										down:{link:"Compound.biaoqian3",x:0,y:0,width:59,height:28},
										disable:{link:"Compound.biaoqian4",x:0,y:0,width:59,height:28}
									}
								]
							},
							{name:"lingzhu",type:"RadioButton",x:177,y:0,width:59,height:28,
								children:
								[
									{name:"myLabel",type:"Label",x:16,y:6,width:28,height:18,
										normal:{x:0,y:0,width:28,height:17,content:"<font color='#6bb58b'>灵珠</font>",format:{align:"left",bold:false,color:0x6bb58b,font:"SimSun",italic:false,leading:13,letterSpacing:0,size:12,underline:false}},
										down:{x:0,y:0,width:28,height:17,content:"<font color='#ffffff'>灵珠</font>",format:{align:"left",bold:false,color:0xffffff,font:"SimSun",italic:false,leading:13,letterSpacing:0,size:12,underline:false}}
									},
									{name:"biaoqian",type:"ScaleImage",x:0,y:0,width:59,height:28,top:10,right:15,bottom:10,left:15,
										normal:{link:"Compound.biaoqian1",x:0,y:0,width:59,height:28},
										over:{link:"Compound.biaoqian2",x:0,y:0,width:59,height:28},
										down:{link:"Compound.biaoqian3",x:0,y:0,width:59,height:28},
										disable:{link:"Compound.biaoqian4",x:0,y:0,width:59,height:28}
									}
								]
							},
							{name:"taozhuang",type:"RadioButton",x:118,y:0,width:59,height:28,
								children:
								[
									{name:"myLabel",type:"Label",x:16,y:6,width:28,height:18,
										normal:{x:0,y:0,width:28,height:17,content:"<font color='#6bb58b'>套装</font>",format:{align:"left",bold:false,color:0x6bb58b,font:"SimSun",italic:false,leading:13,letterSpacing:0,size:12,underline:false}},
										down:{x:0,y:0,width:28,height:17,content:"<font color='#ffffff'>套装</font>",format:{align:"left",bold:false,color:0xffffff,font:"SimSun",italic:false,leading:13,letterSpacing:0,size:12,underline:false}}
									},
									{name:"biaoqian",type:"ScaleImage",x:0,y:0,width:59,height:28,top:10,right:15,bottom:10,left:15,
										normal:{link:"Compound.biaoqian1",x:0,y:0,width:59,height:28},
										over:{link:"Compound.biaoqian2",x:0,y:0,width:59,height:28},
										down:{link:"Compound.biaoqian3",x:0,y:0,width:59,height:28},
										disable:{link:"Compound.biaoqian4",x:0,y:0,width:59,height:28}
									}
								]
							},
							{name:"xianqi",type:"RadioButton",x:59,y:0,width:59,height:28,
								children:
								[
									{name:"myLabel",type:"Label",x:16,y:6,width:28,height:18,
										normal:{x:0,y:0,width:28,height:17,content:"<font color='#6bb58b'>仙气</font>",format:{align:"left",bold:false,color:0x6bb58b,font:"SimSun",italic:false,leading:13,letterSpacing:0,size:12,underline:false}},
										down:{x:0,y:0,width:28,height:17,content:"<font color='#ffffff'>仙气</font>",format:{align:"left",bold:false,color:0xffffff,font:"SimSun",italic:false,leading:13,letterSpacing:0,size:12,underline:false}}
									},
									{name:"biaoqian",type:"ScaleImage",x:0,y:0,width:59,height:28,top:10,right:15,bottom:10,left:15,
										normal:{link:"Compound.biaoqian1",x:0,y:0,width:59,height:28},
										over:{link:"Compound.biaoqian2",x:0,y:0,width:59,height:28},
										down:{link:"Compound.biaoqian3",x:0,y:0,width:59,height:28},
										disable:{link:"Compound.biaoqian4",x:0,y:0,width:59,height:28}
									}
								]
							}
						]
					},
					{name:"diban1",type:"ScaleImage",x:0,y:0,width:593,height:535,top:100,right:20,bottom:20,left:20,
						normal:{link:"Compound.diban1",x:0,y:0,width:593,height:535}
					}
				]
			};
	}
}