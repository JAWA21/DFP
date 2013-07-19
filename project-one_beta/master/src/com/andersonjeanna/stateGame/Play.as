package com.andersonjeanna.stateGame
{
	import com.andersonjeanna.coreGame.Game;
	import com.andersonjeanna.interfaceGame.IState;
	import com.andersonjeanna.managersGame.BulletManager;
	import com.andersonjeanna.managersGame.CollisionManager;
	import com.andersonjeanna.managersGame.EnemyManager;
	import com.andersonjeanna.objectsGame.Background;
	import com.andersonjeanna.objectsGame.Hero;
	
	import flash.display.Stage;
	import flash.events.MouseEvent;
	
	import starling.core.Starling;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.events.KeyboardEvent;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	
	public class Play extends Sprite implements IState
	{
		public var game:Game;
		private var background:Background;
		public var hero:Hero;
		public var bulletManager:BulletManager;
		public var fire:Boolean = false; // won't shoot unless player says to
		public var enemyManager:EnemyManager;
		private var collisionManager:CollisionManager;
		
		public function Play(game:Game)
		{
			this.game = game; // call back to main Game class
			
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function onFire(event:TouchEvent):void
		{
			var touch:Touch = event.getTouch(stage);
			if(touch)
			{
				if(touch.phase == TouchPhase.BEGAN)
				{
					fire = true;
				}
					
				else if(touch.phase == TouchPhase.ENDED)
				{
					fire = false;
				}
			}
		}
		
		private function init(event:Event):void
		{
			stage.addEventListener(TouchEvent.TOUCH, onFire);
			
			// instantiate the background and add it to the display
			background = new Background();
			addChild(background);
			
			// instantiate the hero and add it to the display
			hero = new Hero(this);
			addChild(hero);
			
			bulletManager = new BulletManager(this);
			collisionManager = new CollisionManager(this);
			enemyManager = new EnemyManager(this);
			
			enemyManager.spawn();
		}
		
		public function update():void
		{
			// call the updates of all the elements of the game
			background.update();
			hero.update();
			
			bulletManager.update();
			enemyManager.update();
			collisionManager.update();
		}
		
		public function destroy():void
		{
			bulletManager.destroy();
			enemyManager.destroy();
			
			removeFromParent(true);
		}
	}
}