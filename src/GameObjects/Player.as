package GameObjects 
{
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.geom.Vector3D;
	/**
	 * ...
	 * @author FDH
	 */
	public class Player extends Paddle 
	{
		// -- Properties -- //
		
		public var Speed:Number = 10;
		public var Button_Up:int = 38;
		public var Button_Down:int = 40;
		
		// -- Vars -- //
		
		private var UpArrowPressed:Boolean = false;
		private var DownArrowPressed:Boolean = false;
		
		// -- Construct -- //
		
		public function Player() 
		{
			super(new Art_Player1());
			
		}
		
		// -- Methods -- //
		
		public override function update(e:Event = null):void 
		{
			if (UpArrowPressed)
			{
				y -= Speed;
			}
			if	(DownArrowPressed)
			{
				y += Speed;
			}
		}
		
		public function onKeyDown(e:KeyboardEvent):void 
		{
			if (e.keyCode == Button_Up)
			{
				UpArrowPressed = true;
			}
			else if (e.keyCode == Button_Down)
			{
				DownArrowPressed = true;
			}
		}
		
		public function onKeyUp(e:KeyboardEvent):void 
		{
			if (e.keyCode == Button_Up)
			{
				UpArrowPressed = false;
			}
			else if (e.keyCode == Button_Down)
			{
				DownArrowPressed = false;
			}
		}
	}

}