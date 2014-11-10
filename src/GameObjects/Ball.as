package GameObjects 
{
	import flash.events.Event;
	/**
	 * ...
	 * @author FDH
	 */
	public class Ball extends GameObj 
	{
		
		public function Ball() 
		{
			super(new Art_Ball());
		}
		
		override public function update(e:Event = null):void 
		{
			x += 20;
		}
	}

}