package code.level
{
	import code.level.*;
	public class Level1 extends Level
	{
		public function Level1()
		{
			//trace("i'm a new level1");
			var d:Driver1 = new Driver1(this);
			drvs.push(d);
			d.go();
		}

	}

}