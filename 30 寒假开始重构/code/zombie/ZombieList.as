package code.zombie
{
	import code.tools.LinkedList;
	import code.zombie.Zombie;
	
	import code.tools.Node;

	public class ZombieList extends LinkedList
	{

		public function ZombieList()
		{
			super();
		}
		protected override function canAddIn(object: * ): Boolean
		{
			return object is Zombie;
		}
		public function peaTest(x: int): Boolean
		{
			var currentNode: Node = this.header;
			while (currentNode != null)
			{
				if (Zombie(currentNode.getData()).peaTest(x))
				{
					return true;
				}
				else
				{
					currentNode = currentNode.getNext();
				}

			}
			return false;
		}
		public function peashooterTest(x:int):Boolean
		{
			trace("peashooterTest");
			var currentNode: Node = this.header;
			while (currentNode != null)
			{
				trace("peashooterTest - yes");
				if (Zombie(currentNode.getData()).peashooterTest(x))
				{
					return true;
				}
				else
				{
					currentNode = currentNode.getNext();
				}

			}
			return false;
		}

	}

}