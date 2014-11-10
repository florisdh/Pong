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
		private var _Speed:int = 2;
		
		public function Enemy(bal:Ball) 
		{
			super(new Art_Player2());
			_bal = bal;
		}
		
		public function Update(e:Event = null):void
		{
			y = _bal.y;
		}
	}

}