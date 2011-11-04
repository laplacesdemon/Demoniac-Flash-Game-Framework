package
{
	import com.oyunstudyosu.framework.FrameworkStates;
	import com.oyunstudyosu.framework.GameFramework;
	import com.oyunstudyosu.framework.ScoreBoard;
	import com.oyunstudyosu.framework.ScoreBoardElement;
	import com.oyunstudyosu.framework.screen.BasicScreen;
	import com.oyunstudyosu.framework.screen.NotificationScreen;
	import com.oyunstudyosu.framework.state.GameOverState;
	import com.oyunstudyosu.framework.state.GamePlayState;
	import com.oyunstudyosu.framework.state.InstructionsState;
	import com.oyunstudyosu.framework.state.LevelInState;
	import com.oyunstudyosu.framework.state.NewGameState;
	import com.oyunstudyosu.framework.state.NewLevelState;
	import com.oyunstudyosu.framework.state.PreloadState;
	import com.oyunstudyosu.framework.state.WaitForCloseState;
	import com.oyunstudyosu.framework.state.WaitState;
	
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.geom.Point;
	import flash.text.TextFormat;
	
	import samplegame.SampleGame;
	
	public class Main extends GameFramework
	{
		//custom sccore board elements 
		public static const SCORE_BOARD_CLICKS:String = "clicked";
		
		public function Main()
		{
			trace("main function");
			this.init();
		}
		
		override public function init():void {
			// register states
			FrameworkStates.registerState(new GameOverState(this));
			FrameworkStates.registerState(new GamePlayState(this));
			FrameworkStates.registerState(new InstructionsState(this));
			FrameworkStates.registerState(new LevelInState(this));
			FrameworkStates.registerState(new LevelInState(this));
			FrameworkStates.registerState(new NewLevelState(this));
			FrameworkStates.registerState(new PreloadState(this));
			FrameworkStates.registerState(new WaitForCloseState(this));
			FrameworkStates.registerState(new WaitState(this));
			FrameworkStates.registerState(new NewGameState(this));
			
			frameRate = 30;
			
			game = new SampleGame();
			this.setApplicationBackGround(400, 400, false, 0xdddddd);
			
			game.addEventListener(SampleGame.GAME_OVER, function(e:Event):void {
				switchSystemState(FrameworkStates.STATE_SYSTEM_GAME_OVER);
			});
			
			scoreBoard = new ScoreBoard();
			addChild(scoreBoard);
			
			scoreBoardTextFormat= new TextFormat("_sans", "11", "0xffffff", "true");
			scoreBoard.createTextElement(SCORE_BOARD_CLICKS,
				new ScoreBoardElement(25, 5, 15, "Clicks", scoreBoardTextFormat, 25, "0", scoreBoardTextFormat));
			
			
			//screen text initializations 
			screenTextFormat = new TextFormat("_sans", "16", "0xffffff", "false");
			screenTextFormat.align = flash.text.TextFormatAlign.CENTER;
			screenButtonFormat = new TextFormat("_sans", "12", "0x000000", "false");
			
			titleScreen = new NotificationScreen(FrameworkStates.STATE_SYSTEM_TITLE,400,400,false,0x0000dd );
			titleScreen.createDisplayText("Sample Game", 100,new Point(145,150),screenTextFormat);
			
			
			instructionsScreen = new NotificationScreen(FrameworkStates.STATE_SYSTEM_INSTRUCTIONS,400,400, false,0x0000dd);
			instructionsScreen.createDisplayText("Click the mouse\n10 times",150,new Point(120,150), screenTextFormat);
			
			
			levelInScreen = new NotificationScreen(FrameworkStates.STATE_SYSTEM_LEVEL_IN, 400, 400, false, 0xff0000);
			instructionsScreen.createDisplayText("level in",150,new Point(120,150), screenTextFormat);
			
			
			//Set standard wait time between levels 
			waitTime= 30;
			//set initial game state 
			switchSystemState(FrameworkStates.STATE_SYSTEM_NEW_GAME);
			
			//create timer and run it one time 
			frameRate = 30; 
			startTimer();
			
		}
	}
}