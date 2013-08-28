package game.skin
{
	import RadioButton.background;background;
	import RadioButton.gouxuan1;gouxuan1;
	import RadioButton.gouxuan2;gouxuan2;
	import RadioButton.gouxuan3;gouxuan3;

	/*组件结构大纲
	RadioButton:Container
		jujuesiliao:RadioButton
		background:Image
	*/
	public class RadioButtonSkin
	{
		public static var skin:Object=
			{name:"RadioButton",type:"Container",x:0,y:0,width:200,height:200,
				children:
				[
					{name:"jujuesiliao",type:"RadioButton",x:57,y:88,width:95,height:19,
						children:
						[
							{name:"label",type:"Label",x:19,y:2,width:76,height:17,
								normal:{x:0,y:0,width:76,height:17,content:"<font color='#ffffff'>关闭所有声音</font>",format:{align:"left",bold:false,color:0xffffff,font:"SimSun",italic:false,leading:9,letterSpacing:0,size:12,underline:false}}
							},
							{name:"Image",type:"Image",x:0,y:0,width:21,height:19,
								normal:{link:"RadioButton.gouxuan1",x:0,y:0,width:19,height:19},
								over:{link:"RadioButton.gouxuan2",x:0,y:0,width:19,height:19},
								down:{link:"RadioButton.gouxuan3",x:0,y:0,width:21,height:19}
							}
						]
					},
					{name:"background",type:"Image",x:0,y:0,width:200,height:200,
						normal:{link:"RadioButton.background",x:0,y:0,width:200,height:200}
					}
				]
			};
		public static var resource:Array=[{type:"Image", link:"RadioButton.gouxuan1"}, {type:"Image", link:"RadioButton.gouxuan2"}, {type:"Image", link:"RadioButton.gouxuan3"}, {type:"Image", link:"RadioButton.background"}];
	}
}