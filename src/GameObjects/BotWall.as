package GameObjects 
{
	/**
	 * ...
	 * @author Kramboja | |Koen van der Velden
	 */
	public class BotWall extends GameObj
	{
		
		public function BotWall() 
		{
			super(new Art_Wall_Bot());
		}
		
		override public function onCollide(other:GameObj):void 
		{
			while (willCollide(other)) 
			{
				other.y--;
			}
		}
	}

}