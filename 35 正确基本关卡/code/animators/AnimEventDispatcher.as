package code.animators
{
	import flash.events.EventDispatcher;
	import code.animators.AnimEvent;

	public class AnimEventDispatcher extends EventDispatcher
	{
		private var loaded: Boolean = false;
		public function AnimEventDispatcher()
		{}
		public function ifLoaded(): Boolean
		{
			return loaded;
		}

	}

}