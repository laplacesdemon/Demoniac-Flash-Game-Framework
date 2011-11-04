package com.oyunstudyosu.framework.state
{
	import com.oyunstudyosu.framework.FrameworkStates;
	import com.oyunstudyosu.framework.GameFramework;
	
	import flash.events.Event;
	
	public class LevelInState extends State
	{
		
		
		public function LevelInState(framework:GameFramework)
		{
			super(framework);
			this._id = FrameworkStates.STATE_SYSTEM_LEVEL_IN;
		}
		
		override public function handle():void {
			framework.addChild(framework.levelInScreen);
			framework.waitTime = 30;
			framework.switchSystemState(FrameworkStates.STATE_SYSTEM_WAIT);
			framework.nextSystemStateId = FrameworkStates.STATE_SYSTEM_GAME_PLAY;
			framework.addEventListener(GameFramework.EVENT_WAIT_COMPLETE, waitCompleteListener, false, 0, true);
		}
		
		public function waitCompleteListener(e:Event):void {
			switch(framework.lastSystemState.id) {
				
				case FrameworkStates.STATE_SYSTEM_LEVEL_IN:
					framework.removeChild(framework.levelInScreen);
					break
			}
			framework.removeEventListener(GameFramework.EVENT_WAIT_COMPLETE, waitCompleteListener);
			framework.switchSystemState(framework.nextSystemStateId);
		}
		
		
	}
}