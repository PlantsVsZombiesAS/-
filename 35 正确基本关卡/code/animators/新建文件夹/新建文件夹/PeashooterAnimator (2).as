package code.animators
{
	import flash.display.MovieClip;
	import code.plant.Plant;
	import code.animators.PlantAnimator;
	import code.decrypt.*;
	import code.level.Level;

	public class PeashooterAnimator extends PlantAnimator
	{
		private var loader: LoaderAndDecryptor;

		public function PeashooterAnimator(row: int, line: int, level: Level)
		{
			super(row, line, level);
			xOffset = -160;
			yOffset = -140;
			this.loader = new LoaderAndDecryptor("peashooter");
			loader.addEventListener(LoadingAndDecryptingEvent.COMPLETE, onComplete);
			loader.load();
		}

		private function onComplete(e: LoadingAndDecryptingEvent): void
		{
			this.clip = loader.getData() as MovieClip;
			loader.deleteData();
			addToStage();
		}

		public function shoot(): void
		{
			this.clip.gotoAndPlay("shoot");
		}
		public function die():void
		{
			removeToStage();
		}
	}

}