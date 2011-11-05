package com.demoniac
{
	import com.demoniac.screen.BasicScreen;
	import com.demoniac.screen.NotificationScreen;
	import com.demoniac.state.State;
	
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.events.TimerEvent;
	import flash.text.TextFormat;
	import flash.utils.Timer;
	
	public class GameFramework extends MovieClip {
		
		public static const EVENT_WAIT_COMPLETE:String = "wait complete";
		
		
		public static const KEY_MUTE:int = 77;
		public static const KEY_PAUSE:int = 80;
		public var paused:Boolean = false;
		 
		// states
		//public var systemFunction:Function;
		public var currentSystemState:State;
		public var nextSystemStateId:String;
		public var lastSystemState:State;
		
		public var appBackBitmapData:BitmapData; 
		public var appBackBitmap:Bitmap;
		
		public var frameRate:int; 
		public var timerPeriod:Number; 
		public var gameTimer:Timer;
		
		// Screens (views)
		public var titleScreen:NotificationScreen; 
		public var gameOverScreen:NotificationScreen; 
		public var instructionsScreen:NotificationScreen; 
		public var levelInScreen:NotificationScreen; 
		public var scoreBoard:ScoreBoard; 
		public var pausedScreen:BasicScreen;
		
		
		public var scoreBoardTextFormat:TextFormat;
		public var screenTextFormat:TextFormat;
		public var screenButtonFormat:TextFormat;
		
		public var levelInText:String;
		public var errorText:String;
		
		public var soundManager:SoundManager;
		
		// Game is our custom class to hold all logic for the game. 
		public var game:Game;
		
		// waitTime is used in conjunction with the STATE_SYSTEM_WAIT state
		// it suspends the game and allows animation or other processing to finish
		public var waitTime:int;
		public var waitCount:int = 0;
		
		// Our construction only calls init(). This way, we can re-init the entire system if necessary
		public function GameFramework() {
			
		}
		
		public function addedToStage(e:Event = null):void {
			stage.addEventListener(KeyboardEvent.KEY_DOWN,keyDownListener);
			this.focusRect=false;  
			stage.focus = stage; 
			trace("gameFrameWork added to stage");
		}
		
		/**
		 * is used to set up all of the things that we should only need to do one time
		 * this method should be overridden,
		 * if do not override, system falls back to default states
		 **/
		public function init():void {
			trace("inner init");
			// stub method to be overridden
		}
		
		private function systemPreload():void {
			
		}
		
		public function addSounds():void {
			//stub only needed in IDE preloading
		}
		
		public function setApplicationBackGround(width:Number, height:Number, isTransparent:Boolean = false, color:uint = 0x000000):void {
			appBackBitmapData = new BitmapData(width, height, isTransparent, color);
			appBackBitmap = new Bitmap(appBackBitmapData);
			addChild(appBackBitmap);
		}
		
		public function startTimer(timeBasedAnimation:Boolean=false):void {
			//stage.frameRate = frameRate;
			
			if (timeBasedAnimation) {
				addEventListener(Event.ENTER_FRAME, runGameEnterFrame);
			}else{
				timerPeriod = 1000 / frameRate;
				gameTimer = new Timer(timerPeriod); 
				gameTimer.addEventListener(TimerEvent.TIMER, runGame);
				gameTimer.start();
			}
		}
		
		
		public function runGame(e:TimerEvent):void {
			//systemFunction();
			currentSystemState.handle();
			e.updateAfterEvent();
		}
		
		public function runGameEnterFrame(e:Event):void {
			currentSystemState.handle();
		}
		
		/**
		 * switchSystem state is called only when the state is to be changed (not every frame like in some switch/case 
		 * based simple state machines
		 **/
		public function switchSystemState(stateval:String):void {
			lastSystemState = currentSystemState;
			currentSystemState = FrameworkStates.getState(stateval);
			trace("currentSystemState=" + currentSystemState);
		}
		
		/*
		public function okButtonClickListener(e:CustomEventButtonId):void {
			
			switch(e.id) {
				
				case FrameworkStates.STATE_SYSTEM_TITLE:
					removeChild(titleScreen);
					titleScreen.removeEventListener(CustomEventButtonId.BUTTON_ID, okButtonClickListener);
					break;
				
				case FrameworkStates.STATE_SYSTEM_INSTRUCTIONS:
					removeChild(instructionsScreen);
					instructionsScreen.removeEventListener(CustomEventButtonId.BUTTON_ID, okButtonClickListener);
					break;					
				
				case FrameworkStates.STATE_SYSTEM_GAME_OVER:
					
					removeChild(gameOverScreen);
					gameOverScreen.removeEventListener(CustomEventButtonId.BUTTON_ID, okButtonClickListener);
					break;
				
				
			}
			trace("next system state=" + nextSystemState);
			switchSystemState(nextSystemState);
		}
		*/
		
		public  function keyDownListener(e:KeyboardEvent):void {
			trace("key down: " + e.keyCode);
			switch(e.keyCode) {
				case KEY_PAUSE:
					//pause key pressed
					pausedKeyPressedHandler();
					break;
				case KEY_MUTE:
					muteKeyPressedHandler();
					break;
			}
		}
		
		public function pausedScreenClickListener(e:Event):void {
			removeChild(pausedScreen);
			//pausedScreen.removeEventListener(CustomEventButtonId.BUTTON_ID, okButtonClickListener);
			trace("clicked");
			paused = false;
			stage.focus = game;
		}
		
		
		public  function pausedKeyPressedHandler():void {
			trace("handle pause");
			addChild(pausedScreen);
			//pausedScreen.addEventListener(CustomEventButtonId.BUTTON_ID , pausedScreenClickListener, false, 0, true);
			paused = true;
		}
		
		public  function muteKeyPressedHandler():void {
			soundManager.muteSound();
		}
		
		
		
	}
	
}

