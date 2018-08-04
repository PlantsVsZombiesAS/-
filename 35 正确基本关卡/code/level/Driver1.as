package code.level
{
	import code.level.*;
	import code.plant.*;
	import code.animators.*;

	public class Driver1 extends Driver
	{
		public function Driver1(lvl: Level)
		{
			super(lvl);
		}
		public function go(): void
		{
			//trace("get Board：" + brd);
			//brd.addPea(2, 3);
			//brd.addPea(3, 5);
			Anim.getEventDispatcher().addEventListener("peashooter", loaded);
			Anim.init("peashooter");
		}
		private function loaded(e: AnimEvent): void
		{
			brd.addPlant(Peashooter, 2, 3);
			/*
			var p:Peashooter = brd.addPlant(Peashooter, 2, 4) as Peashooter;
			p.die();
			brd.addPlant(Peashooter, 2, 5);*/
		}
	}
}