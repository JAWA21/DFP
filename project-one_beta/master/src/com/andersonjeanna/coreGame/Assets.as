package com.andersonjeanna.coreGame
{
	import starling.textures.Texture;
	import starling.textures.TextureAtlas;
	
	public class Assets
	{
		// get the assets
		
		// embed the sky texture
		[Embed(source="assets/sky.png")]
		private static var sky:Class;
		public static var skyTexture:Texture;
		
		// embed atlas
		[Embed(source="assets/atlas.png")]
		private static var atlas:Class;
		
		public static var ta:TextureAtlas;
		
		// embed atlas xml
		[Embed(source="assets/atlas.xml", mimeType="application/octet-stream")]
		private static var atlasXML:Class;
		
		public static function init():void
		{
			skyTexture = Texture.fromBitmap(new sky());
			
			ta = new TextureAtlas(Texture.fromBitmap(new atlas()), XML(new atlasXML()));
		}
	}
}