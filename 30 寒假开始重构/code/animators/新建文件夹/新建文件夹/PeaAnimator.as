package code.animators
{
	import flash.display.MovieClip;
	import code.Information;

	public class PeaAnimator extends MovieClip
	{
		public function PeaAnimator(row: int, x: Number)
		{
			this.x = x;
			this.y = Information.getYAtRow(row) - 40;
		}
		public function setX(x: Number): void
		{
			this.x = x;
		}
		public function pop():void
		{
			this.play();
		}
	}

}