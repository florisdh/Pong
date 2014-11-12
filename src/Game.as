package  
{
	import flash.display.MovieClip;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.events.TimerEvent;
	import flash.geom.Vector3D;
	import flash.utils.Timer;
	import GameObjects.Ball;
	import GameObjects.GameObj;
	import GameObjects.Player;
	import GameObjects.Enemy;
	import UI.InGame.Label;
	import UI.InGame.UIController;
	/**
	 * ...
	 * @author FDH
	 */
	public class Game 
	{
		// -- Vars -- //
		
		private var _stage:Stage;
		
		// Main Engine for updating and collision for all gameObjects
		private var _engine:Engine;
		
		// Game Objects
		private var _player:Player;
		private var _enemy:Enemy;
		private var _ball:Ball;
		private var _topWall:GameObj;
		private var _botWall:GameObj;
		private var _bg:MovieClip;
		
		// Start Timer
		private var _startTime:int = 4; // seconds
		private var _startTimer:Timer;
		
		// State
		private var _started:Boolean = false;
		private var _starting:Boolean = false;
		private var _paused:Boolean = false;
		
		// UI
		private var _uiController:UIController;
		
		// -- Construct, init & destroy -- //
		
		public function Game(stage:Stage) 
		{
			_stage = stage;
		}
		
		public function init(e:Event = null):void 
		{
			_engine = new Engine(_stage);
			
			// Background
			_bg = new Art_Background();
			_stage.addChild(_bg);
			
			// Player
			_player = new Player();
			_player.x =
			_player.y = _stage.stageHeight / 2;
			
			// Ball
			_ball = new Ball();
			_ball.x = _stage.stageWidth / 2;
			_ball.y = _stage.stageHeight / 2;
			_ball.Direction = new Vector3D(-1, 0);
			
			// Enemy
			_enemy = new Enemy(_ball);
			_enemy.x = _stage.stageWidth;
			
			// Walls
			_topWall = new GameObj(new Art_Wall_Top());
			_botWall = new GameObj(new Art_Wall_Bot());
			_botWall.y = _stage.stageHeight - _botWall.height;
			
			// Add all to engine
			_engine.addObject(_player);
			_engine.addObject(_enemy);
			_engine.addObject(_ball);
			_engine.addObject(_topWall);
			_engine.addObject(_botWall);
			
			// UI
			_uiController = new UIController(_stage);
			
			// Start Timer
			_startTimer = new Timer(1000);
			_startTimer.addEventListener(TimerEvent.TIMER, onStartTimerTick);
		}
		
		public function destroy(e:Event = null):void
		{
			_stage.removeChild(_bg);
			_uiController.destroy();
			_engine.destroy();
		}
		
		// -- Methods -- //
		
		public function update(e:Event = null):void 
		{
			if (!_started || _paused) return;
			
			_engine.update();
		}
		
		public function onKeyDown(e:KeyboardEvent):void 
		{
			if (!_started || _paused) return;
			
			_player.onKeyDown(e);
		}
		
		public function onKeyUp(e:KeyboardEvent):void 
		{
			if (!_started || _paused) return;
			
			_player.onKeyUp(e);
		}
		
		private function onStartTimerTick(e:TimerEvent):void 
		{
			if (_started || !_starting)
			{
				_startTimer.stop();
				return;
			}
			
			var timeLeft:int = _startTime - _startTimer.currentCount;
			trace(timeLeft);
			if (timeLeft <= 0)
			{
				showHint("Go", _stage.stageWidth / 2, _stage.stageHeight / 2, 32);
				
				_started = true;
				_starting = false;
				_startTimer.stop();
				
				_engine.start();
			}
			else
			{
				showHint("Starting in " + timeLeft, _stage.stageWidth / 2, _stage.stageHeight / 2, 32);
			}
		}
		
		private function showHint(text:String, centerX:int, centerY:int, size:int = 12):void 
		{
			var newLabel:Label = new Label(text, size);
			newLabel.x = centerX - newLabel.width / 2;
			newLabel.y = centerY - newLabel.height / 2;
			_uiController.addControl(newLabel);
			
			// Fade
			newLabel.fadeIn(100, 0.3, function():void {
				newLabel.fadeOut(100, 0.15, function ():void 
				{
					newLabel.destroy();
				});
			});
		}
		
		// States //
		
		public function start():void 
		{
			if (_started || _starting) return;
			_starting = true;
			
			init();
			_startTimer.start();
		}
		
		public function pause():void 
		{
			if (_paused) return;
			_paused = false;
			
			_engine.pause();
		}
		
		public function stop():void 
		{
			if (!_started) return;
			_started = false;
			
			_engine.stop();
			destroy();
		}
		
	}

}