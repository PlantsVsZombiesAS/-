package code.zombie
{
	import flash.utils.*;
	import code.animators.BasicZombieAnimator;
	import code.Information;
	import flash.events.Event;
	import code.level.Level;

	/*僵尸本体类旗下的子类基础僵尸，大部分功能在父类Zombie实现。*/

	public class BasicZombie extends Zombie
	{
		public static const HALF_HEIGHT: Number = 50;

		private var basicAnimator: BasicZombieAnimator;

		public function BasicZombie(row: int, x: int, level: Level)
		{
			super(row, x, level);

			basicAnimator = new BasicZombieAnimator(row, this);
			animator = basicAnimator;
			Main.getStage().addChild(animator);
			
			basicAnimator.start();
			Main.getStage().addEventListener(Event.ENTER_FRAME, walkingTest);
		}

		private function died(): void
		{
			clearTimeout(diedId);

			trace(animator);
			Main.getStage().removeChild(animator);
			animator = null;
			this.node.remove();
		}
		protected override function goToDie(): void
		{
			clearTimeout(plantTestId);
			this.diedId = setTimeout(died, 2500);
			this.hp = 0;
			this.alive = false;
			basicAnimator.goToDie();
		}
		protected override function walk(): void
		{
			basicAnimator.walk();
		}
		protected override function eat(): void
		{
			basicAnimator.eat();
		}

		public function setX(x: Number): void
		{
			super.x = x;
		}

		private function tracer(value: * ): void
		{
			trace("[BasicZombie] " + String(value));
		}
	}

}