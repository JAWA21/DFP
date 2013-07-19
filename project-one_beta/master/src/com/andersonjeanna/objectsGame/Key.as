package com.andersonjeanna.objectsGame
{
	import flash.display.Stage;
	import flash.events.KeyboardEvent;

	public class Key
	{
		public static var keys:Array = [];
		
		public function Key()
		{
		}
		
		public static function init(st:Stage):void
		{
			st.addEventListener(KeyboardEvent.KEY_DOWN, onDown);
			st.addEventListener(KeyboardEvent.KEY_UP, onUp);	
			
			for(var i:int=0; i<100; i++)
			{
				keys[i] = 0;
			}
			trace(st);
		}
		
		private static function onUp(event:KeyboardEvent):void
		{
			keys[event.keyCode] = 0; //false
		}
		
		private static function onDown(event:KeyboardEvent):void
		{
			keys[event.keyCode] = 1; //true
		}
	}
}