package com.andersonjeanna.objectsGame
{
	import com.andersonjeanna.coreGame.Assets;
	
	import starling.display.Image;
	import starling.display.Sprite;
	
	public class Background extends Sprite
	{
		public var sky1:Image;
		private var sky2:Image;
		
		public function Background()
		{
			sky1 = new Image(Assets.skyTexture);
			addChild(sky1);
			
			sky2 = new Image(Assets.skyTexture);
			sky2.x = 800; //positioned beside sky1
			addChild(sky2);
		}
		
		public function update():void
		{
			// make the image to look like it is looping
			
			sky1.x -= 2; // make sky1 move
			// if sky1 reaches the edge of screen set it back to the other side
			if(sky1.x == -800)
			{
				sky1.x = 800;
			}
			
			sky2.x -= 2; // make sky2 move
			// if sky2 reaches the edge of screen set it back to the other side
			if(sky2.x == -800)
			{
				sky2.x = 800;
			}
		}
	}
}