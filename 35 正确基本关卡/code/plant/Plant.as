package code.plant
{
	import code.TileObject;
		import code.level.*;
	/*
	
	import flash.utils.*;
	import code.Information;

	import code.animators.PlantAnimator;
	import code.TileBox;
	import code.level.TileLogicObject;*/

	public class Plant extends TileObject
	{
		//protected var animator: PlantAnimator;

		public function Plant(row:int,line:int,brd:Board)
		{
			//tileBox: TileBox, hp:int = 300
			//super(tileBox, hp);
			super(row, line, brd, 300);
		}

		/*public function walkingTest(): String
		{
			if (alive)
			{
				beBitten();
				return "plantAvailable";
			}
			else
			{
				return "go";
			}
		}
		public function beBitten(): void
		{
			hp -= 5;
			trace(hp);
			if (hp <= 0)
			{
				alive = false;
				die();
				remove();
			}
		}
		protected function die(): void
		{

		}
		protected function remove(): void
		{
			tileBox.removePlant();
		}*/

	}
}