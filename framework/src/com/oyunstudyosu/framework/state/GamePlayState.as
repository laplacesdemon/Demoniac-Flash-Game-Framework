package com.oyunstudyosu.framework.state
{
	import com.oyunstudyosu.framework.FrameworkStates;
	import com.oyunstudyosu.framework.GameFramework;
	
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