package com.andersonjeanna.managersGame
{
	import com.andersonjeanna.objectsGame.Bullet;
	import com.andersonjeanna.stateGame.Play;
	import com.leebrimelow.starling.StarlingPool;

	public class BulletManager
	{
		private var play:Play;
		public var bullets:Array;
		private var pool:StarlingPool;
		public var count:int = 0;
		
		public function BulletManager(play:Play)
		{
			this.play = play;
			bullets = new Array();
			
			// create a pool of 100 "bullet" objects
			pool = new StarlingPool(Bullet, 100);
		}
		
		public function update():void
		{
			// reference for bullet 
			var b:Bullet;
			
			var length:int = bullets.length;
			
			//loop through the bullets in the array... backwards!
			for(var i:int = length -1; i >= 0; i--)
			{
				b = bullets[i];
				
				b.x += 25;
				if(b.x > 800)
				{
					destroyBullet(b);
				}
			}
			
			// wow. are you firing? ok, slow your bullet speed down! count your updates!
			if(play.fire && count%10 == 0)
			{
				fire();
			}
			
			count++;
		}
		
		private function fire():void
		{
			// pull one of the bullets out of the pool and cast it as a bullet
			var b:Bullet = pool.getSprite() as Bullet;
			// add it to the display
			play.addChild(b);
			// position it on the display as part of the hero
			b.x = play.hero.x + 15;
			b.y = play.hero.y + 5;
			// push it to the bullet array - danger danger! incoming bullets!
			bullets.push(b);
		}
		
		public function destroyBullet(b:Bullet):void
		{
			var length:int = bullets.length;

			for(var i:int=0; i < length; i++)
			{
				if(bullets[i] == b)
				{
					bullets.splice(i, 1);
					b.removeFromParent(true);
					pool.returnSprite(b);
				}
			}
		}
		
		public function destroy():void
		{
			pool.destroy();
			pool = null;
			bullets = null;
		}
	}
}