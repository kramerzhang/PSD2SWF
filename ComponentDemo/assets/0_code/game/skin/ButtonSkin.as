package game.skin
{
	import Button.background;background;
	import Button.close1;close1;
	import Button.close2;close2;
	import Button.close3;close3;
	import Button.anniu1;anniu1;
	import Button.anniu2;anniu2;
	import Button.anniu3;anniu3;
	import Button.anniu4;anniu4;

	/*组件结构大纲
	Button:Container
		sort:Button
		close:Button
		background:Image
	*/
	public class ButtonSkin
	{
		public static var skin:Object=
			{name:"Button",type:"Container",x:0,y:0,width:200,height:200,
				children:
				[
					{name:"sort",type:"Button",x:13,y:85,width:60,height:22,
						children:
						[
							{name:"Label",type:"Label",x:13,y:3,width:40,height:18,
								normal:{x:0,y:0,width:40,height:17,content:"<font color='#ffffff'>整  理</font>",format:{align:"left",bold:false,color:0xffffff,font:"SimSun",italic:false,leading:0,letterSpacing:0,size:12,underline:false}},
								over:{x:0,y:0,width:40,height:17,content:"<font color='#f4fd00'>整  理</font>",format:{align:"left",bold:false,color:0xf4fd00,font:"SimSun",italic:false,leading:0,letterSpacing:0,size:12,underline:false}},
								down:{x:0,y:0,width:40,height:17,content:"<font color='#fe0000'>整  理</font>",format:{align:"left",bold:false,color:0xfe0000,font:"SimSun",italic:false,leading:0,letterSpacing:0,size:12,underline:false}}
							},
							{name:"ScaleImage",type:"ScaleImage",x:0,y:0,width:60,height:22,top:4,right:4,bottom:4,left:4,
								normal:{link:"Button.anniu1",x:0,y:0,width:60,height:22},
								over:{link:"Button.anniu2",x:0,y:0,width:60,height:22},
								down:{link:"Button.anniu3",x:0,y:0,width:60,height:22},
								disable:{link:"Button.anniu4",x:0,y:0,width:60,height:22}
							}
						]
					},
					{name:"close",type:"Button",x:13,y:40,width:29,height:28,
						children:
						[
							{name:"Image",type:"Image",x:0,y:0,width:29,height:28,
								normal:{link:"Button.close1",x:0,y:0,width:29,height:28},
								over:{link:"Button.close2",x:0,y:0,width:29,height:28},
								down:{link:"Button.close3",x:0,y:0,width:29,height:28}
							}
						]
					},
					{name:"background",type:"Image",x:0,y:0,width:200,height:200,
						normal:{link:"Button.background",x:0,y:0,width:200,height:200}
					}
				]
			};
		public static var resource:Array=[{type:"ScaleImage", link:"Button.anniu1", width:60, height:22, top:4, right:4, bottom:4, left:4}, {type:"ScaleImage", link:"Button.anniu2", width:60, height:22, top:4, right:4, bottom:4, left:4}, {type:"ScaleImage", link:"Button.anniu3", width:60, height:22, top:4, right:4, bottom:4, left:4}, {type:"ScaleImage", link:"Button.anniu4", width:60, height:22, top:4, right:4, bottom:4, left:4}, {type:"Image", link:"Button.close1"}, {type:"Image", link:"Button.close2"}, {type:"Image", link:"Button.close3"}, {type:"Image", link:"Button.background"}];
	}
}