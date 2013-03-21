package game.skin
{
	import ResourcePackPanel.background;background;
	import ResourcePackPanel.anniu0;anniu0;
	import ResourcePackPanel.anniu1;anniu1;
	import ResourcePackPanel.anniu2;anniu2;

	/*
	ResourcePackPanel:Container
		single:Button
		batch:Button
		share:Button
		background:Image
	*/
	public class ResourcePackPanelSkin
	{
		public static var skin:Object=
			{name:"ResourcePackPanel",type:"Container",x:0,y:0,width:150,height:95,
				children:
				[
					{name:"single",type:"Button",x:5,y:9,width:139,height:22,
						children:
						[
							{name:"yuanchengc",type:"Label",x:18,y:3,width:100,height:17,
								normal:{x:0,y:0,width:100,height:17,content:"<font color='#ffffff'>单一面板资源打包</font>",format:{align:"left",bold:false,color:0xffffff,font:"SimSun",italic:false,leading:0,letterSpacing:0,size:12,underline:false}}
							},
							{name:"myScaleImage",type:"ScaleImage",x:0,y:0,width:139,height:22,top:4,right:4,bottom:4,left:4,
								normal:{link:"ResourcePackPanel.anniu0",x:0,y:0,width:139,height:22},
								over:{link:"ResourcePackPanel.anniu1",x:0,y:0,width:139,height:22},
								down:{link:"ResourcePackPanel.anniu2",x:0,y:0,width:139,height:22}
							}
						]
					},
					{name:"batch",type:"Button",x:5,y:37,width:139,height:22,
						children:
						[
							{name:"yuanchengc",type:"Label",x:18,y:3,width:100,height:17,
								normal:{x:0,y:0,width:100,height:17,content:"<font color='#ffffff'>批量面板资源打包</font>",format:{align:"left",bold:false,color:0xffffff,font:"SimSun",italic:false,leading:0,letterSpacing:0,size:12,underline:false}}
							},
							{name:"myScaleImage",type:"ScaleImage",x:0,y:0,width:139,height:22,top:4,right:4,bottom:4,left:4,
								normal:{link:"ResourcePackPanel.anniu0",x:0,y:0,width:139,height:22},
								over:{link:"ResourcePackPanel.anniu1",x:0,y:0,width:139,height:22},
								down:{link:"ResourcePackPanel.anniu2",x:0,y:0,width:139,height:22}
							}
						]
					},
					{name:"share",type:"Button",x:5,y:64,width:139,height:22,
						children:
						[
							{name:"yuanchengc",type:"Label",x:18,y:3,width:100,height:17,
								normal:{x:0,y:0,width:100,height:17,content:"<font color='#ffffff'>面板公共资源提取</font>",format:{align:"left",bold:false,color:0xffffff,font:"SimSun",italic:false,leading:0,letterSpacing:0,size:12,underline:false}}
							},
							{name:"myScaleImage",type:"ScaleImage",x:0,y:0,width:139,height:22,top:4,right:4,bottom:4,left:4,
								normal:{link:"ResourcePackPanel.anniu0",x:0,y:0,width:139,height:22},
								over:{link:"ResourcePackPanel.anniu1",x:0,y:0,width:139,height:22},
								down:{link:"ResourcePackPanel.anniu2",x:0,y:0,width:139,height:22}
							}
						]
					},
					{name:"background",type:"Image",x:0,y:0,width:150,height:95,
						normal:{link:"ResourcePackPanel.background",x:0,y:0,width:150,height:95}
					}
				]
			};
	}
}