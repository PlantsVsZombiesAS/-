package code
{
	import code.animators.*;
	import code.plant.*;
	import flash.display.Graphics;

	public class Information
	{
		public static const BIRTHDAY: int = 0;

		public static const LAND_BASIC: int = 0;
		public static const LAND_WATER: int = 1;
		public static const LAND_HOLE: int = 2;

		public static const TILE_WIDTH: Number = 740 / 9;
		public static const HALF_TILE_WIDTH:Number = 740 / 18;

		public static const TILE_XS: Array = [27, 109, 191, 274, 356, 438, 520, 602, 685, 767];
		public static const TILE_YS: Array = [111, 207, 305, 402, 497, 593];

		public function Information()
		{}
		public static function getIndexOn(row: int, line: int): int
		{
			return row * 9 + line;
		}
		public static function getLineByIndex(index: int): int
		{
			return index % 9;
		}
		public static function getRowByIndex(index: int): int
		{
			return int(index / 9);
		}

		public static function getLeftLineAtX(x: int): int
		{
			if (x <= TILE_XS[0])
			{
				return -1;
			}
			else
			{
				var i:int = 9;
				while (TILE_XS[i] > x)
				{
					i--;
				}
				return i;
			}

		}
		/*public static function getXAtLine(line: int): Number
		{
			return TILE_XS[line]
		}
		public static function getYAtRow(row: int): Number
		{
			return 190 + row * 95;
		}*/

		public static function getTime(): String
		{
			var date: Date = new Date();
			return String(date.seconds) + "." + String(date.milliseconds) + " ";
		}
	}

}