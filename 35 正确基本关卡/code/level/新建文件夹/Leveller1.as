package code.level
{

	import code.level.*;
	public class Level1 extends Level
	{

		public function Level1()
		{
			trace(1);
			var d:Driver1 = new Driver1(this);
			drvs.push(d);
			d.go();
		}

	}

}