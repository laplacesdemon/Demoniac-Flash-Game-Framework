package com.oyunstudyosu.framework.screen
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Sprite;
	
	public class BasicScreen extends BasicSprite
	{
		private var backgroundBitmapData:BitmapData;
		private var backgroundBitmap:Bitmap;
		
		/**
		 * Constructor accepts our two passed in vars and then calls init 
		 **/
		public function BasicScreen(id:String, width:Number, height:Number, isTransparent:Boolean, color:uint) {
			super(id);
			backgroundBitmapData = new BitmapData(width, height, isTransparent, color);
			backgroundBitmap = new Bitmap(backgroundBitmapData);
			addChild(backgroundBitmap);
		}
	}
}