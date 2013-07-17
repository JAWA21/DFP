package com.andersonjeanna.managersGame
{
	import com.andersonjeanna.objectsGame.Enemy;
	import com.andersonjeanna.stateGame.Play;
	
	public class EnemyManager
	{
		private var play:Play; 
		public var enemyList:Array; // array of enemies
		//private var pool:StarlingPool; // pool enemies so enemies are reused
		public var count:int = 0;
		private var _speed:Number = 2;
		
		public function EnemyManager(play:Play)
		{
			this.play = play;
			enemyList = new Array();
			//pool = new StarlingPool(Enemy, 20); // instantiate the pool of enemies. there will never be more than 20
		}
		
		public function update():void
		{
			var enemy:Enemy;
			var enemyListLength:int = enemyList.length;
			
			//set the enemy back to the other side
			
			
/*						if(Math.random() < 0.05)
			{
			spawn(); // spawn enemies ... slower spawn rate
			}*/
			
			
			for(var i:int = enemyListLength - 1; i >= 0; i--)
			{
				enemy = enemyList[i]; // get the enemy from the array
				enemy.x -= 4; // decrement the enemy by 4 pixels
				
				
				if(enemy.x > (640 + enemy.width*.5))
				{
					enemy.x = 700 + enemy.width * 0.5;
				}
/*				if(enemy.x < 0)
				{
				destroyEnemy(enemy); // if enemy reaches the side of the screen than destroy it
				}*/
			}
		}
		
		// spawn the enemies
		public function spawn():void
		{
			//var e:Enemy = pool.getSprite() as Enemy;
			
						var e:Enemy = new Enemy();
			//Starling.juggler.add(e); // jugglar makes sure all the animated objects are updated
			enemyList.push(e);
			e.y = Math.random() * 500 + 50;
			e.x = Math.random() * 800 + 50;
			play.addChild(e);
			
			for(var i:int=0; i < 20; i++)
			{
				var enemy:Enemy = new Enemy();
				enemy.x = Math.random() * 700 + 50;
				enemy.y = Math.random() * 190 + 50;
				
				play.addChild(enemy);
				
				enemyList.push(enemy);
			}
		}
		
		public function destroyEnemy(enemyDie:Enemy):void
		{
			var length:int = enemyList.length;
			
			for(var i:int=0; i< length; i++)
			{
				if(enemyDie == enemyList[i])
				{
					//trace(pool.items.length);
					enemyList.splice(i, 1);
					trace(enemyDie);
					//Starling.juggler.remove(enemyDie);
					enemyDie.removeFromParent(true);
					//pool.returnSprite(enemyDie); // reuse those enemies
				}
			}
		}
		
		public function destroy():void
		{
			//pool.destroy();
			//pool = null;
			enemyList = null;
		}
	}
}