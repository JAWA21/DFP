package com.andersonjeanna.objectsGame
{
	import com.andersonjeanna.coreGame.Assets;
	
	import starling.display.Image;
	import starling.display.Sprite;
	
	public class Bullet extends Sprite
	{
		public function Bullet()
		{
			//visual representation of the bullet
			var bullet:Image = new Image(Assets.ta.getTexture("bullet1"));
			pivotX = width * 0.5;
			pivotY = height * 0.5;
			addChild(bullet);
		}
	}
}