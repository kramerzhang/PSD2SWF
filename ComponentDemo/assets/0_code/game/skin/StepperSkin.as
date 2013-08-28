package game.skin
{
	import Stepper.background;background;
	import Stepper.shurukuangdiban;shurukuangdiban;
	import Stepper.xiayiye1;xiayiye1;
	import Stepper.xiayiye2;xiayiye2;
	import Stepper.xiayiye3;xiayiye3;
	import Stepper.shangyiye1;shangyiye1;
	import Stepper.shangyiye2;shangyiye2;
	import Stepper.shangyiye3;shangyiye3;
	import Stepper.weiye1;weiye1;
	import Stepper.weiye2;weiye2;
	import Stepper.weiye3;weiye3;
	import Stepper.shouye1;shouye1;
	import Stepper.shouye2;shouye2;
	import Stepper.shouye3;shouye3;

	/*组件结构大纲
	Stepper:Container
		page:Stepper
		background:Image
	*/
	public class StepperSkin
	{
		public static var skin:Object=
			{name:"Stepper",type:"Container",x:0,y:0,width:200,height:200,
				children:
				[
					{name:"page",type:"Stepper",x:21,y:81,width:157,height:24,
						children:
						[
							{name:"txt",type:"Label",x:59,y:3,width:40,height:17,
								normal:{x:0,y:0,width:40,height:17,content:"<font color='#ffffff'>10/20</font>",format:{align:"left",bold:false,color:0xffffff,font:"SimSun",italic:false,leading:0,letterSpacing:0.8,size:12,underline:false}}
							},
							{name:"firstBtn",type:"Button",x:0,y:1,width:24,height:23,
								children:
								[
									{name:"Image",type:"Image",x:0,y:0,width:24,height:23,
										normal:{link:"Stepper.shouye1",x:0,y:0,width:24,height:23},
										over:{link:"Stepper.shouye2",x:0,y:0,width:24,height:23},
										disable:{link:"Stepper.shouye3",x:0,y:0,width:24,height:23}
									}
								]
							},
							{name:"lastBtn",type:"Button",x:133,y:1,width:24,height:23,
								children:
								[
									{name:"Image",type:"Image",x:0,y:0,width:24,height:23,
										normal:{link:"Stepper.weiye1",x:0,y:0,width:24,height:23},
										over:{link:"Stepper.weiye2",x:0,y:0,width:24,height:23},
										disable:{link:"Stepper.weiye3",x:0,y:0,width:24,height:23}
									}
								]
							},
							{name:"prevBtn",type:"Button",x:24,y:1,width:24,height:23,
								children:
								[
									{name:"Image",type:"Image",x:0,y:0,width:24,height:23,
										normal:{link:"Stepper.shangyiye1",x:0,y:0,width:24,height:23},
										over:{link:"Stepper.shangyiye2",x:0,y:0,width:24,height:23},
										disable:{link:"Stepper.shangyiye3",x:0,y:0,width:24,height:23}
									}
								]
							},
							{name:"nextBtn",type:"Button",x:109,y:1,width:24,height:23,
								children:
								[
									{name:"Image",type:"Image",x:0,y:0,width:24,height:23,
										normal:{link:"Stepper.xiayiye1",x:0,y:0,width:24,height:23},
										over:{link:"Stepper.xiayiye2",x:0,y:0,width:24,height:23},
										disable:{link:"Stepper.xiayiye3",x:0,y:0,width:24,height:23}
									}
								]
							},
							{name:"shurukuangdiban",type:"ScaleImage",x:49,y:0,width:59,height:24,top:6,right:6,bottom:6,left:6,
								normal:{link:"Stepper.shurukuangdiban",x:0,y:0,width:59,height:24}
							}
						]
					},
					{name:"background",type:"Image",x:0,y:0,width:200,height:200,
						normal:{link:"Stepper.background",x:0,y:0,width:200,height:200}
					}
				]
			};
		public static var resource:Array=[{type:"Image", link:"Stepper.shouye1"}, {type:"Image", link:"Stepper.shouye2"}, {type:"Image", link:"Stepper.shouye3"}, {type:"Image", link:"Stepper.weiye1"}, {type:"Image", link:"Stepper.weiye2"}, {type:"Image", link:"Stepper.weiye3"}, {type:"Image", link:"Stepper.shangyiye1"}, {type:"Image", link:"Stepper.shangyiye2"}, {type:"Image", link:"Stepper.shangyiye3"}, {type:"Image", link:"Stepper.xiayiye1"}, {type:"Image", link:"Stepper.xiayiye2"}, {type:"Image", link:"Stepper.xiayiye3"}, {type:"ScaleImage", link:"Stepper.shurukuangdiban", width:59, height:24, top:6, right:6, bottom:6, left:6}, {type:"Image", link:"Stepper.background"}];
	}
}