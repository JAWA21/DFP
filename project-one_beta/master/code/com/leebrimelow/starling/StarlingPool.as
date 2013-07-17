package com.leebrimelow.starling
{
	import starling.display.DisplayObject;

	public class StarlingPool
	{
		public var items:Array;
		private var counter:int;
		
		// what type of object are you creating for the pool?
		public function StarlingPool(type:Class, len:int)
		{
			items = new Array();
			counter = len;
			
			var i:int = len;
			while(--i > -1)
				items[i] = new type();
		}
		
		// when firing the sprite
		public function getSprite():DisplayObject
		{
			if(counter > 0)
				return items[--counter];
			else
				throw new Error("You exhausted the pool!");
		}
		
		public function returnSprite(s:DisplayObject):void
		{
			items[counter++] = s;
		}
		
		// destroy all the items
		public function destroy():void
		{
			items = null;
		}
	}
}