package com.andersonjeanna.objectsGame
{
	import com.andersonjeanna.coreGame.Assets;
	
	import starling.display.MovieClip;
	
	public class Enemy extends MovieClip
	{
		public function Enemy()
		{
			// get the enemy from sprite and framerate of 12 for animation of enemy
			super(Assets.ta.getTextures("enemy"), 12);
			
			// set the pivot to the center of the enemy
			pivotX = width * 0.5;
			pivotY = height * 0.5;
		}
	}
}