package code
{
	import flash.display.MovieClip
	import code.Information;

	public class PlayingStage
	{
		//private var lawn: MovieClip;

		private var plantsInRows: Vector.<MovieClip> = new Vector.<MovieClip>(5, true);

		public function PlayingStage()
		{
			for (var i: int = 0; i < 5; i++)
			{
				plantsInRows[i] = new MovieClip();
				plantsInRows[i].y = Information.getYAtRow(i);
				Main.getStage().addChild(plantsInRows[i]);
			}
			//lawn = new MovieClip();
		}

		public function addPlant(clip: MovieClip, row: int, line: int): void
		{
			clip.x += Information.getXAtLine(line);
			plantsInRows[row].addChild(clip);
		}

	}

}