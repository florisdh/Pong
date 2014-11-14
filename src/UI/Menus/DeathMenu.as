package UI.Menus 
{
	/**
	 * ...
	 * @author FDH
	 */
	public class DeathMenu extends Menu 
	{
		public static const MAINMENU:String = "MAINMENU";
		
		public function DeathMenu() 
		{
			super();
			
			addChild(new Art_Eindscherm());
			addTextureButton(new Art_Eindscherm_Mainmenu_Button(), 30, 30, MAINMENU);
		}
		
		
		
	}

}