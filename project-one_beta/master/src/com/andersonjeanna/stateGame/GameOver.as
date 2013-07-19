package com.andersonjeanna.stateGame
{
	import com.andersonjeanna.coreGame.Assets;
	import com.andersonjeanna.coreGame.Game;
	import com.andersonjeanna.interfaceGame.IState;
	import com.andersonjeanna.objectsGame.Background;
	
	import starling.display.Button;
	import starling.display.DisplayObject;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.text.TextField;
	
	public class GameOver extends Sprite implements IState
	{
		private var game:Game;
		private var over:DisplayObject;
		private var again:Button;
		
		public function GameOver(game:Game)
		{
			this.game = game; // call back to main Game class
			
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(event:Event):void
		{
			var background:Background = new Background();
			addChild(background.sky1);
			
			over = new Image(Assets.ta.getTexture("over"));
			over.pivotX = over.width * 0.5;
			over.x = 400;
			over.y = 250;
			addChild(over);
			
			again = new Button(Assets.ta.getTexture("tryAgainButton"));
			again.addEventListener(Event.TRIGGERED, onPlayAgain);
			again.pivotX = again.width * 0.5;
			again.x = 400;
			again.y = 350;
			addChild(again);
		}
		
		private function onPlayAgain():void
		{
			again.removeEventListener(Event.TRIGGERED, onPlayAgain);
			game.changeState(Game.PLAY_STATE);
		}
		
		public function update():void
		{
			// we need this because this class is an IState
		}
		
		public function destroy():void
		{
			removeFromParent(true);
		}
	}
}