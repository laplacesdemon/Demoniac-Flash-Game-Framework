package com.demoniac.state
{
	import com.demoniac.FrameworkStates;
	import com.demoniac.GameFramework;
	
	public class InstructionsState extends State
	{
		public function InstructionsState(framework:GameFramework)
		{
			super(framework);
			this._id = FrameworkStates.STATE_SYSTEM_INSTRUCTIONS;
		}
		
		override public function handle():void {
			trace("system instructions");
			framework.addChild(framework.instructionsScreen);
			framework.switchSystemState(FrameworkStates.STATE_SYSTEM_WAIT_FOR_CLOSE);
			framework.nextSystemStateId = FrameworkStates.STATE_SYSTEM_NEW_GAME;
		}
	}
}