package code.animators
{
	import flash.display.MovieClip;
	import code.plant.Plant;
	import code.decrypt.*;
	import code.level.Level;

	public class PlantAnimator
	{
		protected var xOffset: Number = -160;
		protected var yOffset: Number = -140;
		protected var scale: Number = .55;
		protected var row: int;
		protected var line: int;
		protected var level: Level;

		protected var clip: MovieClip;

		public function PlantAnimator(row: int, line: int, level: Level)
		{
			this.row = row;
			this.line = line;
			this.level = level;
		}

		protected function setScale(scale: Number): void
		{
			this.clip.scaleX = scale;
			this.clip.scaleY = scale;
		}
		protected function addToStage():void
		{
			setScale(scale);
			this.clip.x = xOffset;
			this.clip.y = yOffset;
			//Main.getStage().addChild(this.clip);
			level.getStage().addPlant(this.clip, this.row, this.line);
		}
		public function removeToStage():void
		{
			level.getStage().removePlant(this.clip, this.row);
		}

	}

}