package com.oyunstudyosu.framework.state
{
	import com.oyunstudyosu.framework.FrameworkStates;
	import com.oyunstudyosu.framework.Game;
	import com.oyunstudyosu.framework.GameFramework;
	import com.oyunstudyosu.framework.event.CustomEventLevelScreenUpdate;
	import com.oyunstudyosu.framework.event.CustomEventScoreBoardUpdate;
	import com.oyunstudyosu.framework.event.CustomEventSound;
	
	import flash.events.Event;

	public class NewGameState extends State
	{
		public function NewGameState(framework:GameFramework)
		{
			super(framework);
			this._id = FrameworkStates.STATE_SYSTEM_NEW_GAME;
		}
		
		override public function handle():void {
			framework.addChild(framework.game);
			framework.game.addEventListener(CustomEventScoreBoardUpdate.UPDATE_TEXT, scoreBoardUpdateListener, false, 0, true);
			framework.game.addEventListener(CustomEventLevelScreenUpdate.UPDATE_TEXT, levelScreenUpdateListener, false, 0, true);
			framework.game.addEventListener(CustomEventSound.PLAY_SOUND, soundEventListener, false, 0, true);
			framework.game.addEventListener(Game.GAME_OVER, gameOverListener, false, 0, true);
			framework.game.addEventListener(Game.NEW_LEVEL, newLevelListener, false, 0, true);
			framework.game.newGame();
			framework.switchSystemState(FrameworkStates.STATE_SYSTEM_NEW_LEVEL);
		}
		
		public function scoreBoardUpdateListener(e:CustomEventScoreBoardUpdate):void {
			framework.scoreBoard.update(e.element, e.value);
		}
		
		
		public function levelScreenUpdateListener(e:CustomEventLevelScreenUpdate):void {
			framework.levelInScreen.setDisplayText(framework.levelInText + e.text);
		}
		
		public function soundEventListener(e:CustomEventSound):void {
			if (e.type == CustomEventSound.PLAY_SOUND) {
				//trace("play sound");
				framework.soundManager.playSound(e.name, e.isSoundTrack, e.loops, e.offset, e.volume );
			}else {
				framework.soundManager.stopSound(e.name, e.isSoundTrack);
			}
		}
		
		/**
		 * gameOverListener listens for Game.GAMEOVER simple custom events calls and changes state accordingly 
		 **/
		public function gameOverListener(e:Event):void {
			framework.game.removeEventListener(CustomEventScoreBoardUpdate.UPDATE_TEXT, scoreBoardUpdateListener);
			framework.game.removeEventListener(CustomEventLevelScreenUpdate.UPDATE_TEXT, levelScreenUpdateListener);
			framework.game.removeEventListener(CustomEventSound.PLAY_SOUND, soundEventListener);
			framework.game.removeEventListener(Game.GAME_OVER, gameOverListener);
			framework.game.removeEventListener(Game.NEW_LEVEL, newLevelListener);
			//framework.switchSystemState(FrameworkStates.STATE_SYSTEM_GAME_OVER);
		}
		
		/**
		 * newLevelListener listens for Game.NEWLEVEL simple custom events calls and changes state accordingly 
		 **/
		public function newLevelListener(e:Event):void {
			framework.switchSystemState(FrameworkStates.STATE_SYSTEM_NEW_LEVEL);
		}
		
	}
}