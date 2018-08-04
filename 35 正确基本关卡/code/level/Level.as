package code.level
{
	import code.level.*;
	import flash.utils.*;
	
	public class Level
	{
		protected var brd: Board = new Board();
		protected var drvs: Array = [];

		public function Level()
		{}
		public function traceLevel(): void
		{
			trace(Level1);
			//这个不能删
		}
		public static function newLevel(id: int): Level
		{
			var cls: Class = getDefinitionByName("code.level::Level" + id) as Class;
			return new cls();
		}
		public function getBoard(): Board
		{
			return brd;
		}

		//protected function  
		/*https://play.google.com/store/apps/details?id=free.vpn.unblock.proxy.vpnmaster
		https://play.google.com/store/apps/details?id=com.chengcheng.FreeVPN*/

	}

}