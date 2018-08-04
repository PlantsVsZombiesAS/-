package code.tools
{
	import code.tools.LinkedList;
	import code.thing.Pea;

	public class Node
	{
		private var data;
		private var prev;
		private var next;
		private var list: LinkedList;

		public function Node(list: LinkedList, data: Object, prev: Node, next: Node)
		{
			this.list = list;
			this.data = data;
			this.prev = prev;
			this.next = next;
		}

		public function getData(): Object
		{
			return this.data;
		}
		public function setData(data: Object): void
		{
			this.data = data;
		}
		public function getPrev(): Node
		{
			return this.prev;
		}
		public function setPrev(prev: Node): void
		{
			this.prev = prev;
		}
		public function getNext(): Node
		{
			return this.next;
		}
		public function setNext(next: Node): void
		{
			this.next = next;
		}

		public function remove(): void
		{
			if (list.getHeader() == list.getTail())
			{
				list.setHeader(null);
				list.setTail(null);
			}
			else
			{
				if (this.prev != null)
				{
					this.prev.next = this.next;
				}
				if (this.next != null)
				{
					this.next.prev = this.prev;
				}

				if (this.prev == null)
				{
					list.setHeader(this.next);
				}
				if (this.next == null)
				{
					list.setTail(this.prev);
				}
			}
		}
	}

}