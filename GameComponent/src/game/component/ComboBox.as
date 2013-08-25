package game.component
{
	/**
	 * @author Kramer(QQ:21524742)
	 */	
	import flash.display.Stage;
	import flash.events.Event;
	import flash.events.MouseEvent;

	[Event(name="change", type="flash.events.Event")]
	public class ComboBox extends Container
	{
		private var _btn:Button;
		private var _label:Label;
		private var _list:List;
		private var _background:Image;
		private var _listInitY:int;
		private var _scrollBar:ScrollBar;
		
		private var _stage:Stage;
		private var _listItemClass:Class;
		private var _listData:Array;
		private var _data:Object;
		
		public function ComboBox()
		{
			super();
			initialize();
		}
		
		private function initialize():void
		{
			addEventListener(Event.ADDED_TO_STAGE, onAddToStage);
			addEventListener(Event.REMOVED_FROM_STAGE, onRemoveFromStage);
		}
		
		private function onAddToStage(evt:Event):void
		{
			_stage = this.stage;
		}
		
		private function onRemoveFromStage(evt:Event):void
		{
			if(contains(_list) == true)
			{
				hideChildren();
				_stage.removeEventListener(MouseEvent.CLICK, onStageClick);
			}
			_stage = null;
		}
		
		protected override function configChildren():void
		{
			_btn = getChildByName("btn") as Button;
			_label = getChildByName("label") as Label;
			_label.enabled = true;
			_list = getChildByName("list") as List;
			_listInitY = _list.y;
			_background = getChildByName("back") as Image;
			_scrollBar = getChildByName("scrollBar") as ScrollBar;
			if(_scrollBar != null)
			{
				_scrollBar.mode = ScrollBar.MODE_HIDE_BAR;
			}
			hideChildren();
			addChildrenEventListener();
		}
		
		private function addChildrenEventListener():void
		{
			if(_scrollBar != null)
			{
				_scrollBar.addEventListener(MouseEvent.CLICK, onScrollClick);
			}
			_label.addEventListener(MouseEvent.CLICK, onBtnClick);
			_btn.addEventListener(MouseEvent.CLICK, onBtnClick);
			_list.addEventListener(Event.CHANGE, onListChange);
		}
		
		private function onScrollClick(evt:MouseEvent):void
		{
			evt.stopPropagation();
		}
		
		private function onBtnClick(evt:MouseEvent):void
		{
			evt.stopPropagation();
			if(contains(_list) == false)
			{
				showChildren();
				_stage.addEventListener(MouseEvent.CLICK, onStageClick);
			}
			else
			{
				hideChildren();
				_stage.removeEventListener(MouseEvent.CLICK, onStageClick);
			}
		}
		
		private function showChildren():void
		{
			if(_background != null)
			{
				addChild(_background);
			}
			if(_scrollBar != null)
			{
				addChild(_scrollBar);
			}
			_list.y = _listInitY;
			addChild(_list);
			if(_scrollBar != null)
			{
				_scrollBar.target = _list;
			}
		}
		
		private function hideChildren():void
		{
			removeChild(_list);
			if(_scrollBar != null)
			{
				removeChild(_scrollBar);
			}
			if(_background != null)
			{
				removeChild(_background);
			}
		}
		
		private function onListChange(evt:Event):void
		{
			var item:ComboBoxListItemBase = _list.selection as ComboBoxListItemBase;
			this.data = item.data;
			this.text = item.label;
			dispatchEvent(Component.EVENT_CHANGE);
		}
		
		private function onStageClick(evt:MouseEvent):void
		{
			hideChildren();
			_stage.removeEventListener(MouseEvent.CLICK, onStageClick);
		}
		
		public function setListItemClass(clz:Class):void
		{
			_listItemClass = clz;
		}
		
		public function setListData(arr:Array):void
		{
			_list.removeAllItem();
			_listData = arr;
			var len:int = _listData.length;
			for(var i:int = 0; i < len; i++)
			{
				var item:ListItemBase = new _listItemClass() as ComboBoxListItemBase;
				_list.addChild(item);
				var data:Object = _listData[i];
				item.data = data;
			}
		}
		
		public function set data(value:Object):void
		{
			_data = value;
		}
		
		public function get data():Object
		{
			return _data;
		}
		
		public function set text(value:String):void
		{
			_label.text = value;
		}
		
		public function get text():String
		{
			return _label.text;
		}
		
		public override function set enabled(value:Boolean):void
		{
			super.enabled = value;
			_btn.enabled = value;
			_label.enabled = value;
		}
	}
}