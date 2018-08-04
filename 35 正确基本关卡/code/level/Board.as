package code.level
{
	import code.*;
	import code.TileBox;
	import code.thing.*;
	import code.tools.*;
	import flash.utils.*;
	import code.level.*;
	import code.level.RunList;
	import flash.events.Event;
	import code.plant.*;

	public class Board
	{
		//初始化：设置tileboxes以及相关getter，地图位置信息
		//private var tileBoxes: Vector.<TileBox> = new Vector.<TileBox>(50, true);
private var tileBoxes: Vector.<TileBox> = new Vector.<TileBox>(50, true);
		public function Board()
		{
			for (var i: int = 0; i < 50; i++)
			{
				tileBoxes[i] = new TileBox(this);
			}
			trace("level traciong tileboxes: " + tileBoxes);

			Main.getStage().addEventListener(Event.ENTER_FRAME, run);
		}
		public static const TILE_XS: Array = [-55, 27, 109, 191, 274, 356, 438, 520, 602, 685, 767];
		public static const TILE_YS: Array = [111, 207, 305, 402, 497, 593];
		public function getBoxAt(row: int, line: int): TileBox
		{
			return tileBoxes[row * 10 + line + 1]
		}
		public static function getLineAt(x: int): int
		{
			if (x <= TILE_XS[0])
			{
				return -2;
			}
			else
			{
				var i: int = 9;
				while (TILE_XS[i] > x)
				{
					i--;
				}
				return i;
			}
		}
		public static function getMidXAt(line: int): int
		{
			return TILE_XS[line] + 41;
		}
		public static function getLeftXAt(line: int):int
		{
			return TILE_XS[line + 1]
		}

		//添加植物（必须由Board来添加）
		public function addPlant(plantClass: Class, row: int, line: int): Plant
		{
			var plant: Plant = new plantClass(row, line, this);
			getBoxAt(row, line).addPlant(plant);
			return plant;
		}

		//豌豆子弹
		private var peas: PeaList = new PeaList();
		public function addPea(row: int, line: int): void
		{
			var p: Pea = new Pea(row, line, this);
			peas.add(p);
		}

		//中央ENTER_FRAME频率运行
		private var runs: RunList = new RunList();
		public function addToRun(obj: INode): void
		{
			runs.add(obj);
		}
		private function run(e: Event): void
		{
			var c: Node = runs.getHeader();
			while (c != null)
			{
				IRun(c.getData()).run();
				c = c.getNext();
			}
		}
	}
}