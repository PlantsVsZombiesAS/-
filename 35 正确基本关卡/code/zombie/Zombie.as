package code.zombie
{
	import code.LogicObject;
	import flash.utils.*;
	import code.level.Level;
	import code.Information;
	import code.Maths;
	import code.animators.ZombieAnimator;
	import code.tools.INode;
	import code.tools.Node;
	import flash.events.Event;
	import code.tools.Marker;

	/*僵尸本体类：管理僵尸状态，提供攻击检测判断、受攻击等的功能，会主动吃植物###
	受攻击的方法大多都有特定的名称，最后教交给减血方法hurt；
	提供僵尸信息，均可直接调用；
	抽象类：goToDie()*/

	public class Zombie extends LogicObject implements INode
	{
		//继承
		private static var nextId: int = 0;
		private var id: int;
		///继承

		//僵尸公用		
		private static const WALKING: int = 0;
		private static const EATING: int = 1;
		private var task: int;

		protected var walkIntervalId: uint;

		protected static var speed = Information.tileLength / 3;

		protected var plantTestId: int;
		protected var diedId: int;

		//public static const HALF_HEIGHT: int = 50;

		protected var animator: ZombieAnimator;

		protected var node: Node;

		public function Zombie(row: int, x: int, level)
		{
			super(row, x, level, 210);
			this.id = nextId;
			nextId++;
			this.x = x;
			this.row = row;
			this.level = level;
		}
		protected function walkingTest(e: Event): void
		{
			trace("Information line:" + Information.getLineAtX(x));
			trace("hp: " + hp);
			var marker: Marker = new Marker(x, Information.getYAtRow(row));
			if (task == WALKING)
			{
				/*if (level.walkingTest(row, x) == "plantAvailable")
				{
					trace("eat!");
					eat();
					walking = false;
				}*/
			}
			else
			{
				if (level.walkingTest(row, x) == "go")
				{
					walk();
					task = WALKING;
				}
			}
		}

		protected function walk(): void
		{}
		protected function eat(): void
		{}


		public function getId(): int
		{
			return this.id;
		}

		public function getX(): int
		{
			return this.x;
		} //豌豆子弹判断


		private function hurt(hp: Number): void
		{
			this.hp -= hp;
			if (this.hp < 0)
			{
				this.goToDie();
			}
			animator.hurt();
		}

		protected function goToDie(): void
		{
			throw new Error(getQualifiedClassName(this) + ".goToDie is abstract");
		}

		public function setNode(node: Node): void
		{
			this.node = node;
		}
		public function peaTest(x: int): Boolean
		{
			if (x >= this.x && x <= this.x + 30 && this.hp > 0)
			{
				//trace("truetestiong" + x);
				this.hurt(50);
				return true;
			}
			else
			{
				//trace("falsetestiong" + x);
				return false;
			}
		}
		public function peashooterTest(x: int): Boolean
		{
			return x <= this.x;
		}
	}
}