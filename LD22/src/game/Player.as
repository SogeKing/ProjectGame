package game 
{
	import org.flixel.*;
	/**
	 * ...
	 * @author Omar Abdulkarim
	 */
	public class Player extends FlxSprite
	{
		private var moving:Boolean;
		public var ptype:String;
		public var souls:Number = 0;
		[Embed(source = "/data/Player.png")] public var playerImg:Class;
		[Embed(source = "/data/Player_possed.png")] public var possedImg:Class;
		
		public function Player(x:Number, y:Number) 
		{
			super(x, y);
			loadGraphic(playerImg, true, true, 18, 20, true);
			frames = 9;
			frameWidth = 20;
			frameHeight = 20;
			addAnimation("afk", [0, 1, 2], 3, true);
			addAnimation("walking", [3, 4, 5, 6, 7, 8, 9, 10, 11, 12], 30, true);
			play("afk", true);
			ptype = "normal";
			
			maxVelocity.x = 200;
			maxVelocity.y = 200;
			drag.x = 60;
			acceleration.y = 180;
		}
		override public function update():void
		{
			if ((FlxG.keys.SPACE || FlxG.keys.ENTER) && isTouching(FLOOR))
			{
				velocity.y -= 90;
			}
			if (FlxG.keys.D)
			{
				facing = RIGHT;
				moving = true;
				velocity.x = 90;
			} else if (FlxG.keys.justReleased("D") && isTouching(FLOOR)) {
				velocity.x = 0;
			}
			if (FlxG.keys.A)
			{
				facing = LEFT;
				moving = true;
				velocity.x = -90;
			} else if (FlxG.keys.justReleased("A") && isTouching(FLOOR)) {
				velocity.x = 0;
			}
			if (FlxG.keys.D && FlxG.keys.SHIFT)
			{
				facing = RIGHT;
				moving = true;
				velocity.x = 110;
			} else if (FlxG.keys.justReleased("D") && isTouching(FLOOR)) {
				velocity.x = 0;
			}
			if (FlxG.keys.A && FlxG.keys.SHIFT)
			{
				facing = LEFT;
				moving = true;
				velocity.x = -110;
			} else if (FlxG.keys.justReleased("A") && isTouching(FLOOR)) {
				velocity.x = 0;
			}
			if (velocity.x != 0)
			{
				play("walking");
			} 
			if ( velocity.x == 0) 
			{
				play("afk");
			}
			
			super.update()
		}
	}
	


}