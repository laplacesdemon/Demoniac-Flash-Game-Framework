package com.demoniac.state
{
	import com.demoniac.GameFramework;
	
	import flash.events.EventDispatcher;

	public class State extends EventDispatcher implements IState
	{
		protected var _id:String;
		protected var framework:GameFramework;
		
		public function State(framework:GameFramework) {
			this.framework = framework;
		}
		
		public function get id():String
		{
			return _id;
		}

		public function handle():void
		{
			throw new Error("Abstract method should be overridden!");
		}
	}
}