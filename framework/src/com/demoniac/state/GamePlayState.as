package com.demoniac.state
{
	import com.demoniac.FrameworkStates;
	import com.demoniac.GameFramework;
	
	public class GamePlayState extends State
	{
		public function GamePlayState(framework:GameFramework)
		{
			super(framework);
			this._id = FrameworkStates.STATE_SYSTEM_GAME_PLAY;
		}
		
		override public function handle():void {
			framework.game.runGame();
		}
		
	}
}