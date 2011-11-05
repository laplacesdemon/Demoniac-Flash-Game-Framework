package com.demoniac.state
{
	import com.demoniac.FrameworkStates;
	import com.demoniac.GameFramework;
	
	import flash.events.Event;
	
	public class WaitForCloseState extends State
	{
		public function WaitForCloseState(framework:GameFramework)
		{
			super(framework);
			this._id = FrameworkStates.STATE_SYSTEM_WAIT_FOR_CLOSE;
		}
		
		override public function handle():void {
			// @do nothing
		}
		
		
	}
}