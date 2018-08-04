package code.animators
{
	//import flash.display.MovieClip;
	import flash.utils.setInterval;
	import code.Information;
	import flash.events.Event;
	import code.zombie.BasicZombie;
	import code.animators.ZombieAnimator;

	import flash.utils.*;

	public class BasicZombieAnimator extends ZombieAnimator
	{
		private var zombie: BasicZombie;
		private var xOffset: Number = 60;
		private var yOffset: Number = -48;
		private var scale: Number = .5;
		private var groundX: Number;
		private var movieId: uint;
		private var diedId: int;

		public function BasicZombieAnimator(row: int, zom: BasicZombie)
		{
			scaleX = scale;
			scaleY = scale;

			x = zom.getX();
			y = Information.getYAtRow(row) + yOffset;

			this.gotoAndPlay(1 + int(Math.random() * 5));

			zombie = zom;
		}

		public override function walk(startFrame: int = 0): void
		{
			gotoAndPlay("walking");
			gotoAndPlay(this.currentFrame + startFrame);
			groundX = ground.x;
			addEventListener(Event.ENTER_FRAME, walking);
		}

		public override function eat(): void
		{
			removeEventListener(Event.ENTER_FRAME, walking);
			gotoAndPlay("eat");
		}

		public function start(): void
		{
			this.walk(int(Math.random() * 20));
		}


		private function walking(e: Event): void
		{
			if (ground.x > -90)
			{
				this.x -= ground.x - groundX;
			}

			groundX = ground.x;
			zombie.setX(this.x + xOffset);
		}
		public function goToDie(): void
		{
			gotoAndPlay("death");
			removeEventListener(Event.ENTER_FRAME, walking);
		}
		private function tracer(value: * ): void
		{
			trace("[BasicZombieAnimator] " + String(value));
		}

	}

}