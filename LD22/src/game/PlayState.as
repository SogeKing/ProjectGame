package game 
{
	import org.flixel.*;
	import flash.events.Event;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import net.pixelpracht.tmx.*;
	/**
	 * ...
	 * @author Omar Abdulkarim
	 */
	public class PlayState extends FlxState
	{
		private var player			:Player;
		private var level			:Number;
		private var darkness		:FlxSprite;
		private var light1			:Light;
		private var mouseLight		:Light;
		private var camera			:FlxCamera;
		private var layer1			:FlxSprite;
		private var ladder1			:Ladder;
		private var ladderGroup		:FlxGroup;
		private var humanTest		:Human;
		private var _lvls			:levels;
		private var huNo			:FlxText;
		
		[Embed(source = "/data/m1.png")]
		private var m1:Class;
	
		
		
		
		override public function create():void
		{
			camera = new FlxCamera(0, 480, 640, 480);
			camera.zoom = 0.5;
			add(camera);
			FlxG.addCamera(camera);
			FlxG.camera.zoom = 2;
			
			level = 1;
			_lvls = new levels();
			_lvls.addLevel(level, this);
			
			player = new Player(10, 290);
			add(player);
			
			humanTest = new Human(60, 290);
			//add(humanTest);
			
			//add(layer1);
			darkness = new FlxSprite(0, 0);
			darkness.makeGraphic(FlxG.width, FlxG.height, 0xff000000);
			darkness.scrollFactor.x = darkness.scrollFactor.y = 0;
			darkness.blend = "multiply";
			
			
			light1 = new Light(player.x, player.y, darkness, new FlxPoint(5, 4));
			mouseLight = new Light(FlxG.mouse.x, FlxG.mouse.y, darkness, new FlxPoint(0.2,0.2));
			
			add(light1);
			//add(mouseLight);
			add(darkness);
			
			huNo = new FlxText(0, 0, 50, "Humans: " + player.souls);
			huNo.scrollFactor.x = 0;
			huNo.scrollFactor.y = 0;
			add(huNo);
			
			FlxG.worldBounds.width = _lvls.lvls.members[level-1].width;
			FlxG.worldBounds.height = _lvls.lvls.members[level-1].height;
			
			FlxG.watch(player, "x", "X");
			FlxG.watch(player, "y", "Y");
			
			super.create();
		}
		
		override public function draw():void
		{
			darkness.fill(0xff000000);
			super.draw();	
		}
		
		override public function update():void
		{
			light1.x = player.x+10;
			light1.y = player.y+10;
			
			mouseLight.x = FlxG.mouse.x;
			mouseLight.y = FlxG.mouse.y;
			
			if (FlxG.overlap(player, _lvls.ladders.members[level-1]) && FlxG.keys.W)
			{
				player.y -= 3.8;
			}
			for (var i:Number = 0; i < _lvls.humans.members[level - 1].length; i++)
			{
			if (FlxG.overlap(player, _lvls.humans.members[level - 1].members[i]) && FlxG.keys.S && _lvls.humans.members[level - 1].members[i].alive == true)
			{
				player.ptype = "possed";
				_lvls.humans.members[level - 1].members[i].possed = true;
				player.loadGraphic(player.possedImg, true, true, 20, 20, true);
				player.souls++;
			}
			}
			if (FlxG.keys.R)
			{
				humanTest.visible = true;
			}
			FlxG.camera.follow(player, FlxCamera.STYLE_PLATFORMER);
			FlxG.collide(player, _lvls.lvls.members[level - 1]);
			FlxG.collide(_lvls.humans.members[level - 1], _lvls.lvls.members[level - 1]);
			FlxG.collide(humanTest, _lvls.lvls.members[level-1]);
			humanTest.follow(player);
			huNo.text = "Humans: " + player.souls;
			super.update();
		}
		
	}

}