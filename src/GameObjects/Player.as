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
		
		private var _hit:Boolean = false;
		
		// -- Construct -- //
		
		public function Player() 
		{
			//super(new Art_Player1());
			super(new SpanjaardAllAnimations());
			_art.x = -_art.width / 2;
			_art.y = -_art.height / 2;
			_art.stop();
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
			
			
			// Anim
			if (_hit)
			{
				if (_art.currentFrame >= 60)
				{
					_hit = false;
					_art.gotoAndPlay(0);
				}
			}
			else
			{
				if (_art.currentFrame >= 30)
				{
					_art.gotoAndPlay(0);
				}
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
		
		override public function onCollide(other:GameObj):void 
		{
			super.onCollide(other);
			
			if (other is Ball)
			{ // Play hit anim
				_art.gotoAndPlay(40);
				_hit = true;
			}
		}
		
		override public function start(e:Event = null):void 
		{
			super.start(e);
			
			_art.gotoAndPlay(0);
		}
	}

}