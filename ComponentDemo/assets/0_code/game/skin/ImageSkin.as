package game.skin
{
	import Image.huawen2;huawen2;

	/*组件结构大纲
	Image:Container
		huawen2:Image
	*/
	public class ImageSkin
	{
		public static var skin:Object=
			{name:"Image",type:"Container",x:0,y:0,width:46,height:33,
				children:
				[
					{name:"huawen2",type:"Image",x:0,y:0,width:46,height:33,
						normal:{link:"Image.huawen2",x:0,y:0,width:46,height:33}
					}
				]
			};
		public static var resource:Array=[{type:"Image", link:"Image.huawen2"}];
	}
}