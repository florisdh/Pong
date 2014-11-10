package GameObjects 
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	
	/**
	 * ...
	 * @author FDH
	 */
	public class GameObj extends Sprite 
	{
		
		protected var _art:MovieClip;
		
		public function GameObj(art:MovieClip = null) 
		{
			if (art)
			{
				_art = art;
				addChild(_art);
			}
		}
		
		public function update(e:Event = null):void 
		{
			
		}
		
		public function start(e:Event = null):void 
		{
			
		}
		
		public function pause(e:Event = null):void 
		{
			
		}
		
		public function stop(e:Event = null):void 
		{
			
		}
	}

}