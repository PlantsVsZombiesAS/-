package code.decrypt
{
	import flash.events.Event;

	public class LoadingAndDecryptingEvent extends Event
	{

		//public static const COMPLETE:String = "complete";
		public function LoadingAndDecryptingEvent(type:String, bubbles:Boolean = false, cancelable:Boolean = false)
		{
			super(type, bubbles, cancelable);
		}

	}

}