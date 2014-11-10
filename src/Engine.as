package  
{
	import flash.display.Stage;
	import flash.events.Event;
	import GameObjects.GameObj;
	/**
	 * ...
	 * @author FDH
	 */
	public class Engine 
	{
		// -- Properties -- //
		
		// -- Vars -- //
		
		private var _stage:Stage;
		
		private var _gameObjs:Vector.<GameObj>;
		
		private var _started:Boolean = false;
		private var _paused:Boolean = false;
		
		// -- Construct -- //
		
		public function Engine(stage:Stage) 
		{
			_stage = stage;
			init();
		}
		
		public function init():void 
		{
			_gameObjs = new Vector.<GameObj>();
		}
		
		public function destroy():void 
		{
			
		}
		
		// -- Methods -- //
		
		public function addObject(obj:GameObj):void 
		{
			_gameObjs.push(obj);
			_stage.addChild(obj);
		}
		
		public function removeObject(obj:GameObj):void 
		{
			var ind:int = _gameObjs.indexOf(obj);
			removeObjectFromId(ind);
		}
		
		public function removeObjectFromId(ind:int):void 
		{
			// Validate
			if (ind < 0 || ind >= _gameObjs.length) return;
			
			// Remove from stage
			_stage.removeChild(_gameObjs[ind]);
			
			// Remove from array
			_gameObjs.splice(ind, 1);
		}
		
		public function update(e:Event = null):void 
		{
			if (!_started) return;
			
			// Update all
			for each (var c:GameObj in _gameObjs)
			{
				c.update();
			}
			
			// Check for col | I used for instead of foreach becouse some where skipped
			//var l:int = _gameObjs.length;
			//for (var cI:int = 0; cI < l; cI++ )
			//{
				//var c:GameObj = _gameObjs[cI];
				//if (!c.Collide) continue;
				//
				//for (var oI:int = 0; oI < l; oI++ )
				//{
					//// Skip self
					//if (cI == oI) continue;
					//
					//// Skip No colliding parts
					//var o:GameObj = _gameObjs[oI];
					//if (!o.Collide) continue;
					//
					//// Check for col
					//if (c.willCollide(o)) c.onCollide(o);
				//}
			//}
			
			for each (var cObject:GameObj in _gameObjs)
			{
				// Check for col
				if (!c.Collide) continue;
				
				for each (var o:GameObj in _gameObjs)
				{
					if (c == o || !o.Collide) continue;
					
					if (c.willCollide(o)) c.onCollide(o);
					if (o.willCollide(c)) o.onCollide(c);
				}
			}
		}
		
		public function start(e:Event = null):void 
		{
			if (_started) return;
			_started = true;
			
			for (var i:int = _gameObjs.length - 1; i >= 0; i-- )
			{
				_gameObjs[i].start();
			}
		}
		
		public function pause(e:Event = null):void 
		{
			if (_paused || !_started) return;
			_paused = true;
			
			for (var i:int = _gameObjs.length - 1; i >= 0; i-- )
			{
				_gameObjs[i].pause();
			}
		}
		
		public function stop(e:Event = null):void 
		{
			if (!_started) return;
			_started = false;
			
			for (var i:int = _gameObjs.length - 1; i >= 0; i-- )
			{
				_gameObjs[i].stop();
			}
		}
	}

}