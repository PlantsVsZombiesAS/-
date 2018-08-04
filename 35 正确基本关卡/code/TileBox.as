package code
{
	import code.plant.Plant;
	import code.level.*;
	import code.tilethings.*

	public class TileBox
	{
		private var content: TileObject;
		private var brd: Board;

		public function TileBox(brd: Board)
		{
			this.brd = brd;
		}
		
		public function addPlant(plant: Plant): void
		{
			if (content is Tomb)
			this.content = plant;
		}
	}
}