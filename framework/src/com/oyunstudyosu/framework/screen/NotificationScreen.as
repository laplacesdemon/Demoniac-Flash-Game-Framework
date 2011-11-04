package com.oyunstudyosu.framework.screen
{
	
	import com.oyunstudyosu.framework.event.CustomEventWithId;
	import com.oyunstudyosu.framework.screen.element.SimpleButton;
	
	import flash.events.MouseEvent;
	import flash.geom.Point;
	import flash.text.TextField;
	import flash.text.TextFormat;
	
	public class NotificationScreen extends BasicScreen
	{
		private var okButton:SimpleButton = null;
		
		private var displayText:TextField = new TextField();
		//private var okButton:SimpleBlitButton;
		
		public function NotificationScreen(id:String,width:Number, height:Number, isTransparent:Boolean, color:uint) {
			super(id, width, height, isTransparent, color);
		}
		
		public function createDisplayText(text:String, width:Number, location:Point, textFormat:TextFormat):void {
			displayText.y = location.y;
			displayText.x = location.x;
			displayText.width = width;
			displayText.defaultTextFormat=textFormat;
			displayText.text = text;
			addChild(displayText);
		}
		
		
		public function createOkButton(text:String,location:Point, width:Number, height:Number, textFormat:TextFormat, offColor:uint=0x000000, overColor:uint=0xff0000, positionOffset:Number=0):void 
		{
			okButton = new SimpleButton(location.x, location.y, width, height, text, 0xffffff, 0xff0000, textFormat, positionOffset);
			addChild(okButton);
			okButton.addEventListener(MouseEvent.MOUSE_OVER, okButtonOverListener, false, 0, true);
			okButton.addEventListener(MouseEvent.MOUSE_OUT, okButtonOffListener, false, 0, true);
			okButton.addEventListener(MouseEvent.CLICK, okButtonClickListener, false, 0, true);
		}
		
		public function setOkButton(button:SimpleButton):void {
			okButton = button;
			addChild(okButton);
			okButton.addEventListener(MouseEvent.MOUSE_OVER, okButtonOverListener, false, 0, true);
			okButton.addEventListener(MouseEvent.MOUSE_OUT, okButtonOffListener, false, 0, true);
			okButton.addEventListener(MouseEvent.CLICK, okButtonClickListener, false, 0, true);
		}
		
		public function setDisplayText(text:String):void {
			displayText.text = text;
		}
		
		//Listener functions 
		/**
		 * okButtonClicked fires off a custom event and sends the "id" to the listener. 
		 **/
		private function okButtonClickListener(e:MouseEvent):void {
			dispatchEvent(new CustomEventWithId(CustomEventWithId.BUTTON_ID,id));
		}
		
		private function okButtonOverListener(e:MouseEvent):void {
			okButton.changeBackGroundColor(SimpleButton.OVER);
		}
		
		private function okButtonOffListener(e:MouseEvent):void {
			okButton.changeBackGroundColor(SimpleButton.OFF);
		}
		
	}
}

