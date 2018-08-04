package code.level
{
	import code.level.*;
	import flash.utils.*;
	public class Leveller
	{
		protected var lvl: Level = new Level();
		protected var drvs: Array = [];

		public function Leveller()
		{}
		public function getLevellers(): void
		{
			trace(Leveller1);
			//这个不能删
		}
		public static function newLeveller(id: int): Leveller
		{
			var cls: Class = getDefinitionByName("code.level::Leveller" + id) as Class;
			return new cls();
		}
		public function getLevel(): Level
		{
			return lvl;
		}

		//protected function  
		/*https://play.google.com/store/apps/details?id=free.vpn.unblock.proxy.vpnmaster
		https://play.google.com/store/apps/details?id=com.chengcheng.FreeVPN*/

	}

}