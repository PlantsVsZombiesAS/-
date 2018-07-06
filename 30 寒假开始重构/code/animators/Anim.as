package code.animators
{
	import flash.display.MovieClip;
	import code.animators.*;
	import code.decrypt.*;

	public class Anim
	{
		//static加解密和加载
		private static var _loaders = {};
		private static var _mcs = {};
		private static var _loader: LoaderAndDecryptor;
		private static var _eventDispatcher: AnimEventDispatcher = new AnimEventDispatcher();
		private static var _staticMc: MovieClip;

		//mc信息
		protected var _mc: MovieClip;

		/* CHIRLDREN NOTES
		
		public static const NAME: String = "peashooter?";
		
		public function Peashooter?Anim(visible: Boolean = true, x: int = 0, y: int = 0)
		{
			super(NAME, visible, x, y)
		}
		
		CHIRLDREN NOTES */


		//static加解密和加载
		public static function init(item: String): void
		{
			var loader: LoaderAndDecryptor = new LoaderAndDecryptor(item);
			_loaders[item] = loader;
			loader.addEventListener(item, _onComplete);
			loader.load();
		}
		private static function _onComplete(e: LoadingAndDecryptingEvent): void
		{
			_mcs[e.type] = _loaders[e.type].getData() as MovieClip;

			_loaders[e.type].deleteData();
			_loaders[e.type] = null;
			_eventDispatcher.dispatchEvent(new AnimEvent(e.type));
		}
		public static function getEventDispatcher(): AnimEventDispatcher
		{
			return _eventDispatcher;
		}


		//加载完后实例化
		public function Anim(item: String, visible: Boolean = true, x: int = 0, y: int = 0)
		{
			if (_mcs[item] == null)
			{
				throw new Error("Anim: _staticMc == null，但要求实例化");
			}
			else
			{
				_mc = new _mcs[item].constructor();
				Main.getStage().addChild(_mc);
				trace("##Anim: change to playing stage");

				_mc.x = x;
				_mc.y = y;
				_mc.visible = visible;
			}
		}

		public function setX(x: int): void
		{
			_mc.x = x;
		}
		public function getX(): int
		{
			return _mc.x;
		}
		public function setY(y: int): void
		{
			_mc.y = y;
		}
		public function getY(): int
		{
			return _mc.y;
		}
		public function setVisible(visible: Boolean): void
		{
			_mc.visible = visible;
		}
		public function getVisible(): Boolean
		{
			return _mc.visible;
		}
	}
}