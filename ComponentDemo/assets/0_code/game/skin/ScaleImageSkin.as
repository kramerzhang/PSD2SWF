package game.skin
{
	import ScaleImage.diban;diban;

	/*组件结构大纲
	ScaleImage:Container
		diban:ScaleImage
	*/
	public class ScaleImageSkin
	{
		public static var skin:Object=
			{name:"ScaleImage",type:"Container",x:0,y:0,width:270,height:429,
				children:
				[
					{name:"diban",type:"ScaleImage",x:0,y:0,width:270,height:429,top:40,right:15,bottom:15,left:15,
						normal:{link:"ScaleImage.diban",x:0,y:0,width:270,height:429}
					}
				]
			};
		public static var resource:Array=[{type:"ScaleImage", link:"ScaleImage.diban", width:270, height:429, top:40, right:15, bottom:15, left:15}];
	}
}