package UI.Menus 
{
	import flash.display.SimpleButton;
	/**
	 * ...
	 * @author FDH
	 */
	public class StartMenu extends Menu 
	{
		// -- Events -- //
		
		
		
		// -- Vars -- //
		
		private var _startButton:SimpleButton;
		
		// -- Construct -- //
		
		public function StartMenu() 
		{
			super();
			
			_startButton = new Art_StartBTN();
			_startButton.x = 30;
			_startButton.y = 100;
			addChild(_startButton);
		}
		
	}

}