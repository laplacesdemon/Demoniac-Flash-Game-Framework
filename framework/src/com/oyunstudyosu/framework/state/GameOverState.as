package com.oyunstudyosu.framework.state
{
	import com.oyunstudyosu.framework.FrameworkStates;
	import com.oyunstudyosu.framework.Game;
	import com.oyunstudyosu.framework.GameFramework;
	
	import flash.events.Event;
	
	public class GameOverState extends State
	{
		public function GameOverState(framework:GameFramework)
		{
			super(framework);
			this._id = FrameworkStates.STATE_SYSTEM_GAME_OVER;
		}
		
		override public function handle():void {
			trace("game over state handle");
			//framework.removeChild(framework.game);
			
			framework.addChild(framework.gameOverScreen);
			//gameOverScreen.addEventListener(CustomEventButtonId.BUTTON_ID, okButtonClickListener, false, 0, true);
			
			framework.game.dispatchEvent(new Event(Game.GAME_OVER));
			
			framework.switchSystemState(FrameworkStates.STATE_SYSTEM_WAIT_FOR_CLOSE);
			framework.nextSystemStateId = FrameworkStates.STATE_SYSTEM_TITLE;
			
		
			
		}
		
		
	}
}