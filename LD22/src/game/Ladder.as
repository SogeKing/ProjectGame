package game 
{
	import org.flixel.*;
	/**
	 * ...
	 * @author Omar Abdulkarim
	 */
	public class Ladder extends FlxSprite
	{
		[Embed(source = "/data/ladder.png")] private var img:Class;
		
		public function Ladder(X:Number, Y:Number) 
		{
			super(X, Y);
			loadGraphic(img);
			immovable = true;
			
		}
		
	}

}