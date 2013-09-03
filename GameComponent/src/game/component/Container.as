package game.component
{
	/**
	 * @author Kramer(QQ:21524742)
	 */	
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.system.Capabilities;

	public class Container extends Component
	{
		public function Container()
		{
			super();
		}
		
		/**
		 * 获取容器中任意级别的子元素，如btn/myImage，表示获取当前
		 * 容器中名为btn的组件中的名为myImage的图片组件。
		 * @param nameChain
		 * @return 
		 * 
		 */		
		public function getDescendant(nameChain:String):DisplayObject
		{
			var nameList:Array = nameChain.split("/");
			var currentContainer:DisplayObjectContainer = this;
			var currentName:String;
			var currentObj:DisplayObject;
			while(nameList.length > 0)
			{
				currentName = nameList.shift();
				currentObj = currentContainer.getChildByName(currentName);
				if(currentObj == null)
				{
					handleError("显示对象 " + currentName + " 不存在!");
					return null;
				}
				if(nameList.length > 0)
				{
					currentContainer = currentObj as DisplayObjectContainer;
					if(currentContainer == null)
					{
						handleError("显示对象 " + currentName + " 不是容器");
						return null;
					}
				}
			}
			return currentObj;
		}
		
		private function handleError(message:String):void
		{
			if(Capabilities.isDebugger == true)
			{
				throw new Error(message);
			}
		}
		
		public function getChildButton(name:String):Button
		{
			return getChildByName(name) as Button;
		}
		
		public function getChildLabelButton(name:String):LabelButton
		{
			return getChildByName(name) as LabelButton;
		}
		
		public function getChildRadioButton(name:String):RadioButton
		{
			return getChildByName(name) as RadioButton;
		}
		
		public function getChildRadioButtonGroup(name:String):RadioButtonGroup
		{
			return getChildByName(name) as RadioButtonGroup;
		}
		
		public function getChildImage(name:String):Image
		{
			return getChildByName(name) as Image;
		}
		
		public function getChildScaleImage(name:String):ScaleImage
		{
			return getChildByName(name) as ScaleImage;
		}
		
		public function getChildLabel(name:String):Label
		{
			return getChildByName(name) as Label;
		}
		
		public function getChildContainer(name:String):Container
		{
			return getChildByName(name) as Container;
		}
		
		public function getChildScrollBar(name:String):ScrollBar
		{
			return getChildByName(name) as ScrollBar;
		}
		
		public function getChildList(name:String):List
		{
			return getChildByName(name) as List;
		}
		
		public function getChildStepper(name:String):Stepper
		{
			return getChildByName(name) as Stepper;
		}
		
		public function getChildSlider(name:String):Slider
		{
			return getChildByName(name) as Slider;
		}
		
	}
}