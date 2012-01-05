package  
{
	import org.flixel.*;
	import game.*;
	[SWF(width = "640", height = "480", backgroundcolor = "#000000")]
	/**
	 * ...
	 * @author Omar Abdulkarim
	 */
	public class AlwaysAlone extends FlxGame
	{
		
		public function AlwaysAlone() 
		{
			super(320, 240, MenuState, 2);
			forceDebugger = true;
		}
		
	}

}