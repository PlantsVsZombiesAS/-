package code.tools
{
	import code.tools.Node;

	public class LinkedList
	{
		protected var header: Node;
		protected var tail: Node;

		public function LinkedList()
		{
			this.header = null;
			this.tail = null;
		}
		protected function canAddIn(object: * ): Boolean
		{
			return false; // please override
		}

		public function add(object: INode): void
		{
			if (canAddIn(object))
			{
				if (this.header == null)
				{
					this.header = new Node(this, object, null, null);
					this.tail = this.header;
					object.setNode(this.header);
				}
				else
				{
					var temp: Node = new Node(this, object, this.tail, null);
					this.tail.setNext(temp);
					this.tail = temp;
					object.setNode(temp);
				}
			}
			else
			{
				throw new Error("LinkedList Error");
			}
		}
		public function getHeader(): Node
		{
			return this.header;
		}
		public function getTail(): Node
		{
			return this.tail;
		}
		public function setHeader(header: Node): void
		{
			this.header = header;
		}
		public function setTail(tail: Node): void
		{
			this.tail = tail;
		}
		
		/*public function getNodes(): Array
		{
			var currentNode: Node = this.header;
			var data: Array = new Array();
			while (currentNode != null)
			{
				data.push(currentNode.getData());
				currentNode = currentNode.getNext();
			}
			return data;
		}

		public function ifAnyNode(task: Function): void
		{
			var currentNode: Node = this.header;
			var data: Array = new Array();
			while (currentNode != null)
			{
				data.push(currentNode.getData());
				currentNode = currentNode.getNext();
			}
			return data;
		}*/

	}
}