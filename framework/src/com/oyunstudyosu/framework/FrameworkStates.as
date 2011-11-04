package com.oyunstudyosu.framework
{
	import com.oyunstudyosu.framework.state.IState;
	import com.oyunstudyosu.framework.state.State;
	
	/**
	 * Stores all predefined states of the framework
	 **/
	public class FrameworkStates
	{
		// PLATFORM STATES
		public static const STATE_SYSTEM_WAIT_FOR_CLOSE:String = "wait_for_close";
		public static const STATE_SYSTEM_PRELOAD:String = "preload";
		public static const STATE_SYSTEM_TITLE:String = "title"; 
		public static const STATE_SYSTEM_INSTRUCTIONS:String = "instructions";
		public static const STATE_SYSTEM_WAIT:String = "wait";
		public static const STATE_SYSTEM_ERROR:String = "error_state";
		
		public static const STATE_SROUPS_AVATAR_CREATION:String = "sroups_avatar_creation";
		
		/**
		 * the game in action, This one simply calls the game logic class’s runGame function repeatedly 
		 * and lets the game take care of its own logic and states.
		 **/
		public static const STATE_SYSTEM_GAME_PLAY:String = "game_play";
		
		// GAME SPECIFIC STATES
		public static const STATE_SYSTEM_NEW_GAME:String = "new_game"; 
		public static const STATE_SYSTEM_GAME_OVER:String = "game_over"; 
		public static const STATE_SYSTEM_NEW_LEVEL:String = "new_level"; 
		public static const STATE_SYSTEM_LEVEL_IN:String = "level_in"; 
		
		/**
		 * This state waits for a specified number of frames 
		 * and then fires off a simple custom event constant called WAIT_COMPLETE
		 **/
		public static const STATE_SYSTEM_LEVEL_OUT:String = "level_out"; 
		
		private static var _states:Object /* of State's */ = new Object();
		
		public static function getState(id:String):State {
			return _states[id];
		}
		
		public static function registerState(state:State):void {
			_states[state.id] = state;
		}
		
	}
}