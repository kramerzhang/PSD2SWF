package game.skin
{
	import Slider.background;background;
	import Slider.yinliangditu;yinliangditu;
	import Slider.track;track;
	import Slider.yinliangtiaojieniu1;yinliangtiaojieniu1;
	import Slider.yinliangtiaojieniu2;yinliangtiaojieniu2;

	/*组件结构大纲
	Slider:Container
		yinxiao:Slider
		background:Image
	*/
	public class SliderSkin
	{
		public static var skin:Object=
			{name:"Slider",type:"Container",x:0,y:0,width:200,height:200,
				children:
				[
					{name:"yinxiao",type:"Slider",x:43,y:84,width:104,height:17,
						children:
						[
							{name:"label",type:"Label",x:0,y:0,width:28,height:17,
								normal:{x:0,y:0,width:28,height:17,content:"<font color='#ffffff'>音效</font>",format:{align:"left",bold:false,color:0xffffff,font:"SimSun",italic:false,leading:9,letterSpacing:0,size:12,underline:false}}
							},
							{name:"btn",type:"Button",x:91,y:1,width:13,height:13,
								children:
								[
									{name:"Image",type:"Image",x:0,y:0,width:13,height:13,
										normal:{link:"Slider.yinliangtiaojieniu1",x:0,y:0,width:13,height:13},
										over:{link:"Slider.yinliangtiaojieniu2",x:0,y:0,width:13,height:13}
									}
								]
							},
							{name:"track",type:"Image",x:31,y:6,width:71,height:3,
								normal:{link:"Slider.track",x:0,y:0,width:71,height:3}
							},
							{name:"yinliangditu",type:"Image",x:30,y:5,width:73,height:6,
								normal:{link:"Slider.yinliangditu",x:0,y:0,width:73,height:6}
							}
						]
					},
					{name:"background",type:"Image",x:0,y:0,width:200,height:200,
						normal:{link:"Slider.background",x:0,y:0,width:200,height:200}
					}
				]
			};
		public static var resource:Array=[{type:"Image", link:"Slider.yinliangtiaojieniu1"}, {type:"Image", link:"Slider.yinliangtiaojieniu2"}, {type:"Image", link:"Slider.track"}, {type:"Image", link:"Slider.yinliangditu"}, {type:"Image", link:"Slider.background"}];
	}
}