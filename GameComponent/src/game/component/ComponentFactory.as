package game.component
{
	/**
	 * @author Kramer(QQ:21524742)
	 */	
	import flash.system.Capabilities;
	import flash.utils.Dictionary;
	
	import game.component.core.ISkinnable;

	public class ComponentFactory
	{
		private static var _classMap:Dictionary;
		
		public function ComponentFactory()
		{
		}
		
		initialize();
		
		private static function initialize():void
		{
			_classMap = new Dictionary();
		}
		
		public static function registerComponentClass(name:String, clz:Class):void
		{
			if(_classMap[name] == null)
			{
				_classMap[name] = clz;
			}
			else
			{
				if(Capabilities.isDebugger == true)
				{
					throw new Error("组件名为 " + name + " 对应的类已经存在");
				}
			}
		}
		
		public static function unregisterComponentClass(name:String):void
		{
			delete _classMap[name];
		}
		
		public static function createComponentByName(name:String):ISkinnable
		{
			if(_classMap[name] != null)
			{
				return new (_classMap[name] as Class) as ISkinnable;
			}
			return null;
		}
		
		public static function createComponentByType(type:String):ISkinnable
		{
			var child:ISkinnable;
			switch(type)
			{
				case "Image":
					child = new Image();
					break;
				case "Button":
					child = new Button();
					break;
				case "LabelButton":
					child = new LabelButton();
					break;
				case "ScaleImage":
					child = new ScaleImage();
					break;
				case "Container":
					child = new Container();
					break;
				case "List":
					child = new List();
					break;
				case "Label":
					child = new Label();
					break;
				case "RadioButtonGroup":
					child = new RadioButtonGroup();
					break;
				case "RadioButton":
					child = new RadioButton();
					break;
				case "ScrollBar":
					child = new ScrollBar();
					break;
				case "DragBar":
					child = new DragBar();
					break;
				case "Slider":
					child = new Slider();
					break;
				case "ComboBox":
					child = new ComboBox();
					break
				case "Stepper":
					child = new Stepper();
					break;
				default:
					throw new Error("未找到类型 " + type + " 对应的类");
			}
			return child;
		}
	}
}