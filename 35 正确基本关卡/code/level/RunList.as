package code.level
{
	import code.tools.*;
	import code.level.*;
	public class RunList extends LinkedList
	{
		public function RunList()
		{
			super();
		}
		protected override function canAddIn(object: * ): Boolean
		{
			return object is IRun;
		}

	}

}