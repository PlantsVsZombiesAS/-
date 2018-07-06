package code.animators
{

	//import code.animators.GAnimator;
	import flash.events.Event;
	import flash.geom.ColorTransform;
	import flash.display.MovieClip;

	public class ZombieAnimator extends MovieClip
	{
		private var clrTrsf: ColorTransform = new ColorTransform();

		public function ZombieAnimator()
		{
			// constructor code
		}


		public function hurt(): void
		{
			this.clrTrsf.redOffset = 100;
			this.clrTrsf.greenOffset = 100;
			this.clrTrsf.blueOffset = 100;
			this.transform.colorTransform = this.clrTrsf;
			addEventListener(Event.ENTER_FRAME, unhurt);
		}
		private function unhurt(e: Event): void
		{
			this.clrTrsf.redOffset -= 34;
			this.clrTrsf.greenOffset -= 34;
			this.clrTrsf.blueOffset -= 34;
			this.transform.colorTransform = this.clrTrsf;
			if (this.transform.colorTransform.redOffset < 0)
			{
				removeEventListener(Event.ENTER_FRAME, unhurt);
				this.clrTrsf.redOffset = 0;
				this.clrTrsf.greenOffset = 0;
				this.clrTrsf.blueOffset = 0;
				this.transform.colorTransform = this.clrTrsf;
			}
		}

		public function walk(startFrame: int = 0): void
		{

		}
		public function eat(): void
		{

		}

	}

}