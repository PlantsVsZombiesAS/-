package code.level
{

	import code.level.*;
	public class Leveller1 extends Leveller
	{

		public function Leveller1()
		{
			trace(1);
			var d:Driver1 = new Driver1(this);
			drvs.push(d);
			d.go();
		}

	}

}