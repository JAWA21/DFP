package com.andersonjeanna.stateGame
{
	import com.andersonjeanna.coreGame.Assets;
	import com.andersonjeanna.coreGame.Game;
	import com.andersonjeanna.interfaceGame.IState;
	import com.andersonjeanna.objectsGame.Background;
	
	import starling.display.Button;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	
	public class Menu extends Sprite implements IState
	{
		private var game:Game;
		//private var background:Background;
		private var logo:Image;
		private var play:Button;
		
		public function Menu(game:Game)
		{
			this.game = game; // call back to main Game class
			
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(event:Event):void
		{
			// init background and add to display
			
			var background:Background = new Background();
			addChild(background.sky1);
			
			// get the logo from the texture atlas
			// set the pivot point to the middle
			// position logo on screen
			// add logo to display
			logo = new Image(Assets.ta.getTexture("logo"));
			logo.pivotX = logo.width * 0.5;
			logo.x = 400;
			logo.y = 250;
			addChild(logo);
			
			// get the play button from the texture atlas
			// listen for button trigger event
			// set the pivot point to the middle
			// position button on screen
			// add play button to display
			play = new Button(Assets.ta.getTexture("playButton"));
			play.addEventListener(Event.TRIGGERED, onPlay);
			play.pivotX = play.width * 0.5;
			play.x = 400;
			play.y = 350;
			addChild(play);
		}
		
		private function onPlay():void
		{
			// on play call Game and change your state!
			game.changeState(Game.PLAY_STATE);
		}
		
		public function update():void
		{
		}
		
		public function destroy():void
		{
			// remove background from parent, dispose of all event listeners, and set it to nothing
			//background.removeFromParent(true);
			//background = null;
			
			// remove logo from parent, dispose of all event listeners, and set it to nothing
			logo.removeFromParent(true);
			logo = null;
			
			// remove play from parent, dispose of all event listeners, and set it to nothing
			play.removeFromParent(true);
			play = null;
			
			// remove yourself! from the game and dispose of event listeners
			removeFromParent(true);
		}
	}
}