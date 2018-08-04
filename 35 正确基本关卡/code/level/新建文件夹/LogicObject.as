package code
{
	public class LogicObject
	{
		protected var row: int;
		protected var x1: int;
		protected var x2: int;
		protected var brd: Board;
		protected var hp: int;
		protected var alive: Boolean = true;

		public function LogicObject(row: int, x1: int, x2: int, brd: Board, hp: int = 1)
		{
			this.row = row;
			this.x1 = x1;
			this.x2 = x2;
			this.brd = Board;
			this.hp = hp;
		}
		public function hitTestPea(peaX: Number): Boolean
		{
			return (this.alive && ifIntIn(peaX, x1, x2));
		}
		public static function ifIntIn(x: int, a: int, b: int): Boolean
		{
			return x >= a && x <= b;
		}
	}
}