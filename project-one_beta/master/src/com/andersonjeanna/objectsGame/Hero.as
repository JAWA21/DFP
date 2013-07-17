package com.andersonjeanna.objectsGame
{
	import com.andersonjeanna.coreGame.Assets;
	import com.andersonjeanna.stateGame.Play;
	
	import flash.display.Stage;
	
	import starling.core.Starling;
	import starling.display.Image;
	import starling.display.Sprite;
	
	public class Hero extends Sprite
	{
		private var play:Play;
		private var ns:Stage;
		
		
		public function Hero(play:Play)
		{
			this.play = play;
			
			// get the hero from the sprite, set the pivot points to the center, add to display
			var hero:Image = new Image(Assets.ta.getTexture("hero"));
			hero.pivotX = hero.width * 0.5;
			hero.pivotY = hero.height * 0.5;
			addChild(hero);
		}

		public function update():void
		{
			// attach the hero to the mouse by reaching to the native stage and ease the hero towards the mouse
			x += (Starling.current.nativeStage.mouseX - x) * 0.3;
			y += (Starling.current.nativeStage.mouseY - y) * 0.3;
		}
	}
}