package com.neriksworkshop.lib.ASaudio.util 
{
	
	/**
	* ...
	* @author www.neriksworkshop.com
	*/
	public class AudioUtil 
	{
		/**
		 * Gives a string representation of a time, typically a track/playlist position.
		 * @param	positionMs			current track/playlist position in milliseconds, typically retrieved using the <code>positionMs</code> property of Track and Playlist objects.
		 * @param	biggestUnit			biggest time unit, can be "h" (hour), "m" (minute), "s" (second) or "u" (millisecond). Default is "m" (minute).
		 * @param	smallestUnit		smallest time unit, can be "u" (millisecond), "s" (second), "m" (minute) or "h" (hour). Default is "s" (second).
		 * @param	getRemainingTime	gives remaining time instead of elapsed time. You must provide a value for the <code>totalTime</code> argument.
		 * @param	totalTimeMs			total track/playlist time in milliseconds, necessary when <code>getRemainingTime</code> is true. Will be ignored if  <code>getRemainingTime</code> is false.
		 * @param	leadingZeros		use leading zeros in time units (ex: 01:02:03'004 when true, 1:2:3'4 when false)
		 * @param	separators			array of strings representing separators between time units, from biggest time unit to smallest time unit. Default separators are ":" between hours, minutes and seconds, and "'" between seconds and milliseconds.
		 * @return
		 */
		public static function getFormattedTime(positionMs:Number, 
												biggestUnit:String = "m", 
												smallestUnit:String = "s", 
												getRemainingTime:Boolean = false, 
												totalTimeMs:Number = NaN, 
												leadingZeros:Boolean = true,
												separators:Array = null):String
		{
			
			if (getRemainingTime && (isNaN(totalTimeMs) || totalTimeMs < positionMs)) { throw new Error("problem with totalTimeMs param"); return "error"; }
			
			var units:Array = [  { l:"h", d:60, s:":" }, { l:"m", d:60, s:":" }, { l:"s", d:1000, s:"'" }, { l:"u" } ];
			var separators:Array = 
			var iB:int, iS:int;
			
			var s:String = "";
			
			for (var i:int = 0; i < units.length; i++) { if (units[i].l == biggestUnit) iB = i else if (units[i].l == smallestUnit) iS = i };
						
			for (var j:int = iB; j <= iS; j++)
			{
				trace(j);
			}
			
			return "";
		}
		
	}
	
}