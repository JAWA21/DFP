package com.andersonjeanna.managersGame
{
	import com.andersonjeanna.objectsGame.Bullet;
	import com.andersonjeanna.objectsGame.Enemy;
	import com.andersonjeanna.stateGame.Play;
	
	import flash.geom.Point;
	
	public class CollisionManager
	{
		private var play:Play;
		private var p1:Point = new Point();
		private var p2:Point = new Point();
		private var alive:Boolean;
		
		public function CollisionManager(play:Play)
		{
			this.play = play;
		}
		
		public function update():void
		{
			//check collisions
			bulletsAndEnemies();
			heroAndEnemies();
		}
		
		private function bulletsAndEnemies():void
		{
			var bulletArray:Array = play.bulletManager.bullets;
			var enemyArray:Array = play.enemyManager.enemyList;
			
			var bullet:Bullet;
			var enemy:Enemy;
			
			for(var i:int = bulletArray.length - 1; i >= 0; i++)
			{
				// currentBullet
				bullet = bulletArray[i];
				for(var j:int=bulletArray.length - 1; j >= 0; j--)
				{
					enemy = enemyArray[j];
					
					// get the position of the bullet
					p1.x = bullet.x;
					p1.y = bullet.y;
					
					// get the position of the enemy
					p2.x = enemy.x;
					p2.y = enemy.y;
					if(Point.distance(p1, p2) < enemy.pivotX + bullet.pivotX)
					{
						// destroy both the enemy and the bullet
						play.enemyManager.destroyEnemy(enemy);
						play.bulletManager.destroyBullet(bullet);
					}
				}
			}
		}
		
		private function heroAndEnemies():void
		{
			var enemyArray:Array = play.enemyManager.enemyList;
			var enemy:Enemy;
			
			for(var i:int = enemyArray.length - 1; i >= 0; i--)
			{
				enemy = enemyArray[i];
				
				// get the position of the hero
				p1.x = play.hero.x;
				p1.y = play.hero.y;
				
				// get the position of the enemy
				p2.x = enemy.x;
				p2.y = enemy.y;
				
				if(Point.distance(p1, p2) < enemy.pivotX + play.hero.pivotX)
				{
					//					play.game.changeState(Game.GAME_OVER_STATE);
				}
			}
		}
	}
}