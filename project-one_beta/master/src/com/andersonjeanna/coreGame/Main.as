package com.andersonjeanna.coreGame
{
	import flash.display.Sprite;
	
	import starling.core.Starling;
	
	[SWF(width="800", height="700", frameRate="60", backgroundColor=0x000000)]
	
	public class Main extends Sprite
	{
		public function Main()
		{
			// entering Starling world!			
			var star:Starling = new Starling(Game, stage);
			star.showStats = true; // remove on publish
			star.start(); //calling Game class to start playing
		}
	}
}