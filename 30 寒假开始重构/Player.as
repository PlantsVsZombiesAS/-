package
{
	import code.plant.*;
	import code.zombie.*;
	import code.level.Level;

	public class Player
	{
		private var currentLevel:Level;
		
		public function Player(level:Level)
		{
			currentLevel = level;
			//level.addZombie(BasicZombie, 2);
			level.addZombie(BasicZombie, 3);
			
			level.addZombie(BasicZombie, 4);
			
			level.addPlant(Peashooter, 2, 8);
			level.addPlant(Peashooter, 3, 8);
			level.addPlant(Peashooter, 2, 7);
			level.addPlant(Peashooter, 4, 8);
		}
	}
}