package code.level
{
	import code.level.*;

	public class Driver
	{
		protected var ler: Leveller;
		protected var lvl: Level;
		public function Driver(ler: Leveller)
		{
			this.ler = ler;
			lvl = ler.getLevel();
		}

	}

}