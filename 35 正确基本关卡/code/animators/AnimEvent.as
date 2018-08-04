package code.animators
{
	import flash.events.Event;

	public class AnimEvent extends Event
	{
		//public static const COMPLETE: String = "complete";
		
		public function AnimEvent(type: String, bubbles: Boolean = false, cancelable: Boolean = false)
		{
			super(type, bubbles, cancelable);
		}

	}

}