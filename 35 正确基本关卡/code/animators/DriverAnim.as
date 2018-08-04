package code.animators
{
	import code.animators.*;

	public class DriverAnim
	{
		private static var anim: BasicZombieAnim;

		public function DriverAnim()
		{
			createAnimAndOnScrren();
		}

		private function createAnimAndOnScrren(): void
		{
			//Before newing Anim, load the Anim you need.
			Anim.getEventDispatcher().addEventListener("basic_zombie", loaded);
			Anim.init("basic_zombie");
						Anim.getEventDispatcher().addEventListener("peashooter", loaded);
			Anim.init("peashooter");
		}
		private function loaded(e: AnimEvent): void
		{
			//from now on, you can create the anim. (must've been loaded)
			anim = new BasicZombieAnim(0, true, Math.random() * 700 + 50, Math.random() * 500 + 50);
			anim = new BasicZombieAnim(1, true, Math.random() * 700 + 50, Math.random() * 500 + 50);
			anim = new BasicZombieAnim(2, true, Math.random() * 700 + 50, Math.random() * 500 + 50);
			anim = new BasicZombieAnim(3, true, Math.random() * 700 + 50, Math.random() * 500 + 50);
			anim = new BasicZombieAnim(4, true, Math.random() * 700 + 50, Math.random() * 500 + 50);
			anim = new BasicZombieAnim(5, true, Math.random() * 700 + 50, Math.random() * 500 + 50);
			anim = new BasicZombieAnim(6, true, Math.random() * 700 + 50, Math.random() * 500 + 50);
			anim = new BasicZombieAnim(7, true, Math.random() * 700 + 50, Math.random() * 500 + 50);
			anim = new BasicZombieAnim(8, true, Math.random() * 700 + 50, Math.random() * 500 + 50);
			anim = new BasicZombieAnim(-1, true, Math.random() * 700 + 50, Math.random() * 500 + 50);
			new PeashooterAnim(true, 5, 150);
		}
	}
}