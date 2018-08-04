package code.plant
{
	//import flash.utils.*;
	import code.plant.Plant;
	import code.animators.$PlantPrototype$Animator;
	import code.zombie.Zombie;
	import code.level.Level;

	public class PlantPrototype extends Plant
	{
		private var theAnimator: PlantPrototypeAnimator;
		//[Prototype]植物自己需要的属性放在下面

		public function PlantPrototype(row: int, line: int, level: Level)
		{
			//[Prototype]START
			super(row, line, level);
			theAnimator = new PeashooterAnimator(this.row, this.line, level);
			animator = theAnimator;
			//[Prototype]END
		}
		//[Prototype]植物自己需要的代码放在下面

	}

}