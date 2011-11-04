package com.oyunstudyosu.framework
{
	import flash.display.MovieClip;
	
	public class Game extends MovieClip
	{
		//Create constants for simple custom events
		public static const GAME_OVER:String = "game over";
		public static const NEW_LEVEL:String = "new level";
		public static const NEW_GAME:String = "new game";
		public static const ERROR:String	 = "error";
				
		/**
		 * store a reference of the last achieved score
		 **/
		public var lastScore:Number = 0;
		
		/**
		 * Need to be overridden
		 * Overrider constructor should call its init() method only
		 **/
		public function Game() {
			// do nothing, leave the implementation to the custom game class
		}
		
		public function setRendering(profiledRate:int, framerate:int):void {
			
		}
		
		public function preload():void {
			throw new Error("abstract method should be overridden");
		}
		
		public function newGame():void {
			throw new Error("abstract method should be overridden");
		}
		
		
		public function newLevel():void {
			throw new Error("abstract method should be overridden");
		}
		
		
		public function runGame():void {
			throw new Error("abstract method should be overridden");	
		}
		
		
		public function runGameTimeBased(paused:Boolean=false,timeDifference:Number=1):void {
			throw new Error("abstract method should be overridden");	
		}
		
		
	}
	
}