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
		
		public var Speed:Number = 10;
		
		// -- Vars -- //
		
		private var _dir:Vector3D;
		
		// -- Construct -- //
		
		public function Ball() 
		{
			super(new Art_Ball());
			_dir = new Vector3D(-1, -0.5);
		}
		
		// -- Methods -- //
		
		public function bounceHorizontal():void 
		{
			_dir = new Vector3D(-_dir.x, _dir.y);
		}
		
		public function bounceVertical():void 
		{
			_dir = new Vector3D(_dir.x, -_dir.y);
		}
		
		// -- Overrides -- //
		
		override public function update(e:Event = null):void 
		{
			x += _dir.x * Speed;
			y += _dir.y * Speed;
			
			rotation -= 10;
			
			if (x < 0)
			{
				x = 400;
				y = 300;
			}
			
			if (x > 800)
			{
				x = 400;
				y = 300;
			}
		}
		
		override public function onCollide(other:GameObj):void 
		{
		}
	}

}