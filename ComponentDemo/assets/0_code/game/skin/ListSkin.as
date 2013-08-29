package game.skin
{
	import List.background;background;
	import List.liebiaodiban;liebiaodiban;
	import List.huo1;huo1;
	import List.huo2;huo2;
	import List.huo3;huo3;
	import List.gu1;gu1;
	import List.gu2;gu2;
	import List.gu3;gu3;
	import List.gu4;gu4;
	import List.zhong1;zhong1;
	import List.zhong2;zhong2;
	import List.zhong3;zhong3;
	import List.mo1;mo1;
	import List.mo2;mo2;
	import List.mo3;mo3;
	import List.ci1;ci1;
	import List.ci2;ci2;
	import List.ci3;ci3;
	import List.nan;nan;
	import List.nv;nv;
	import List.xin;xin;

	/*组件结构大纲
	List:Container
		haoyouliebiao:List
		background:Image
	*/
	public class ListSkin
	{
		public static var skin:Object=
			{name:"List",type:"Container",x:0,y:0,width:300,height:400,
				children:
				[
					{name:"haoyouliebiao",type:"List",x:17,y:21,width:266,height:40,
						item:
							{name:"Item",type:"Container",x:0,y:0,width:266,height:40,
							children:
							[
								{name:"qinmidu",type:"Label",x:91,y:23,width:22,height:17,
									normal:{x:0,y:0,width:22,height:17,content:"<font color='#ff4d00'>888</font>",format:{align:"left",bold:false,color:0xff4d00,font:"SimSun",italic:false,leading:30,letterSpacing:0,size:12,underline:false}}
								},
								{name:"dengji",type:"Label",x:26,y:23,width:34,height:17,
									normal:{x:0,y:0,width:34,height:17,content:"<font color='#ffea00'>120级</font>",format:{align:"left",bold:false,color:0xffea00,font:"SimSun",italic:false,leading:30,letterSpacing:0,size:12,underline:false}}
								},
								{name:"xin",type:"Image",x:77,y:24,width:15,height:14,
									normal:{link:"List.xin",x:0,y:0,width:15,height:14}
								},
								{name:"haoyoumingzi",type:"Label",x:25,y:4,width:88,height:17,
									normal:{x:0,y:0,width:88,height:17,content:"<font color='#dcdcdc'>师傅是师傅的的</font>",format:{align:"left",bold:false,color:0xdcdcdc,font:"SimSun",italic:false,leading:30,letterSpacing:0,size:12,underline:false}}
								},
								{name:"nv",type:"Image",x:7,y:7,width:13,height:17,
									normal:{link:"List.nv",x:0,y:0,width:13,height:17}
								},
								{name:"nan",type:"Image",x:7,y:5,width:14,height:14,
									normal:{link:"List.nan",x:0,y:0,width:14,height:14}
								},
								{name:"ci",type:"Button",x:139,y:8,width:23,height:23,
									children:
									[
										{name:"ci",type:"ScaleImage",x:0,y:0,width:23,height:23,top:4,right:4,bottom:4,left:4,
											normal:{link:"List.ci1",x:0,y:0,width:23,height:23},
											over:{link:"List.ci2",x:0,y:0,width:23,height:23},
											down:{link:"List.ci3",x:0,y:0,width:23,height:23}
										}
									]
								},
								{name:"mo",type:"Button",x:138,y:8,width:23,height:23,
									children:
									[
										{name:"Image",type:"Image",x:0,y:0,width:23,height:23,
											normal:{link:"List.mo1",x:0,y:0,width:23,height:23},
											over:{link:"List.mo2",x:0,y:0,width:23,height:23},
											down:{link:"List.mo3",x:0,y:0,width:23,height:23}
										}
									]
								},
								{name:"zhong",type:"Button",x:165,y:8,width:23,height:23,
									children:
									[
										{name:"Image",type:"Image",x:0,y:0,width:23,height:23,
											normal:{link:"List.zhong1",x:0,y:0,width:23,height:23},
											over:{link:"List.zhong2",x:0,y:0,width:23,height:23},
											down:{link:"List.zhong3",x:0,y:0,width:23,height:23}
										}
									]
								},
								{name:"gu",type:"Button",x:219,y:5,width:29,height:28,
									children:
									[
										{name:"Image",type:"Image",x:0,y:0,width:29,height:28,
											normal:{link:"List.gu1",x:0,y:0,width:29,height:28},
											over:{link:"List.gu2",x:0,y:0,width:29,height:28},
											down:{link:"List.gu3",x:0,y:0,width:29,height:28},
											disable:{link:"List.gu4",x:0,y:0,width:29,height:28}
										}
									]
								},
								{name:"huo",type:"Button",x:192,y:8,width:23,height:23,
									children:
									[
										{name:"Image",type:"Image",x:0,y:0,width:23,height:23,
											normal:{link:"List.huo1",x:0,y:0,width:23,height:23},
											over:{link:"List.huo2",x:0,y:0,width:23,height:23},
											down:{link:"List.huo3",x:0,y:0,width:23,height:23}
										}
									]
								},
								{name:"liebiaodiban",type:"Image",x:0,y:0,width:266,height:40,
									normal:{link:"List.liebiaodiban",x:0,y:0,width:266,height:40}
								}
							]
						},
						children:
						[

						]
					},
					{name:"background",type:"Image",x:0,y:0,width:300,height:400,
						normal:{link:"List.background",x:0,y:0,width:300,height:400}
					}
				]
			};
		public static var resource:Array=[{type:"Image", link:"List.xin"}, {type:"Image", link:"List.nv"}, {type:"Image", link:"List.nan"}, {type:"ScaleImage", link:"List.ci1", width:23, height:23, top:4, right:4, bottom:4, left:4}, {type:"ScaleImage", link:"List.ci2", width:23, height:23, top:4, right:4, bottom:4, left:4}, {type:"ScaleImage", link:"List.ci3", width:23, height:23, top:4, right:4, bottom:4, left:4}, {type:"Image", link:"List.mo1"}, {type:"Image", link:"List.mo2"}, {type:"Image", link:"List.mo3"}, {type:"Image", link:"List.zhong1"}, {type:"Image", link:"List.zhong2"}, {type:"Image", link:"List.zhong3"}, {type:"Image", link:"List.gu1"}, {type:"Image", link:"List.gu2"}, {type:"Image", link:"List.gu3"}, {type:"Image", link:"List.gu4"}, {type:"Image", link:"List.huo1"}, {type:"Image", link:"List.huo2"}, {type:"Image", link:"List.huo3"}, {type:"Image", link:"List.liebiaodiban"}, {type:"Image", link:"List.background"}];
	}
}