package GameObjects 
{
	import flash.display.MovieClip;
	
	/**
	 * ...
	 * @author FDH
	 */
	public class Paddle extends GameObj 
	{
		public var MaxYBounce:Number = 1;
		
		
		public function Paddle(art:MovieClip) 
		{
			super(art);
			
		}
		
		override public function onCollide(other:GameObj):void 
		{
			if (other is Ball)
			{
				// Calc offset in y axis from middle
				var offsetY:Number = other.y - this.y;
				// Calculate the bounce in y axis
				var yDir:Number = offsetY / (height / 2) * MaxYBounce;
				// Apply dir
				(other as Ball).Direction.y = yDir;
			}
			else
			{
				// Top Collision
				while (other.hitTestPoint(x, y - height / 2, true)) y++;
				// Bottom Collision
				while (other.hitTestPoint(x, y + height / 2 - 1, true)) y--;
			}
		}
		
	}

}