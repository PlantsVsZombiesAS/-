package code.animators
{

	import flash.display.MovieClip;
	import code.plant.Plant;
	import code.Information;

	public class PeashooterAnimator extends MovieClip
	{
		private var xOffset: Number = -160;
		private var yOffset: Number = -140;
		private var scale:Number = .55;
		
		public function PeashooterAnimator(row:int, line:int)
		{
			setScale(scale);
			x = Information.getXAtLine(line) + xOffset;
			y = Information.getYAtRow(row) + yOffset;
		}
		public function shoot():void
		{
			gotoAndPlay(25);
		}
		private static function tracer(value: * ): void
		{
			trace("[PeashooterAnimator] " + String(value));
		}

		private function setScale(scale: Number): void
		{
			scaleX = scale;
			scaleY = scale;
		}

	}

}