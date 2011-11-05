package com.demoniac.state
{
	import com.demoniac.FrameworkStates;
	import com.demoniac.GameFramework;
	
	import flash.events.Event;
	
	public class WaitState extends State
	{
		public function WaitState(framework:GameFramework)
		{
			super(framework);
			this._id = FrameworkStates.STATE_SYSTEM_WAIT;
		}
		
		override public function handle():void {
			framework.waitCount++;
			if (framework.waitCount > framework.waitTime) {
				framework.waitCount = 0;
				framework.dispatchEvent(new Event(GameFramework.EVENT_WAIT_COMPLETE));
			}
		}
		
		
	}
}