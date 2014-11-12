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
		
		public var Speed:Number = 15;
		
		// -- Vars -- //
		
		private var _dir:Vector3D;
		
		// -- Construct -- //
		
		public function Ball() 
		{
			super(new Art_Ball());
		}
		
		// -- Methods -- //
		
		public function bounceHorizontal():void 
		{
			_dir.x *= -1;
		}
		
		public function bounceVertical():void 
		{
			_dir.y *= -1;
		}
		
		// -- Overrides -- //
		
		override public function update(e:Event = null):void 
		{
			x += _dir.x * Speed;
			y += _dir.y * Speed;
		}
		
		override public function willCollide(other:GameObj):Boolean 
		{
			return willCollideSide(other) != -1;
		}
		
		override public function onCollide(other:GameObj):void 
		{
			var side:int = willCollideSide(other);
			
			switch (side) 
			{
				case 0: // Top
					// Push Back
					while ((side = willCollideSide(other)) == 0) y++;
					bounceVertical();
				break;
				case 1: // Right
					// Push Back
					while ((side = willCollideSide(other)) == 1) x--;
					bounceHorizontal();
				break;
				case 2: // Bottom
					// Push Back
					while ((side = willCollideSide(other)) == 2) y--;
					bounceVertical();
				break;
				case 3: // Left
					// Push Back
					while ((side = willCollideSide(other)) == 3) x++;
					bounceHorizontal();
				break;
				default:
			}
			
		}
		
		private function willCollideSide(other:GameObj):int 
		{
			// Top
			if (other.hitTestPoint(x, y -  height / 2, true)) return 0;
			// Right
			if (other.hitTestPoint(x + width / 2, y, true)) return 1;
			// Bottom
			if (other.hitTestPoint(x, y +  height / 2, true)) return 2;
			// Left
			if (other.hitTestPoint(x - width / 2, y, true)) return 3;
			
			// NO COLLISION
			return -1;
		}
		
		// -- Get & Set -- //
		
		public function get Direction():Vector3D
		{
			return _dir;
		}
		
		public function set Direction(newVal:Vector3D):void 
		{
			newVal.normalize();
			_dir = newVal;
		}
	}

}