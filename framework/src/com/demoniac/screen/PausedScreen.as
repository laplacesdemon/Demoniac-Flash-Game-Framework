package com.demoniac.screen
{
	import com.demoniac.screen.BasicScreen;
	import flash.geom.*;
	import flash.display.*;
	import flash.text.*;
	
	public class PausedScreen extends BasicScreen
		
	{
		private var backgroundBD:BitmapData;
		private var backgroundBitmap:Bitmap;
		
		
		public function PausedScreen(width:Number, 
									 height:Number,
									 bgcolor:uint, 
									 idval:String, 
									 okneeded:Boolean, 
									 btext:String, 
									 okLocationval:Point = null, 
									 okWidthval:Number = undefined, 
									 okHeightval:Number = undefined) 
		{
			
			backgroundBD = new BitmapData(width, height, true, bgcolor);
			backgroundBitmap = new Bitmap(backgroundBD);
			addChild(backgroundBitmap);
			super(idval, width, height, false, bgcolor);
		}
	}
	
}