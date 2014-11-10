package GameObjects 
{
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	/**
	 * ...
	 * @author FDH
	 */
	public class Player extends GameObj 
	{
		// -- Properties -- //
		
		public var Speed:Number = 10;
		public var Button_Up:int = 82;
		public var Button_Down:int = 82;
		
		// -- Vars -- //
		
		private var _dir:int = 0;
		
		// -- Construct -- //
		
		public function Player() 
		{
			super();
			
		}
		
		// -- Methods -- //
		
		public function update(e:Event = null):void 
		{
			
		}
		
		public function onKeyDown(e:KeyboardEvent):void 
		{
			
		}
		
		public function onKeyUp(e:KeyboardEvent):void 
		{
			
		}
	}

}