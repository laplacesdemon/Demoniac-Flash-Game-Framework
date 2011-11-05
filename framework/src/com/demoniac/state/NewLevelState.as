package com.demoniac.state
{
	import com.demoniac.FrameworkStates;
	import com.demoniac.GameFramework;
	
	public class NewLevelState extends State
	{
		public function NewLevelState(framework:GameFramework)
		{
			super(framework);
			this._id = FrameworkStates.STATE_SYSTEM_NEW_LEVEL;
		}
		
		override public function handle():void {
			framework.game.newLevel();
			framework.switchSystemState(FrameworkStates.STATE_SYSTEM_LEVEL_IN);
		}
	}
}