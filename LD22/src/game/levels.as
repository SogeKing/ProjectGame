package game
{
	import org.flixel.*;
	/**
	 * ...
	 * @author Omar Abdulkarim
	 */
	public class levels 
	{
		[Embed(source = "/data/m1.png")] 
		public var m1:Class;
		[Embed(source = "/data/m2.png")] 
		public var m2:Class;
		public var lvls:FlxGroup;
		public var ladders:FlxGroup;
		public var humans:FlxGroup;
		
		public var l1:FlxGroup;
		public var l2:FlxGroup;
		
		public var h1:FlxGroup;
		public function levels() 
		{
			lvls = new FlxGroup();
			lvls.add(new Level(m1));
			lvls.add(new Level(m2));
			
			l1 = new FlxGroup();
			l1.add(new Ladder(290, 290));
			l1.add(new Ladder(290, 270));
			l1.add(new Ladder(290, 250));
			l1.add(new Ladder(10, 250));
			l1.add(new Ladder(10, 230));
			l1.add(new Ladder(10, 210));
			l1.add(new Ladder(290, 210));
			l1.add(new Ladder(290, 190));
			l1.add(new Ladder(290, 170));
			l1.add(new Ladder(290, 150));
			l1.add(new Ladder(290, 130));
			l1.add(new Ladder(290, 110));
			l1.add(new Ladder(290, 90));
			l1.add(new Ladder(290, 70));
			
			ladders = new FlxGroup();
			ladders.add(l1);
			ladders.add(l2);
			
			h1 = new FlxGroup();
			h1.add(new Human(60, 290));
			h1.add(new Human(90, 290));
			
			humans = new FlxGroup();
			humans.add(h1);
		}
		
		public function addLevel(lvl:Number, state:FlxState):void
		{
			state.add(lvls.members[lvl - 1]);
			state.add(ladders.members[lvl - 1]);
			state.add(humans.members[lvl - 1]);
		}
	}

}