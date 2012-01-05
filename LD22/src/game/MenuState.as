package game 
{
	import org.flixel.*;
	/**
	 * ...
	 * @author Omar Abdulkarim
	 */
	public class MenuState extends FlxState
	{
		private var startButton:FlxButton;
		
		override public function create():void
		{
			FlxG.bgColor = 0xffff00ff;
			FlxG.mouse.show();
			
			startButton = new FlxButton(FlxG.width / 2 - 40, FlxG.height / 2, "PLAY", play);
			add(startButton);
			
			super.create();
		}
		
		override public function update():void
		{
			super.update();
		}
		
		private function play():void
		{
			FlxG.switchState(new PlayState);
		}
	}

}