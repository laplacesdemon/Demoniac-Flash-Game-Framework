package com.demoniac.event
{
	import flash.events.Event;
	
	public class CustomEventWithId extends Event
	{
		
		public static const BUTTON_ID:String = "buttonid";
		public var id:String;
		
		public function CustomEventWithId(type:String,id:String, bubbles:Boolean=false,cancelable:Boolean=false)
		{
			super(type, bubbles,cancelable);
			this.id = id;
		}
		
		
		public override function clone():Event {
			return new CustomEventWithId(type,id, bubbles,cancelable)
		}
		
		
	}
	
}