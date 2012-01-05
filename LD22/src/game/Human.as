package game 
{
	import org.flixel.*;
	/**
	 * ...
	 * @author Omar Abdulkarim
	 */
	public class Human extends FlxSprite
	{
		[Embed(source = "/data/Human_Alive.png")] private var img:Class;
		public var _alive:Boolean;
		public var moving:Boolean;
		public var follower:FlxObject;
		public var possed:Boolean;
		
		public function Human(X:Number, Y:Number) 
		{
			super(X, Y);
			loadGraphic(img, true, true, 18, 20, true);
			frames = 9;
			frameWidth = 20;
			frameHeight = 20;
			addAnimation("afk", [0, 1, 2], 3, true);
			addAnimation("walking", [3, 4, 5, 6, 7, 8, 9, 10, 11, 12], 30, true);
			play("afk", true);
			
			maxVelocity.x = 200;
			maxVelocity.y = 200;
			drag.x = 60;
			acceleration.y = 180;
		}
		
		override public function update():void
		{
			if (velocity.x != 0)
			{
				play("walking");
			} 
			if ( velocity.x == 0) 
			{
				play("afk");
			}
			if (possed == true && alive)
			{
				alive = false;
				visible = false;
			}
			if (possed == false && !alive)
			{
				alive = true;
				exists = true;
				reset(follower.x, follower.y);
			}
		}
		
		public function follow(obj:FlxObject):void
		{
			follower = obj;
			if (x > obj.x && y == obj.y) 
			{
				facing = LEFT;
				velocity.x = -20;
			}
			if (x < obj.x && y == obj.y)
			{
				facing = RIGHT;
				velocity.x = 20;
			}
		}
	}

}