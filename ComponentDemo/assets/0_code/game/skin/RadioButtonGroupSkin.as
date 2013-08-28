package game.skin
{
	import RadioButtonGroup.background;background;
	import RadioButtonGroup.biaoqian1;biaoqian1;
	import RadioButtonGroup.biaoqian2;biaoqian2;
	import RadioButtonGroup.biaoqian3;biaoqian3;
	import RadioButtonGroup.biaoqian4;biaoqian4;

	/*组件结构大纲
	RadioButtonGroup:Container
		tabs:RadioButtonGroup
		background:Image
	*/
	public class RadioButtonGroupSkin
	{
		public static var skin:Object=
			{name:"RadioButtonGroup",type:"Container",x:0,y:0,width:300,height:200,
				children:
				[
					{name:"tabs",type:"RadioButtonGroup",x:20,y:66,width:243,height:22,
						children:
						[
							{name:"other",type:"RadioButton",x:192,y:0,width:51,height:22,
								children:
								[
									{name:"other",type:"Label",x:12,y:5,width:33,height:17,
										normal:{x:0,y:0,width:33,height:17,content:"<font color='#ffffff'>其他</font>",format:{align:"left",bold:false,color:0xffffff,font:"SimSun",italic:false,leading:0,letterSpacing:1.6,size:12,underline:false}}
									},
									{name:"ScaleImage",type:"ScaleImage",x:0,y:0,width:51,height:21,top:4,right:4,bottom:4,left:4,
										normal:{link:"RadioButtonGroup.biaoqian1",x:0,y:0,width:51,height:21},
										over:{link:"RadioButtonGroup.biaoqian2",x:0,y:0,width:51,height:21},
										down:{link:"RadioButtonGroup.biaoqian3",x:0,y:0,width:51,height:21},
										disable:{link:"RadioButtonGroup.biaoqian4",x:0,y:0,width:51,height:21}
									}
								]
							},
							{name:"gem",type:"RadioButton",x:144,y:0,width:51,height:22,
								children:
								[
									{name:"gem",type:"Label",x:12,y:5,width:31,height:17,
										normal:{x:0,y:0,width:31,height:17,content:"<font color='#ffffff'>宝石</font>",format:{align:"left",bold:false,color:0xffffff,font:"SimSun",italic:false,leading:5.5,letterSpacing:0.6,size:12,underline:false}}
									},
									{name:"ScaleImage",type:"ScaleImage",x:0,y:0,width:51,height:21,top:4,right:4,bottom:4,left:4,
										normal:{link:"RadioButtonGroup.biaoqian1",x:0,y:0,width:51,height:21},
										over:{link:"RadioButtonGroup.biaoqian2",x:0,y:0,width:51,height:21},
										down:{link:"RadioButtonGroup.biaoqian3",x:0,y:0,width:51,height:21},
										disable:{link:"RadioButtonGroup.biaoqian4",x:0,y:0,width:51,height:21}
									}
								]
							},
							{name:"drug",type:"RadioButton",x:96,y:0,width:51,height:22,
								children:
								[
									{name:"drug",type:"Label",x:13,y:5,width:31,height:17,
										normal:{x:0,y:0,width:31,height:17,content:"<font color='#ffffff'>药品</font>",format:{align:"left",bold:false,color:0xffffff,font:"SimSun",italic:false,leading:5.5,letterSpacing:0.8,size:12,underline:false}}
									},
									{name:"ScaleImage",type:"ScaleImage",x:0,y:0,width:51,height:21,top:4,right:4,bottom:4,left:4,
										normal:{link:"RadioButtonGroup.biaoqian1",x:0,y:0,width:51,height:21},
										over:{link:"RadioButtonGroup.biaoqian2",x:0,y:0,width:51,height:21},
										down:{link:"RadioButtonGroup.biaoqian3",x:0,y:0,width:51,height:21},
										disable:{link:"RadioButtonGroup.biaoqian4",x:0,y:0,width:51,height:21}
									}
								]
							},
							{name:"equip",type:"RadioButton",x:48,y:0,width:51,height:22,
								children:
								[
									{name:"equip",type:"Label",x:13,y:5,width:31,height:17,
										normal:{x:0,y:0,width:31,height:17,content:"<font color='#ffffff'>装备</font>",format:{align:"left",bold:false,color:0xffffff,font:"SimSun",italic:false,leading:5.5,letterSpacing:0.8,size:12,underline:false}}
									},
									{name:"ScaleImage",type:"ScaleImage",x:0,y:0,width:51,height:21,top:4,right:4,bottom:4,left:4,
										normal:{link:"RadioButtonGroup.biaoqian1",x:0,y:0,width:51,height:21},
										over:{link:"RadioButtonGroup.biaoqian2",x:0,y:0,width:51,height:21},
										down:{link:"RadioButtonGroup.biaoqian3",x:0,y:0,width:51,height:21},
										disable:{link:"RadioButtonGroup.biaoqian4",x:0,y:0,width:51,height:21}
									}
								]
							},
							{name:"all",type:"RadioButton",x:0,y:0,width:51,height:22,
								children:
								[
									{name:"all",type:"Label",x:12,y:5,width:28,height:17,
										normal:{x:0,y:0,width:28,height:17,content:"<font color='#ffffff'>全部</font>",format:{align:"left",bold:false,color:0xffffff,font:"SimSun",italic:false,leading:0,letterSpacing:0,size:12,underline:false}}
									},
									{name:"ScaleImage",type:"ScaleImage",x:0,y:0,width:51,height:21,top:4,right:4,bottom:4,left:4,
										normal:{link:"RadioButtonGroup.biaoqian1",x:0,y:0,width:51,height:21},
										over:{link:"RadioButtonGroup.biaoqian2",x:0,y:0,width:51,height:21},
										down:{link:"RadioButtonGroup.biaoqian3",x:0,y:0,width:51,height:21},
										disable:{link:"RadioButtonGroup.biaoqian4",x:0,y:0,width:51,height:21}
									}
								]
							}
						]
					},
					{name:"background",type:"Image",x:0,y:0,width:300,height:200,
						normal:{link:"RadioButtonGroup.background",x:0,y:0,width:300,height:200}
					}
				]
			};
		public static var resource:Array=[{type:"ScaleImage", link:"RadioButtonGroup.biaoqian1", width:51, height:21, top:4, right:4, bottom:4, left:4}, {type:"ScaleImage", link:"RadioButtonGroup.biaoqian2", width:51, height:21, top:4, right:4, bottom:4, left:4}, {type:"ScaleImage", link:"RadioButtonGroup.biaoqian3", width:51, height:21, top:4, right:4, bottom:4, left:4}, {type:"ScaleImage", link:"RadioButtonGroup.biaoqian4", width:51, height:21, top:4, right:4, bottom:4, left:4}, {type:"ScaleImage", link:"RadioButtonGroup.biaoqian1", width:51, height:21, top:4, right:4, bottom:4, left:4}, {type:"ScaleImage", link:"RadioButtonGroup.biaoqian2", width:51, height:21, top:4, right:4, bottom:4, left:4}, {type:"ScaleImage", link:"RadioButtonGroup.biaoqian3", width:51, height:21, top:4, right:4, bottom:4, left:4}, {type:"ScaleImage", link:"RadioButtonGroup.biaoqian4", width:51, height:21, top:4, right:4, bottom:4, left:4}, {type:"ScaleImage", link:"RadioButtonGroup.biaoqian1", width:51, height:21, top:4, right:4, bottom:4, left:4}, {type:"ScaleImage", link:"RadioButtonGroup.biaoqian2", width:51, height:21, top:4, right:4, bottom:4, left:4}, {type:"ScaleImage", link:"RadioButtonGroup.biaoqian3", width:51, height:21, top:4, right:4, bottom:4, left:4}, {type:"ScaleImage", link:"RadioButtonGroup.biaoqian4", width:51, height:21, top:4, right:4, bottom:4, left:4}, {type:"ScaleImage", link:"RadioButtonGroup.biaoqian1", width:51, height:21, top:4, right:4, bottom:4, left:4}, {type:"ScaleImage", link:"RadioButtonGroup.biaoqian2", width:51, height:21, top:4, right:4, bottom:4, left:4}, {type:"ScaleImage", link:"RadioButtonGroup.biaoqian3", width:51, height:21, top:4, right:4, bottom:4, left:4}, {type:"ScaleImage", link:"RadioButtonGroup.biaoqian4", width:51, height:21, top:4, right:4, bottom:4, left:4}, {type:"ScaleImage", link:"RadioButtonGroup.biaoqian1", width:51, height:21, top:4, right:4, bottom:4, left:4}, {type:"ScaleImage", link:"RadioButtonGroup.biaoqian2", width:51, height:21, top:4, right:4, bottom:4, left:4}, {type:"ScaleImage", link:"RadioButtonGroup.biaoqian3", width:51, height:21, top:4, right:4, bottom:4, left:4}, {type:"ScaleImage", link:"RadioButtonGroup.biaoqian4", width:51, height:21, top:4, right:4, bottom:4, left:4}, {type:"Image", link:"RadioButtonGroup.background"}];
	}
}