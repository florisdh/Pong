package GameObjects 
{
	/**
	 * ...
	 * @author Kramboja | |Koen van der Velden
	 */
	public class TopWall extends GameObj
	{
		
		public function TopWall() 
		{
			super(new Art_Wall_Top());
		}
		
		override public function onCollide(other:GameObj):void 
		{
			while (willCollide(other)) 
			{
				other.y++;
			}
		}
	}
}