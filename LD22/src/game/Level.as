package game 
{
	import org.flixel.*;
	import flash.display.*;
	import net.pixelpracht.tmx.*;
	/**
	 * ...
	 * @author Omar Abdulkarim
	 */
	public class Level extends FlxTilemap
	{
		private var mapCsv:String;
		private var map:TmxMap;
		[Embed(source = "/data/autotiles10.png")] private var autoTiles:Class
		[Embed(source = "/data/m1.png")] private var mapImg:Class
		
		public function Level(img:Class) 
		{		
			super();
			loadMap(imageToCSV(img, false) , autoTiles, 10, 10, AUTO);
			follow();
		}
		
	}

}