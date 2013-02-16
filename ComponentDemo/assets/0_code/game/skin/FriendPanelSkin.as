package game.skin
{
	import FriendPanel.fenshenicon;fenshenicon;
	import FriendPanel.diban;diban;
	import FriendPanel.biaoqian4;biaoqian4;
	import FriendPanel.biaoqian3;biaoqian3;
	import FriendPanel.biaoqian2;biaoqian2;
	import FriendPanel.biaoqian1;biaoqian1;
	import FriendPanel.neidiban;neidiban;
	import FriendPanel.shurukuangdiban;shurukuangdiban;
	import FriendPanel.xiayiye2;xiayiye2;
	import FriendPanel.xiayiye1;xiayiye1;
	import FriendPanel.shangyiye2;shangyiye2;
	import FriendPanel.shangyiye1;shangyiye1;
	import FriendPanel.weiye2;weiye2;
	import FriendPanel.weiye1;weiye1;
	import FriendPanel.shouye2;shouye2;
	import FriendPanel.shouye1;shouye1;
	import FriendPanel.neidiban2;neidiban2;
	import FriendPanel.xin;xin;
	import FriendPanel.nv;nv;
	import FriendPanel.nan;nan;
	import FriendPanel.fenggexian;fenggexian;
	import FriendPanel.liebiaodiban;liebiaodiban;
	import FriendPanel.huo3;huo3;
	import FriendPanel.huo2;huo2;
	import FriendPanel.huo1;huo1;
	import FriendPanel.gu4;gu4;
	import FriendPanel.gu3;gu3;
	import FriendPanel.gu2;gu2;
	import FriendPanel.gu1;gu1;
	import FriendPanel.zhong3;zhong3;
	import FriendPanel.zhong2;zhong2;
	import FriendPanel.zhong1;zhong1;
	import FriendPanel.mo3;mo3;
	import FriendPanel.mo2;mo2;
	import FriendPanel.mo1;mo1;
	import FriendPanel.ci3;ci3;
	import FriendPanel.ci2;ci2;
	import FriendPanel.ci1;ci1;
	import FriendPanel.daanniu4;daanniu4;
	import FriendPanel.daanniu3;daanniu3;
	import FriendPanel.daanniu2;daanniu2;
	import FriendPanel.daanniu1;daanniu1;
	import FriendPanel.haoyou;haoyou;
	import FriendPanel.gezi3;gezi3;
	import FriendPanel.guanbi3;guanbi3;
	import FriendPanel.guanbi2;guanbi2;
	import FriendPanel.guanbi1;guanbi1;

	/*
	FriendPanel:Container
		guanbi:Button
		dragBar:DragBar
		myImage:Image
		haoyou:Container
			haoyou:Image
		fenshenicon:Image
		wanjiamingzi:Label
		shousuohaoyou:Button
		search:Label
		name:ScaleImage
		haoyoutuijian:Button
		tianjaihaoyou:Button
		haoyouliebiao:List
		neidiban2:ScaleImage
		page:Stepper
		neidiban:ScaleImage
		haoyou:RadioButtonGroup
		diban:ScaleImage
	*/
	public class FriendPanelSkin
	{
		public static var skin:Object=
			{name:"FriendPanel",type:"Container",x:0,y:0,width:302,height:578,
				children:
				[
					{name:"guanbi",type:"Button",x:270,y:7,width:25,height:24,
						children:
						[
							{name:"myImage",type:"Image",x:0,y:0,width:25,height:24,
								normal:{link:"FriendPanel.guanbi1",x:0,y:0,width:25,height:24},
								over:{link:"FriendPanel.guanbi2",x:0,y:0,width:25,height:24},
								down:{link:"FriendPanel.guanbi3",x:0,y:0,width:25,height:24}
							}
						]
					},
					{name:"dragBar",type:"DragBar",x:0,y:0,width:270,height:30},
					{name:"myImage",type:"Image",x:12,y:44,width:49,height:49,
						normal:{link:"FriendPanel.gezi3",x:0,y:0,width:49,height:49}
					},
					{name:"haoyou",type:"Container",x:135,y:9,width:50,height:18,
						children:
						[
							{name:"haoyou",type:"Image",x:0,y:0,width:50,height:18,
								normal:{link:"FriendPanel.haoyou",x:0,y:0,width:50,height:18}
							}
						]
					},
					{name:"fenshenicon",type:"Image",x:66,y:66,width:22,height:27,
						normal:{link:"FriendPanel.fenshenicon",x:0,y:0,width:22,height:27}
					},
					{name:"wanjiamingzi",type:"Label",x:63,y:46,width:76,height:17,
						normal:{x:0,y:0,width:76,height:17,content:"<font color='#dcdcdc'>师傅是水电费</font>",format:{align:"left",bold:false,color:0xdcdcdc,font:"SimSun",italic:false,leading:17,letterSpacing:0,size:12,underline:false}}
					},
					{name:"shousuohaoyou",type:"Button",x:198,y:97,width:71,height:31,
						children:
						[
							{name:"shousuohaoyou",type:"Label",x:11,y:7,width:52,height:17,
								normal:{x:0,y:0,width:52,height:17,content:"<font color='#fffefe'>搜索好友</font>",format:{align:"left",bold:false,color:0xfffefe,font:"SimSun",italic:false,leading:13.000000000000002,letterSpacing:0,size:12,underline:false}}
							},
							{name:"myImage",type:"Image",x:0,y:0,width:71,height:31,
								normal:{link:"FriendPanel.daanniu1",x:0,y:0,width:71,height:31},
								over:{link:"FriendPanel.daanniu2",x:0,y:0,width:71,height:31},
								down:{link:"FriendPanel.daanniu3",x:0,y:0,width:71,height:31},
								disable:{link:"FriendPanel.daanniu4",x:0,y:0,width:71,height:31}
							}
						]
					},
					{name:"search",type:"Label",x:16,y:104,width:172,height:17,
						normal:{x:0,y:0,width:172,height:17,content:"<font color='#fefcfc'>搜索人物名字xxxxxxxxxxxxxxxx</font>",format:{align:"left",bold:false,color:0xfefcfc,font:"SimSun",italic:false,leading:13.000000000000002,letterSpacing:0,size:12,underline:false}}
					},
					{name:"name",type:"ScaleImage",x:13,y:100,width:180,height:24,top:6,right:6,bottom:6,left:6,
						normal:{link:"FriendPanel.shurukuangdiban",x:0,y:0,width:180,height:24}
					},
					{name:"haoyoutuijian",type:"Button",x:155,y:519,width:71,height:31,
						children:
						[
							{name:"haoyoutuijian",type:"Label",x:11,y:7,width:52,height:17,
								normal:{x:0,y:0,width:52,height:17,content:"<font color='#fffefe'>好友推荐</font>",format:{align:"left",bold:false,color:0xfffefe,font:"SimSun",italic:false,leading:13.000000000000002,letterSpacing:0,size:12,underline:false}}
							},
							{name:"myImage",type:"Image",x:0,y:0,width:71,height:31,
								normal:{link:"FriendPanel.daanniu1",x:0,y:0,width:71,height:31},
								over:{link:"FriendPanel.daanniu2",x:0,y:0,width:71,height:31},
								down:{link:"FriendPanel.daanniu3",x:0,y:0,width:71,height:31},
								disable:{link:"FriendPanel.daanniu4",x:0,y:0,width:71,height:31}
							}
						]
					},
					{name:"tianjaihaoyou",type:"Button",x:68,y:519,width:71,height:31,
						children:
						[
							{name:"tianjiahaoyou",type:"Label",x:11,y:7,width:52,height:17,
								normal:{x:0,y:0,width:52,height:17,content:"<font color='#fffefe'>添加好友</font>",format:{align:"left",bold:false,color:0xfffefe,font:"SimSun",italic:false,leading:13.000000000000002,letterSpacing:0,size:12,underline:false}}
							},
							{name:"myImage",type:"Image",x:0,y:0,width:71,height:31,
								normal:{link:"FriendPanel.daanniu1",x:0,y:0,width:71,height:31},
								over:{link:"FriendPanel.daanniu2",x:0,y:0,width:71,height:31},
								down:{link:"FriendPanel.daanniu3",x:0,y:0,width:71,height:31},
								disable:{link:"FriendPanel.daanniu4",x:0,y:0,width:71,height:31}
							}
						]
					},
					{name:"haoyouliebiao",type:"List",x:18,y:172,width:266,height:45,
						item:
							{name:"myItem",type:"Container",x:0,y:0,width:266,height:45,
							children:
							[
								{name:"qinmidu",type:"Label",x:91,y:25,width:22,height:17,
									normal:{x:0,y:0,width:22,height:17,content:"<font color='#ff4d00'>888</font>",format:{align:"left",bold:false,color:0xff4d00,font:"SimSun",italic:false,leading:30,letterSpacing:0,size:12,underline:false}}
								},
								{name:"dengji",type:"Label",x:26,y:25,width:34,height:17,
									normal:{x:0,y:0,width:34,height:17,content:"<font color='#ffea00'>120级</font>",format:{align:"left",bold:false,color:0xffea00,font:"SimSun",italic:false,leading:30,letterSpacing:0,size:12,underline:false}}
								},
								{name:"xin",type:"Image",x:77,y:26,width:15,height:14,
									normal:{link:"FriendPanel.xin",x:0,y:0,width:15,height:14}
								},
								{name:"haoyoumingzi",type:"Label",x:25,y:6,width:88,height:17,
									normal:{x:0,y:0,width:88,height:17,content:"<font color='#dcdcdc'>师傅是师傅的的</font>",format:{align:"left",bold:false,color:0xdcdcdc,font:"SimSun",italic:false,leading:30,letterSpacing:0,size:12,underline:false}}
								},
								{name:"nv",type:"Image",x:7,y:9,width:13,height:17,
									normal:{link:"FriendPanel.nv",x:0,y:0,width:13,height:17}
								},
								{name:"nan",type:"Image",x:7,y:7,width:14,height:14,
									normal:{link:"FriendPanel.nan",x:0,y:0,width:14,height:14}
								},
								{name:"ci",type:"Button",x:139,y:10,width:23,height:23,
									children:
									[
										{name:"ci",type:"ScaleImage",x:0,y:0,width:23,height:23,top:4,right:4,bottom:4,left:4,
											normal:{link:"FriendPanel.ci1",x:0,y:0,width:23,height:23},
											over:{link:"FriendPanel.ci2",x:0,y:0,width:23,height:23},
											down:{link:"FriendPanel.ci3",x:0,y:0,width:23,height:23}
										}
									]
								},
								{name:"mo",type:"Button",x:138,y:10,width:23,height:23,
									children:
									[
										{name:"myImage",type:"Image",x:0,y:0,width:23,height:23,
											normal:{link:"FriendPanel.mo1",x:0,y:0,width:23,height:23},
											over:{link:"FriendPanel.mo2",x:0,y:0,width:23,height:23},
											down:{link:"FriendPanel.mo3",x:0,y:0,width:23,height:23}
										}
									]
								},
								{name:"zhong",type:"Button",x:165,y:10,width:23,height:23,
									children:
									[
										{name:"myImage",type:"Image",x:0,y:0,width:23,height:23,
											normal:{link:"FriendPanel.zhong1",x:0,y:0,width:23,height:23},
											over:{link:"FriendPanel.zhong2",x:0,y:0,width:23,height:23},
											down:{link:"FriendPanel.zhong3",x:0,y:0,width:23,height:23}
										}
									]
								},
								{name:"gu",type:"Button",x:219,y:7,width:29,height:28,
									children:
									[
										{name:"myImage",type:"Image",x:0,y:0,width:29,height:28,
											normal:{link:"FriendPanel.gu1",x:0,y:0,width:29,height:28},
											over:{link:"FriendPanel.gu2",x:0,y:0,width:29,height:28},
											down:{link:"FriendPanel.gu3",x:0,y:0,width:29,height:28},
											disable:{link:"FriendPanel.gu4",x:0,y:0,width:29,height:28}
										}
									]
								},
								{name:"huo",type:"Button",x:192,y:10,width:23,height:23,
									children:
									[
										{name:"myImage",type:"Image",x:0,y:0,width:23,height:23,
											normal:{link:"FriendPanel.huo1",x:0,y:0,width:23,height:23},
											over:{link:"FriendPanel.huo2",x:0,y:0,width:23,height:23},
											down:{link:"FriendPanel.huo3",x:0,y:0,width:23,height:23}
										}
									]
								},
								{name:"fenggexian",type:"Image",x:0,y:43,width:266,height:2,
									normal:{link:"FriendPanel.fenggexian",x:0,y:0,width:266,height:2}
								},
								{name:"liebiaodiban",type:"Image",x:0,y:0,width:266,height:40,
									normal:{link:"FriendPanel.liebiaodiban",x:0,y:0,width:266,height:40}
								}
							]
						},
						children:
						[

						]
					},
					{name:"neidiban2",type:"ScaleImage",x:17,y:168,width:268,height:304,top:20,right:20,bottom:20,left:20,
						normal:{link:"FriendPanel.neidiban2",x:0,y:0,width:268,height:304}
					},
					{name:"page",type:"Stepper",x:69,y:476,width:157,height:24,
						children:
						[
							{name:"txt",type:"Label",x:59,y:3,width:40,height:17,
								normal:{x:0,y:0,width:40,height:17,content:"<font color='#ffffff'>10/20</font>",format:{align:"left",bold:false,color:0xffffff,font:"SimSun",italic:false,leading:0,letterSpacing:0.8,size:12,underline:false}}
							},
							{name:"firstBtn",type:"Button",x:0,y:1,width:24,height:23,
								children:
								[
									{name:"myImage",type:"Image",x:0,y:0,width:24,height:23,
										normal:{link:"FriendPanel.shouye1",x:0,y:0,width:24,height:23},
										over:{link:"FriendPanel.shouye2",x:0,y:0,width:24,height:23}
									}
								]
							},
							{name:"lastBtn",type:"Button",x:133,y:1,width:24,height:23,
								children:
								[
									{name:"myImage",type:"Image",x:0,y:0,width:24,height:23,
										normal:{link:"FriendPanel.weiye1",x:0,y:0,width:24,height:23},
										over:{link:"FriendPanel.weiye2",x:0,y:0,width:24,height:23}
									}
								]
							},
							{name:"prevBtn",type:"Button",x:24,y:1,width:24,height:23,
								children:
								[
									{name:"myImage",type:"Image",x:0,y:0,width:24,height:23,
										normal:{link:"FriendPanel.shangyiye1",x:0,y:0,width:24,height:23},
										over:{link:"FriendPanel.shangyiye2",x:0,y:0,width:24,height:23}
									}
								]
							},
							{name:"nextBtn",type:"Button",x:109,y:1,width:24,height:23,
								children:
								[
									{name:"myImage",type:"Image",x:0,y:0,width:24,height:23,
										normal:{link:"FriendPanel.xiayiye1",x:0,y:0,width:24,height:23},
										over:{link:"FriendPanel.xiayiye2",x:0,y:0,width:24,height:23}
									}
								]
							},
							{name:"shurukuangdiban",type:"ScaleImage",x:49,y:0,width:59,height:24,top:6,right:6,bottom:6,left:6,
								normal:{link:"FriendPanel.shurukuangdiban",x:0,y:0,width:59,height:24}
							}
						]
					},
					{name:"neidiban",type:"ScaleImage",x:11,y:161,width:280,height:407,top:20,right:20,bottom:20,left:20,
						normal:{link:"FriendPanel.neidiban",x:0,y:0,width:280,height:407}
					},
					{name:"haoyou",type:"RadioButtonGroup",x:21,y:137,width:236,height:28,
						children:
						[
							{name:"haoyou",type:"RadioButton",x:0,y:0,width:59,height:28,
								children:
								[
									{name:"myLabel",type:"Label",x:17,y:4,width:28,height:18,
										normal:{x:0,y:0,width:28,height:17,content:"<font color='#ffffff'>好友</font>",format:{align:"left",bold:false,color:0xffffff,font:"SimSun",italic:false,leading:13.000000000000002,letterSpacing:0,size:12,underline:false}},
										over:{x:0,y:0,width:28,height:17,content:"<font color='#fcf901'>好友</font>",format:{align:"left",bold:false,color:0xfcf901,font:"SimSun",italic:false,leading:13.000000000000002,letterSpacing:0,size:12,underline:false}},
										down:{x:0,y:0,width:28,height:17,content:"<font color='#fe011f'>好友</font>",format:{align:"left",bold:false,color:0xfe011f,font:"SimSun",italic:false,leading:13.000000000000002,letterSpacing:0,size:12,underline:false}}
									},
									{name:"biaoqian",type:"ScaleImage",x:0,y:0,width:59,height:28,top:10,right:15,bottom:10,left:15,
										normal:{link:"FriendPanel.biaoqian1",x:0,y:0,width:59,height:28},
										over:{link:"FriendPanel.biaoqian2",x:0,y:0,width:59,height:28},
										down:{link:"FriendPanel.biaoqian3",x:0,y:0,width:59,height:28},
										disable:{link:"FriendPanel.biaoqian4",x:0,y:0,width:59,height:28}
									}
								]
							},
							{name:"heimingdan",type:"RadioButton",x:59,y:0,width:59,height:28,
								children:
								[
									{name:"myLabel",type:"Label",x:11,y:5,width:40,height:18,
										normal:{x:0,y:0,width:40,height:17,content:"<font color='#ffffff'>黑名单</font>",format:{align:"left",bold:false,color:0xffffff,font:"SimSun",italic:false,leading:13.000000000000002,letterSpacing:0,size:12,underline:false}},
										down:{x:0,y:0,width:40,height:17,content:"<font color='#fd0000'>黑名单</font>",format:{align:"left",bold:false,color:0xfd0000,font:"SimSun",italic:false,leading:13.000000000000002,letterSpacing:0,size:12,underline:false}}
									},
									{name:"biaoqian",type:"ScaleImage",x:0,y:0,width:59,height:28,top:10,right:15,bottom:10,left:15,
										normal:{link:"FriendPanel.biaoqian1",x:0,y:0,width:59,height:28},
										over:{link:"FriendPanel.biaoqian2",x:0,y:0,width:59,height:28},
										down:{link:"FriendPanel.biaoqian3",x:0,y:0,width:59,height:28},
										disable:{link:"FriendPanel.biaoqian4",x:0,y:0,width:59,height:28}
									}
								]
							},
							{name:"zuijin",type:"RadioButton",x:118,y:0,width:59,height:28,
								children:
								[
									{name:"heimingdan",type:"Label",x:16,y:6,width:28,height:17,
										normal:{x:0,y:0,width:28,height:17,content:"<font color='#ffffff'>最近</font>",format:{align:"left",bold:false,color:0xffffff,font:"SimSun",italic:false,leading:13.000000000000002,letterSpacing:0,size:12,underline:false}}
									},
									{name:"biaoqian",type:"ScaleImage",x:0,y:0,width:59,height:28,top:10,right:15,bottom:10,left:15,
										normal:{link:"FriendPanel.biaoqian1",x:0,y:0,width:59,height:28},
										over:{link:"FriendPanel.biaoqian2",x:0,y:0,width:59,height:28},
										down:{link:"FriendPanel.biaoqian3",x:0,y:0,width:59,height:28},
										disable:{link:"FriendPanel.biaoqian4",x:0,y:0,width:59,height:28}
									}
								]
							},
							{name:"fenshen",type:"RadioButton",x:177,y:0,width:59,height:28,
								children:
								[
									{name:"heimingdan",type:"Label",x:16,y:6,width:28,height:17,
										normal:{x:0,y:0,width:28,height:17,content:"<font color='#ffffff'>分身</font>",format:{align:"left",bold:false,color:0xffffff,font:"SimSun",italic:false,leading:13.000000000000002,letterSpacing:0,size:12,underline:false}}
									},
									{name:"biaoqian",type:"ScaleImage",x:0,y:0,width:59,height:28,top:10,right:15,bottom:10,left:15,
										normal:{link:"FriendPanel.biaoqian1",x:0,y:0,width:59,height:28},
										over:{link:"FriendPanel.biaoqian2",x:0,y:0,width:59,height:28},
										down:{link:"FriendPanel.biaoqian3",x:0,y:0,width:59,height:28},
										disable:{link:"FriendPanel.biaoqian4",x:0,y:0,width:59,height:28}
									}
								]
							}
						]
					},
					{name:"diban",type:"ScaleImage",x:0,y:0,width:302,height:578,top:20,right:20,bottom:20,left:20,
						normal:{link:"FriendPanel.diban",x:0,y:0,width:302,height:578}
					}
				]
			};
	}
}