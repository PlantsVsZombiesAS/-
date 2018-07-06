package code.level
{
	import code.plant.Plant;
	import code.thing.Pea;
	import code.TileBox;
	import code.Information;
	import code.zombie.Zombie;
	import code.PlayingStage;
	import flash.display.MovieClip;
	
	import code.tools.LinkedList;

	public class Level
	{
		private var playingStage: PlayingStage;

		private var tileBoxes: Vector.<TileBox> = new Vector.<TileBox>(45, true);
		//创建45个格子的集合

		//剩下的都改成链表集合！！！都要改
		private var zombiesOnMap: Array = [
			[],
			[],
			[],
			[],
			[]
		];
		//private var peas: Array = [];
		
		private var peas:LinkedList = new LinkedList(Pea);

		public function Level()
		{
			for (var i: int = 0; i < 45; i++)
			{
				tileBoxes[i] = new TileBox();
			}
			playingStage = new PlayingStage();
		}

		public function addZombie(zombieClass: Class, row: int, x: int = 800): void
		{
			zombiesOnMap[row].push(new zombieClass(row, x, this));
		}
		public function addPlant(plantClass: Class, row: int, line: int): void //创造植物实例并添加到tileBox中
		{
			this.tileBoxes[Information.getIndexOn(row, line)].setPlant(new plantClass(row, line, this));
		}
		public function getZombies(row: int): Array
		{
			return zombiesOnMap[row];
		}

		public function getStage(): PlayingStage
		{
			return this.playingStage;
		}

		private static function tracer(value: * ): void
		{
			trace("[Level] " + String(value));
		}


		public function addPea(row:int, line:int): void
		{
			var pea:Pea = new Pea(row, line, this);
			pea.getNode(peas.add(pea));
		}
		/*public function removePeaById(id: int): void
		{
			for (var i: int = 0; i < peas.length; i++)
			{
				if (peas[i].getId() == id)
				{
					peas.removeAt(id);
					break;
				}
			}
		}*/
		
		public function removeZombieBy(row: int, id: int): void
		{
			for (var j: int = 0; j < zombiesOnMap[row].length; j++)
			{
				if (zombiesOnMap[row][j].getId() == id)
				{
					zombiesOnMap[row].removeAt(j);
					break;
				}
			}
		}
	}

}