package code.thing
{
	import code.tools.LinkedList;
	import code.thing.Pea;

	public class PeaList extends LinkedList
	{
		public function PeaList()
		{
			super();
		}
		protected override function canAddIn(object: * ): Boolean
		{
			return object is Pea;
		}

	}

}