package game 
{
	import org.flixel.*;
	/**
	 * ...
	 * @author Omar Abdulkarim
	 */
	public class Light extends FlxSprite
	{
		[Embed(source = "/data/light.png")]
		private var lightImg:Class;
		
    private var darkness:FlxSprite;
 
    public function Light(x:Number, y:Number, darkness:FlxSprite, _scale:FlxPoint):void {
      super(x, y, lightImg);
		scale = _scale;
      this.darkness = darkness;
      this.blend = "screen";
    }
 
    override public function draw():void {
      var screenXY:FlxPoint = getScreenXY();
 
      darkness.stamp(this,
                    screenXY.x - this.width / 2,
                    screenXY.y - this.height / 2);
    }
		
	}

}