package com.oyunstudyosu.framework.screen
{
	import flash.display.Sprite;
	
	public class BasicSprite extends Sprite
	{
		/**
		 * ID is passed into the constructor. 
		 * When the OK button is clicked, a custom event sends this id back to Main
		 **/
		protected var id:String;
		
		/**
		 * Constructor accepts our two passed in vars and then calls init 
		 **/
		public function BasicSprite(id:String) {
			this.id = id;
			this.name = id;
		}
	}
}