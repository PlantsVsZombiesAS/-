package code.plant
{
	/*import flash.utils.*;
	import code.plant.Plant;
	import code.animators.PeashooterAnimator;
	import code.zombie.Zombie;
	import code.thing.Pea;
	import code.level.Level;
	import code.TileBox;*/
	import code.level.*;
	import code.animators.*;
	public class Peashooter extends Plant
	{
		//这里需要继承
		private var anim:PeashooterAnim;
		
		public function Peashooter(row: int, line: int, brd: Board)
		{
			super(row, line, brd);
			//animator = new PeashooterAnimator(tileBox.getRow(), tileBox.getLine(), level);
			trace("peashooter!");
			trace("  at:" + row + line);
			
			trace("Peashooter" + line+  " creating anim.");
			anim = new PeashooterAnim(true);
			//anim.setX(Information.TILE_XS[line]);
		}

		private function loaded(e: AnimEvent): void
		{
			//r a: PeashooterAnim = new PeashooterAnim(true);
			//setX(Information.TILE_XS[line]);
		}
		public function die():void
		{
			//die code%%%
			anim.done();
			anim = null;
		}
		/*
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
		}*/
	}
}