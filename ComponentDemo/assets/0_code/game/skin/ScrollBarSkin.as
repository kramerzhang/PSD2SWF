package game.skin
{
	import ScrollBar.background;background;
	import ScrollBar.viewport;viewport;
	import ScrollBar.gundongdiban;gundongdiban;
	import ScrollBar.shang2;shang2;
	import ScrollBar.shang1;shang1;
	import ScrollBar.xia2;xia2;
	import ScrollBar.xia1;xia1;
	import ScrollBar.huatiao;huatiao;
	import ScrollBar.huatiao1;huatiao1;

	/*组件结构大纲
	ScrollBar:Container
		gundongtiao:ScrollBar
		background:Image
	*/
	public class ScrollBarSkin
	{
		public static var skin:Object=
			{name:"ScrollBar",type:"Container",x:0,y:0,width:236,height:185,
				children:
				[
					{name:"gundongtiao",type:"ScrollBar",x:14,y:14,width:191,height:160,
						children:
						[
							{name:"thumb",type:"Button",x:178,y:70,width:11,height:36,
								children:
								[
									{name:"thumb",type:"ScaleImage",x:0,y:0,width:11,height:36,top:15,right:2,bottom:15,left:2,
										normal:{link:"ScrollBar.huatiao",x:0,y:0,width:11,height:36},
										over:{link:"ScrollBar.huatiao1",x:0,y:0,width:11,height:36}
									}
								]
							},
							{name:"arrowDown",type:"Button",x:176,y:145,width:15,height:15,
								children:
								[
									{name:"Image",type:"Image",x:0,y:0,width:15,height:15,
										normal:{link:"ScrollBar.xia2",x:0,y:0,width:15,height:15},
										over:{link:"ScrollBar.xia1",x:0,y:0,width:15,height:15}
									}
								]
							},
							{name:"arrowUp",type:"Button",x:176,y:0,width:15,height:15,
								children:
								[
									{name:"Image",type:"Image",x:0,y:0,width:15,height:15,
										normal:{link:"ScrollBar.shang2",x:0,y:0,width:15,height:15},
										over:{link:"ScrollBar.shang1",x:0,y:0,width:15,height:15}
									}
								]
							},
							{name:"track",type:"Container",x:178,y:15,width:11,height:130,
								children:
								[
									{name:"gundongdiban",type:"Image",x:0,y:0,width:11,height:130,
										normal:{link:"ScrollBar.gundongdiban",x:0,y:0,width:11,height:130}
									}
								]
							},
							{name:"viewport",type:"Image",x:0,y:14,width:175,height:128,
								normal:{link:"ScrollBar.viewport",x:0,y:0,width:175,height:128}
							}
						]
					},
					{name:"background",type:"Image",x:0,y:0,width:236,height:185,
						normal:{link:"ScrollBar.background",x:0,y:0,width:236,height:185}
					}
				]
			};
		public static var resource:Array=[{type:"ScaleImage", link:"ScrollBar.huatiao", width:11, height:36, top:15, right:2, bottom:15, left:2}, {type:"ScaleImage", link:"ScrollBar.huatiao1", width:11, height:36, top:15, right:2, bottom:15, left:2}, {type:"Image", link:"ScrollBar.xia2"}, {type:"Image", link:"ScrollBar.xia1"}, {type:"Image", link:"ScrollBar.shang2"}, {type:"Image", link:"ScrollBar.shang1"}, {type:"Image", link:"ScrollBar.gundongdiban"}, {type:"Image", link:"ScrollBar.viewport"}, {type:"Image", link:"ScrollBar.background"}];
	}
}