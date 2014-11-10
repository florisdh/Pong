package  
{
	import flash.net.SharedObject;
	/**
	 * ...
	 * @author FDH
	 */
	public class Score 
	{
		// -- INFO -- //
		/*
			Full static class to make access and life more easy
		*/
		
		// -- Properties -- //
		
		public static var CurrentScore:int = 0;
		public static var HighScore:int = 0;
		
		// -- Methods -- //
		
		public static function load():void 
		{
			var shared:SharedObject = SharedObject.getLocal("pongRemake");
			if (shared.data.HighScore) HighScore = shared.data.HighScore;
		}
		
		public static function save():void 
		{
			var shared:SharedObject = SharedObject.getLocal("pongRemake");
			shared.data.HighScore = HighScore;
		}
		
	}

}