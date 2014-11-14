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
		public static const DESTROY:String = "Destroy";
		
		
		public var Collide:Boolean = true;
		
		protected var _art:MovieClip;
		protected var _destroyed:Boolean = false;
		
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
		
		public function willCollide(other:GameObj):Boolean
		{
			return hitTestObject(other);
		}
		
		public function onCollide(other:GameObj):void 
		{
		}
		
		public function destroy():void 
		{
			if (_destroyed) return;
			_destroyed = true;
			
			dispatchEvent(new Event(DESTROY));
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