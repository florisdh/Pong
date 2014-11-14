package  
{
	import flash.display.MovieClip;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.KeyboardEvent;
	import flash.events.TimerEvent;
	import flash.geom.Vector3D;
	import flash.utils.Timer;
	import GameObjects.Ball;
	import GameObjects.Brick;
	import GameObjects.GameObj;
	import GameObjects.Player;
	import GameObjects.Enemy;
	import UI.InGame.Label;
	import UI.InGame.UIController;
	/**
	 * ...
	 * @author FDH
	 */
	public class Game extends EventDispatcher
	{
		// -- Events -- //
		
		public static const DEATH:String = "Death";
		
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
		private var _fg:MovieClip;
		
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
			
			// Ball
			_ball = new Ball();
			_ball.x = _stage.stageWidth / 2;
			_ball.y = _stage.stageHeight / 2;
			_ball.Direction = new Vector3D(-1, 0);
			_engine.addObject(_ball);
			
			// Player
			_player = new Player();
			_player.x = _player.width / 2 + 80;
			_player.y = _stage.stageHeight / 2;
			_engine.addObject(_player);
			
			// Enemy
			_enemy = new Enemy(_ball);
			_enemy.x = _stage.stageWidth - _enemy.width / 2 - 80;
			_enemy.y = _stage.stageHeight / 2;
			_engine.addObject(_enemy);
			
			// Create bricks
			createWalls();
			
			// Top & Bottom Wall
			_topWall = new GameObj(new Art_Wall());
			_botWall = new GameObj(new Art_Wall());
			_botWall.y = _stage.stageHeight - _botWall.height;
			_engine.addObject(_topWall);
			_engine.addObject(_botWall);
			
			// Foreground | Leaves etc
			_fg = new Art_TopGround();
			_stage.addChild(_fg);
			
			// UI
			_uiController = new UIController(_stage);
			
			// Start Timer
			_startTimer = new Timer(1000);
			_startTimer.addEventListener(TimerEvent.TIMER, onStartTimerTick);
		}
		
		public function destroy(e:Event = null):void
		{
			_stage.removeChild(_bg);
			_stage.removeChild(_fg);
			_uiController.destroy();
			_engine.destroy();
		}
		
		// -- Methods -- //
		
		private function createWalls():void 
		{
			for (var i:int = 0; i < 12; i++ )
			{
				var newBrick:Brick = new Brick();
				newBrick.x = 0;
				newBrick.y = (newBrick.height - 1) * i;
				_engine.addObject(newBrick);
			}
			
			for (var i:int = 0; i < 12; i++ )
			{
				var newBrick:Brick = new Brick();
				newBrick.x = _stage.stageWidth - newBrick.width;
				newBrick.y = (newBrick.height - 1) * i;
				_engine.addObject(newBrick);
			}
		}
		
		public function update(e:Event = null):void 
		{
			if (!_started || _paused) return;
			
			_engine.update();
			
			// CHECK IF BALL IS OUT OF VIEW
			if (_ball.x < -_ball.width || _ball.x > _stage.stageWidth + _ball.width)
			{
				dispatchEvent(new Event(DEATH));
			}
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
			
			//_stage.addChild(new SpanjaardAllAnimations());
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