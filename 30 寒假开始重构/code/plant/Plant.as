package code.plant
{
	import code.LogicObject;
	import flash.utils.*;
	import code.Information;
	import code.level.Level;
	import code.animators.PlantAnimator;
	import code.TileBox;
	import code.level.TileLogicObject;

	public class Plant extends TileLogicObject
	{
		protected var animator: PlantAnimator;

		public function Plant(tileBox: TileBox, hp:int = 300)
		{
			super(tileBox, hp);
		}

		public function walkingTest(): String
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
		}

	}
}