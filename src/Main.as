package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import UI.Menus.Menu;
	import UI.Menus.StartMenu;
	
	/**
	 * ...
	 * @author FDH
	 */
	public class Main extends Sprite 
	{
		// -- Properties -- //
		
		// -- Vars -- //
		
		private var _game:Game;
		private var _menu:Menu;
		
		// State
		private var _started:Boolean = false;
		private var _paused:Boolean = false;
		
		// -- Construct -- //
		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
			
			showStartMenu();
		}
		
		// -- Methods -- //
		
		private function start():void 
		{
			if (_started) return;
			_started = true;
			
			
		}
		
		private function pause():void 
		{
			if (_paused) return;
			_paused = false;
			
		}
		
		private function stop():void 
		{
			if (!_started) return;
			_started = false;
			
		}
		
		private function showStartMenu():void 
		{
			hideMenu();
			
			_menu = new StartMenu();
			addChild(_menu);
		}
		
		private function showPauseMenu():void 
		{
			hideMenu();
			
			_menu = new StartMenu();
			addChild(_menu);
		}
		
		private function showEndMenu():void 
		{
			hideMenu();
			
			_menu = new StartMenu();
			addChild(_menu);
		}
		
		private function hideMenu():void 
		{
			if (_menu)
			{
				removeChild(_menu);
				_menu = null;
			}
		}
	}
	
}