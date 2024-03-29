package com.demoniac
{
	import flash.display.Sprite;
	import flash.text.TextField;
	import flash.text.TextFormat;
	
	public class ScoreBoard extends Sprite
	{
		//create text format objects for our various colors of text ( white)
		
		private var textElements:Object;
		
		//Constructor calls init() only
		public function ScoreBoard() 
		{
			init();
		}
		
		private function init():void {
			textElements = {};
		}
		
		public function createTextElement(key:String, obj:ScoreBoardElement):void {
			textElements[key] = obj;
			addChild(obj);			
		}
		
		//update() is called by Main after receiving a custom event from the Game class
		//1. two values are passed in:
		//2. key - represents the text name of the scoreBoard object to update ex: "score"
		//3. Value - representes the new value for the Object
		public function update(key:String, value:String):void {
			//trace("key=" + key);
			//trace("value=" + value);
			var tempElement:ScoreBoardElement = textElements[key];
			tempElement.setContentText(value);
			
		}
		
	}
	
}