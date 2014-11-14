package GameObjects 
{
	import flash.display.MovieClip;
	import flash.events.Event;
	
	/**
	 * ...
	 * @author FDH
	 */
	public class Brick extends GameObj 
	{
		private var _hit:Boolean = false;
		
		public function Brick() 
		{
			super(new Art_WallBreak());
			_art.stop();
		}
		
		override public function update(e:Event = null):void 
		{
			if (_hit && _art.currentFrame >= _art.totalFrames - 1)
			{
				_art.stop();
				destroy();
			}
		}
		
		override public function willCollide(other:GameObj):Boolean 
		{
			return other is Ball && super.willCollide(other);
		}
		
		override public function onCollide(other:GameObj):void 
		{
			if (!_hit)
			{
				_hit = true;
				Collide = false;
				_art.play();
			}
		}
		
	}

}