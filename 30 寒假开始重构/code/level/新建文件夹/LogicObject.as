package code.level
{
	import code.level.Level;

	public class LogicObject
	{
		protected var row: int;
		protected var x: Number;
		protected var level: Level;
		protected var hp: int;
		protected var alive:Boolean = true;

		public function LogicObject(row: int, x: Number, level: Level, hp:int = 1)
		{
			this.row = row;
			this.x = x;
			this.level = level;
			this.hp = hp;
		}
		public function hitTestPea(peaX: Number): Boolean
		{
			if (this.alive)
			{
				if (Math.abs(this.x - peaX) < 30)
				{
					return true;
				}
				else
				{
					return false;
				}
			}
			else
			{
				return false;
			}
		}
	}

}