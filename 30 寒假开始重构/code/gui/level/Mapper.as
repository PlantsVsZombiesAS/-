package code.gui.level
{

	import flash.display.MovieClip;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.events.Event;
	import flash.display.Bitmap;
	import flash.display.Loader;

	//import code.Information;

	public class Mapper extends MovieClip
	{

		private var loader: Loader;

		public function Mapper(item: String)
		{
			loader = new Loader();
			loader.load(new URLRequest("library/background_" + item + ".png"));
			Main.getStage().addChild(loader);
		}
	}
}