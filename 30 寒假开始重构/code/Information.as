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

		public static const tileLength: Number = 740 / 9;
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

		public static function getXAtLine(line: int): Number
		{
			return 68 + line * 82.2;
		}
		public static function getYAtRow(row: int): Number
		{
			return 190 + row * 95;
		}
		public static function getLineAtX(x: Number): int
		{
			return int((x - 26.9) / 82.2);
			//68 - 41.1 = 26.9
		}
		public static function getTime(): String
		{
			var date: Date = new Date();
			return String(date.seconds) + "." + String(date.milliseconds) + " ";
		}
	}

}