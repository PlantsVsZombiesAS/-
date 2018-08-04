package code
{
	import code.level.*;

	public class TileObject extends LogicObject
	{
		protected var line: int;
		public function TileObject(row: int, line: int, brd: Board, hp: int = 1)
		{
			super(row, Board.getLeftXAt(line), Board.getLeftXAt(line+1), brd, hp);
			this.line = line;
		}
	}
}