package code.plant
{
	import flash.utils.*;
	import code.plant.Plant;
	import code.animators.PeashooterAnimator;
	import code.zombie.Zombie;
	import code.thing.Pea;
	import code.level.Level;
	import code.TileBox;

	public class Peashooter extends Plant
	{
		private var ifShootId: int;
		private var shootId: int;
		private var shootTimeoutId: int;

		public function Peashooter(tileBox: TileBox)
		{
			super(tileBox);
			animator = new PeashooterAnimator(tileBox.getRow(), tileBox.getLine(), level);

			ifShootId = setInterval(ifShoot, 1500);
		}


		private function ifShoot(): void
		{
			trace("ifShoot");
			if (level.peashooterTest(row, x))
			{
				trace("ifShoot - yes");
				PeashooterAnimator(animator).shoot();
				shootTimeoutId = setTimeout(shoot, 450);
			}
		}

		private function shoot(): void
		{
			level.addPea(tileBox.getRow(), tileBox.getLine());
			clearTimeout(shootTimeoutId);
		}
		
		protected override function die():void
		{
			clearInterval(ifShootId);
			clearTimeout(shootTimeoutId);
			trace("Peashooter Die");
			PeashooterAnimator(this.animator).die();
		}
	}
}