var peas: PeaList = new PeaList(); //需要扩展LinkedList
var p:Pea = new Pea(); //需要继承INode
peas.add(p); //将p储存到链表peas里，避免垃圾回收。此时peas会p.setNode()：当想准备垃圾回收时，p利用自己的node.remove；


public class PeaList extends LinkedList
{
	public function PeaList()
	{
		super();
	}
	protected override function canAddIn(object: * ): Boolean
	{
		return object is Pea;
	}//定义可植入类型
}

public class Pea implements INode
{
	private var node: Node;

	public function Pea()
	{}
	public function setNode(node: Node): void
	{
		this.node = node;
	}
	private function remove(): void
	{
		this.node.remove();
	}
}