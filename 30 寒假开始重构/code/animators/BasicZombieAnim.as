package code.animators
{
	import code.animators.Anim;

	public class BasicZombieAnim extends Anim
	{
		public static const NAME: String = "basic_zombie";
		private var type: int;

		public function BasicZombieAnim(type: int, visible: Boolean = true, x: int = 0, y: int = 0)
		{
			super(NAME, visible, x, y)

			this.type = type;
			changeType(type);
		}


		//需要效率提升
		public function changeType(type: int): void
		{
			initBasic();
			if (type > 6)
			{
				toFlag();
				if (type == 8)
				{
					_mc.nl1.visible = false;
					_mc.nl2.visible = false;
				}
			}
			else
			{
				initBasic();
				if (type > 3)
				{
					_mc.bucket.visible = true;
					_mc.bucket.gotoAndStop(type - 3);
				}
				else if (type > 0)
				{
					_mc.cone.visible = true;
					_mc.cone.gotoAndStop(type);
				}
				else if (type == -1)
				{
					_mc.nl1.visible = false;
					_mc.nl2.visible = false;
				}
			}
		}

		private function initBasic(): void
		{
			_mc.cone.visible = false;
			_mc.bucket.visible = false;

			_mc.nl1.visible = true;
			_mc.nl2.visible = true;

			_mc.nr1.visible = true;
			_mc.nr2.visible = true;
			_mc.nr3.visible = true;

			_mc.fr1.visible = false;
			_mc.fr2.visible = false;
			_mc.fr3.visible = false;
			_mc.fr4.visible = false;
			_mc.fr5.visible = false;
			_mc.fr6.visible = false;
		}
		private function toFlag(): void
		{
			_mc.cone.visible = false;
			_mc.bucket.visible = false;

			_mc.nl1.visible = true;
			_mc.nl2.visible = true;

			_mc.nr1.visible = false;
			_mc.nr2.visible = false;
			_mc.nr3.visible = false;

			_mc.fr1.visible = true;
			_mc.fr2.visible = true;
			_mc.fr3.visible = true;
			_mc.fr4.visible = true;
			_mc.fr5.visible = true;
			_mc.fr6.visible = true;
		}
	}

}