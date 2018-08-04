package code.level
{
	import code.level.*;

	public class Driver
	{
		protected var lvl: Level;
		protected var brd: Board;
		public function Driver(lvl: Level)
		{
			this.lvl = lvl;
			brd = lvl.getBoard();
		}

	}

}