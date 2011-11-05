package com.demoniac.state
{
	import com.demoniac.FrameworkStates;
	import com.demoniac.GameFramework;

	public class TitleState extends State
	{
		public function TitleState(framework:GameFramework)
		{
			super(framework);
			this._id = FrameworkStates.STATE_SYSTEM_TITLE;
		}
		
		override public function handle():void {
			trace("system title");
			framework.addChild(framework.titleScreen);
			framework.switchSystemState(FrameworkStates.STATE_SYSTEM_WAIT_FOR_CLOSE);
			framework.nextSystemStateId = FrameworkStates.STATE_SYSTEM_INSTRUCTIONS; 
		}
	}
}