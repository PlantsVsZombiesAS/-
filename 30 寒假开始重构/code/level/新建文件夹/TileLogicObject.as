package code.level
{
	import code.LogicObject;
	import code.TileBox;

	public class TileLogicObject extends LogicObject
	{
		protected var tileBox: TileBox;
		
		public function TileLogicObject(tileBox: TileBox, hp:int = 1)
		{
			super(tileBox.getRow(), Information.getXAtLine(tileBox.getLine()), tileBox.getLevel(), hp);
			this.tileBox = tileBox;
		}

	}

}