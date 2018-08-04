package code.tilethings
{
	import code.TileObject;
	import code.level.Board;

	public class Tomb extends TileObject
	{
		public function Tomb(row: int, line: int, brd: Board)
		{
			super(row, line, brd, 600);
		}

	}

}