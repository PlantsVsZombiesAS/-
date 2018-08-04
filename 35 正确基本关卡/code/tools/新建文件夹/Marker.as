package code.tools
{

	public class Marker
	{

		public function Marker(x: int, y: int)
		{
			var mark: Markaa = new Markaa();
			mark.x = x;
			mark.y = y;
			Main.getStage().addChild(mark);
		}

	}

}