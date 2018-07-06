package
{
	import flash.events.Event;
	import flash.display.MovieClip;
	import flash.display.Stage;
	//import code.Information;
	import code.level.Leveller;

	public class Main extends MovieClip
	{
		private static var stage: Stage;
		//private static var driver: DriverAnim;
		private static var lvl: code.level.Leveller;


		public function Main()
		{
			this.addEventListener(Event.ADDED_TO_STAGE, init);
		}
		private function init(e: Event): void
		{
			stage = stage;

			this.removeEventListener(Event.ADDED_TO_STAGE, init);
			//driver = new DriverAnim();
			trace(0);
			lvl = Leveller.newLeveller(1);
		}
		public static function back():void
		{
			trace(-1);
		}

		public static function getStage(): Stage
		{
			return stage;
		}
	}
}