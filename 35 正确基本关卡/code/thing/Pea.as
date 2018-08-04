package code.thing
{
	import flash.utils.*;
	//import code.zombie.Zombie;
	//import code.level.Level;
	//import code.animators.PeaAnimator;
	import code.tools.*;
	import code.level.*;

	public class Pea implements INode, IRun
	{
		public static const SPEED: int = 8;

		private static var currentId: int = 0;
		private var id: int;

		private var row: int;
		private var x: int;

		//private var animator: PeaAnimator;
		/*private var runId: int;
		private var popId: int;
		private var popedId: int;*/

		private var brd: Board;
		private var node: Node;

		public function Pea(row: int, line: int, brd: Board)
		{
			id = currentId++;
			//nextId++;
			this.row = row;
			this.x = Board.getMidXAt(line);//#off#
			this.brd = brd;

			brd.addToRun(this);
			/*//animator = new PeaAnimator(row, this.x);
			Main.getStage().addChild(animator);

			runId = setInterval(run, 15);
			popId = setTimeout(pop, 3000);*/
		}

		public function setNode(node: Node): void
		{
			this.node = node;
		}
		public function toString(): String
		{
			return "[pea{row:" + row + ", x:" + x + "}]";
		}

		public function run(): void
		{
			x += SPEED;
			//trace("pea" + id + ".x: " + x);
		}
		/*private function run(): void
		{
			x += speed;
			animator.setX(x);

			/*var zombies: Array = level.getZombies(row);
			for (var i: int; i < zombies.length; i++)
			{
				var zombie: Zombie = zombies[i] as Zombie;
				if (zombie.hitTestPea(this.x))
				{
					pop();
					zombie.withPea();
					break;
				}
			}
			if (this.level.peaTest(row, x))
			{
				pop();
			}
		}*/
		/*public function pop(): void
		{
			clearTimeout(runId);
			clearTimeout(popId);
			popedId = setTimeout(poped, 1500);
			animator.pop();
		}*/
		/*private function poped(): void
		{
			Main.getStage().removeChild(animator);
			animator = null;
			trace(this.node);
			this.node.remove();
		}*/
		/*public function getId(): int
		{
			return this.id;
		}*/


	}

}