package code.animators
{
	import flash.display.MovieClip;
	import code.animators.*;
	import code.decrypt.*;

	public class Anim
	{
		private static var id: int = 0;

		//static
		//对象池 加解密加载
		private static var _loaders = {};
		private static var _mcs = {};
		private static var _loader: LoaderAndDecryptor;
		private static var _eventDispatcher: AnimEventDispatcher = new AnimEventDispatcher();
		//private static var _staticMc: MovieClip;

		private static var copyNumber = {};
		private static var copyAvailable = {};
		private static var copies = [];

		//mc信息
		protected var _mc: MovieClip;
		protected var type: String;
		protected var copyId: int;

		/* CHIRLDREN NOTES
		
		public static const NAME: String = "peashooter?";
		
		public function Peashooter?Anim(visible: Boolean = true, x: int = 0, y: int = 0)
		{
			super(NAME, visible, x, y)
		}
		#56#
		
		CHIRLDREN NOTES */


		//static加解密和加载
		/*#确保有动画
		 *侦听动画加载信息：对Anim.getEventDispatcher()侦听"动画名"的事件；加载好时会调用其方法。若有动画，就会调用上述侦听器预留的方法
		 *请求确保有动画：static调用init("动画名")
		 */
		/*#创建动画（在确保有动画的前提下
		 *直接使用该类的构造函数即可。
		 */
		public static function init(item: String): void
		{
			if (item in copyNumber)
			{
				_eventDispatcher.dispatchEvent(new AnimEvent(item));
			}
			else
			{
				var loader: LoaderAndDecryptor = new LoaderAndDecryptor(item);
				_loaders[item] = loader;
				loader.addEventListener(item, _onComplete);
				loader.load();
			}

		}
		private static function _onComplete(e: LoadingAndDecryptingEvent): void
		{
			copyNumber[e.type] = 0;
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
			this.type = item;
			if (!item in copyNumber)
			{
				throw new Error("Anim: _staticMc == null，但要求实例化");
			}
			else
			{
				var length: int = copyNumber[item];
				for (var i: int = 0; i < length; i++)
				{
					if (copyAvailable[item + i])
					{
						_mc = copies[item + i];
						copyAvailable[item + i] = false;
						copyId = i;
						break;
					}
				}
				if (_mc == null)
				{
					_mc = new _mcs[item].constructor();
					copies[item + length] = _mc;
					copyAvailable[item + length] = false;
					copyNumber[item]++;
					copyId = length;

					Main.getStage().addChild(_mc);
				}
			}
			id++;
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
		public function done(): void
		{
			copyAvailable[type + copyId] = true;
			//trace();
			_mc.x = 0;
			_mc.y = 0;
			_mc.visible = true;
		}
	}
}