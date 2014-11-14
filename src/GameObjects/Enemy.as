package GameObjects 
{
	import flash.events.Event;
	import GameObjects.Ball;
	/**
	 * ...
	 * @author Kramboja | |Koen van der Velden
	 */
	public class Enemy extends Paddle
	{
		private var _bal:Ball;
		private var _Speed:int = 7;
		
		private var _hit:Boolean = false;
		
		public function Enemy(bal:Ball) 
		{
			super(new Atstec_Animations());
			_art.stop();
			_art.x = -_art.width/2;
			_art.y = -_art.height/2;
			_art.scaleX = -1;
			_bal = bal;
		}
		
		public override function update(e:Event = null):void
		{
			var offsetY:Number = _bal.y - this.y;
			
			if (offsetY < 0)
			{
				offsetY = Math.max(offsetY, -_Speed);
			}
			else
			{
				offsetY = Math.min(offsetY, _Speed);
			}
			y += offsetY;
			
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