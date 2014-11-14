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
		
		public static const START:String = "Start";
		
		// -- Vars -- //
		
		private var _startButton:SimpleButton;
		
		// -- Construct -- //
		
		public function StartMenu() 
		{
			super();
			addChild(new Art_Startscherm());
			//addButton(new Art_StartBTN(), 30, 100, START);
			addTextureButton(new Art_Startscherm_Play(), 30, 100, START);
		}
		
	}

}