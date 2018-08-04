package code.level
{
	import code.plant.Plant;
	import code.Information;
	import code.tools.Marker;
	import code.level.Level;

	public class TileBox
	{
		private var plant: Plant;
		private var level: Level;

		private var line: int;
		private var row: int;

		public function TileBox(level: Level, row: int, line: int)
		{
			this.level = level;
			setRow(row);
			setLine(line);
		}
		public function getPlant(): Plant
		{
			return plant;
		}
		public function setPlant(plant: Plant): void
		{
			this.plant = plant;
		}
		public function walkingTest(): String
		{
			if (plant != null)
			{
				return plant.walkingTest();
			}
			else
			{
				return "go";
			}
		}
		public function removePlant(): void
		{
			plant = null;
		}
		public function getLevel(): Level
		{
			return level;
		}
		public function setRow(row: int): void
		{
			this.row = row;
		}
		public function getRow(): int
		{
			return this.row;
		}
		public function setLine(line: int): void
		{
			this.line = line;
		}
		public function getLine(): int
		{
			return this.line;
		}
	}

}