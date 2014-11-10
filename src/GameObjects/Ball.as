package GameObjects 
{
	import flash.events.Event;
	import flash.geom.Vector3D;
	/**
	 * ...
	 * @author FDH
	 */
	public class Ball extends GameObj 
	{
		// -- Properties -- //
		
		public var Velocity:Vector3D;
		
		// -- Vars -- //
		
		// -- Construct -- //
		
		public function Ball() 
		{
			super(new Art_Ball());
			Velocity = new Vector3D(-3, -1);
		}
		
		// -- Methods -- //
		
		public function bounceHorizontal():void 
		{
			Velocity = new Vector3D(-Velocity.x, Velocity.y);
		}
		
		// -- Overrides -- //
		
		override public function update(e:Event = null):void 
		{
			x += Velocity.x;
			y += Velocity.y;
		}
		
		override public function onCollide(other:GameObj):void 
		{
		}
	}

}