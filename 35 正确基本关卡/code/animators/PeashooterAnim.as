package code.animators
{
	import code.animators.Anim;
	import flash.display.MovieClip;

	import code.decrypt.*;

	public class PeashooterAnim extends Anim
	{
		public static const NAME: String = "peashooter";

		public function PeashooterAnim(visible: Boolean = true, x: int = 0, y: int = 0)
		{
			super(NAME, visible, x, y)
		}
		protected static function getName(): String
		{
			return NAME;
		}
	}
}