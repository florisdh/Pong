package GameObjects 
{
	import flash.events.Event;
	import GameObjects.Ball;
	/**
	 * ...
	 * @author Kramboja | |Koen van der Velden
	 */
	public class Enemy extends GameObj
	{
		private var _bal:Ball;
		private var _Speed:int = 1;
		
		public function Enemy(bal:Ball) 
		{
			super(new Art_Player2());
			_bal = bal;
		}
		
		public override function update(e:Event = null):void
		{
			var offsetY:Number = _bal.y - this.y;
			
			if (offsetY < 0)
			{
				offsetY = Math.min(offsetY, -_Speed);
			}
			else
			{
				offsetY = Math.max(offsetY, _Speed);
			}
			y += offsetY;
		}
	}
}