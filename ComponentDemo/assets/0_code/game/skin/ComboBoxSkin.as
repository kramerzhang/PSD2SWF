package game.skin
{
	import ComboBox.background;background;
	import ComboBox.neidiban;neidiban;
	import ComboBox.viewport;viewport;
	import ComboBox.track;track;
	import ComboBox.thumbOver;thumbOver;
	import ComboBox.thumbNormal;thumbNormal;
	import ComboBox.arrowUpNormal;arrowUpNormal;
	import ComboBox.arrowUpOver;arrowUpOver;
	import ComboBox.arrowDownNormal;arrowDownNormal;
	import ComboBox.arrowDownOver;arrowDownOver;
	import ComboBox.tipsdianxuanzhong;tipsdianxuanzhong;
	import ComboBox.shurukuang;shurukuang;
	import ComboBox.Listanniu1;Listanniu1;
	import ComboBox.Listanniu2;Listanniu2;
	import ComboBox.Listanniu3;Listanniu3;
	import ComboBox.Listanniu4;Listanniu4;

	/*组件结构大纲
	ComboBox:Container
		haoyou:ComboBox
		background:Image
	*/
	public class ComboBoxSkin
	{
		public static var skin:Object=
			{name:"ComboBox",type:"Container",x:0,y:0,width:200,height:200,
				children:
				[
					{name:"haoyou",type:"ComboBox",x:41,y:33,width:110,height:115,
						children:
						[
							{name:"label",type:"Label",x:14,y:4,width:52,height:17,
								normal:{x:0,y:0,width:52,height:17,content:"<font color='#ffffff'>好友列表</font>",format:{align:"left",bold:false,color:0xffffff,font:"SimSun",italic:false,leading:2.4,letterSpacing:0,size:12,underline:false}}
							},
							{name:"btn",type:"Button",x:74,y:3,width:18,height:18,
								children:
								[
									{name:"Image",type:"Image",x:0,y:0,width:18,height:18,
										normal:{link:"ComboBox.Listanniu1",x:0,y:0,width:18,height:18},
										over:{link:"ComboBox.Listanniu2",x:0,y:0,width:18,height:18},
										down:{link:"ComboBox.Listanniu3",x:0,y:0,width:18,height:18},
										disable:{link:"ComboBox.Listanniu4",x:0,y:0,width:18,height:18}
									}
								]
							},
							{name:"shurukuang",type:"Image",x:1,y:0,width:94,height:24,
								normal:{link:"ComboBox.shurukuang",x:0,y:0,width:94,height:24}
							},
							{name:"list",type:"List",x:0,y:26,width:100,height:19,
								item:
									{name:"Item",type:"Container",x:0,y:0,width:100,height:19,
									children:
									[
										{name:"txtwanjiaming",type:"Label",x:3,y:1,width:97,height:17,
											normal:{x:0,y:0,width:97,height:17,content:"<font color='#ffffff'>玩家名称几个字</font>",format:{align:"left",bold:false,color:0xffffff,font:"SimSun",italic:false,leading:9,letterSpacing:0.6,size:12,underline:false}}
										},
										{name:"tipsdianxuanzhong",type:"Image",x:0,y:0,width:97,height:19,
											normal:{link:"ComboBox.tipsdianxuanzhong",x:0,y:0,width:97,height:19}
										}
									]
								},
								children:
								[

								]
							},
							{name:"scrollBar",type:"ScrollBar",x:4,y:26,width:106,height:89,
								children:
								[
									{name:"arrowDown",type:"Button",x:92,y:79,width:14,height:10,
										children:
										[
											{name:"Image",type:"Image",x:0,y:0,width:14,height:10,
												normal:{link:"ComboBox.arrowDownNormal",x:0,y:0,width:14,height:10},
												over:{link:"ComboBox.arrowDownOver",x:0,y:0,width:14,height:10}
											}
										]
									},
									{name:"arrowUp",type:"Button",x:92,y:0,width:14,height:10,
										children:
										[
											{name:"Image",type:"Image",x:0,y:0,width:14,height:10,
												normal:{link:"ComboBox.arrowUpNormal",x:0,y:0,width:14,height:10},
												over:{link:"ComboBox.arrowUpOver",x:0,y:0,width:14,height:10}
											}
										]
									},
									{name:"thumb",type:"Button",x:94,y:23,width:10,height:21,
										children:
										[
											{name:"ScaleImage",type:"ScaleImage",x:0,y:0,width:10,height:21,top:4,right:4,bottom:4,left:4,
												over:{link:"ComboBox.thumbOver",x:0,y:0,width:10,height:21},
												normal:{link:"ComboBox.thumbNormal",x:0,y:0,width:10,height:21}
											}
										]
									},
									{name:"track",type:"Container",x:94,y:13,width:10,height:63,
										children:
										[
											{name:"track",type:"Image",x:0,y:0,width:10,height:63,
												normal:{link:"ComboBox.track",x:0,y:0,width:10,height:63}
											}
										]
									},
									{name:"viewport",type:"Image",x:0,y:8,width:91,height:72,
										normal:{link:"ComboBox.viewport",x:0,y:0,width:91,height:72}
									}
								]
							},
							{name:"back",type:"ScaleImage",x:0,y:24,width:110,height:91,top:8,right:8,bottom:8,left:8,
								normal:{link:"ComboBox.neidiban",x:0,y:0,width:110,height:91}
							}
						]
					},
					{name:"background",type:"Image",x:0,y:0,width:200,height:200,
						normal:{link:"ComboBox.background",x:0,y:0,width:200,height:200}
					}
				]
			};
		public static var resource:Array=[{type:"Image", link:"ComboBox.Listanniu1"}, {type:"Image", link:"ComboBox.Listanniu2"}, {type:"Image", link:"ComboBox.Listanniu3"}, {type:"Image", link:"ComboBox.Listanniu4"}, {type:"Image", link:"ComboBox.shurukuang"}, {type:"Image", link:"ComboBox.tipsdianxuanzhong"}, {type:"Image", link:"ComboBox.arrowDownNormal"}, {type:"Image", link:"ComboBox.arrowDownOver"}, {type:"Image", link:"ComboBox.arrowUpNormal"}, {type:"Image", link:"ComboBox.arrowUpOver"}, {type:"ScaleImage", link:"ComboBox.thumbOver", width:10, height:21, top:4, right:4, bottom:4, left:4}, {type:"ScaleImage", link:"ComboBox.thumbNormal", width:10, height:21, top:4, right:4, bottom:4, left:4}, {type:"Image", link:"ComboBox.track"}, {type:"Image", link:"ComboBox.viewport"}, {type:"ScaleImage", link:"ComboBox.neidiban", width:110, height:91, top:8, right:8, bottom:8, left:8}, {type:"Image", link:"ComboBox.background"}];
	}
}