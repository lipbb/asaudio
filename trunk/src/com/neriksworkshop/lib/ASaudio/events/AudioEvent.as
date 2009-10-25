package com.neriksworkshop.lib.ASaudio.events 
{
	import flash.events.Event;
	
	/**
	* ...
	* @author www.neriksworkshop.com
	*/
	public class AudioEvent extends Event 
	{
		/**
		* bla bla bla...
		*
		* <p>The properties of the event object have the following values:</p>
		* <table class=innertable>
		* <tr><th>Property</th><th>Value</th></tr>
		* ...
		* </table>
		*
		* @eventType com.neriksworkshop.lib.ASaudio.core.AudioEvent
		*/		
		public static const STOP:String = "STOP";

		public static const PLAYING:String = "PLAYING";
		public static const VOLUME_CHANGE:String = "VOLUME_CHANGE";
		public static const PAN_CHANGE:String = "PAN_CHANGE";
		public static const TOGGLE_PAUSE:String = "TOGGLE_PAUSE";
		public static const TOGGLE_MUTE:String = "TOGGLE_PAUSE";

		public static const START:String = "START";
		//public static const SOLO:String = "SOLO";
		public static const PLAYLIST_LOADED:String = "PLAYLIST_LOADED";
		public static const FADE_AT_END_STARTED:String = "FADE_AT_END_STARTED";
		public static const NEXT_TRACK:String = "NEXT_TRACK";		
		
		/**
		 * @private
		 */
		public static const TICK:String = "TICK";
		
		
		
		private var _uid:int;
		
		public function AudioEvent(type:String, _uid:int = -1, bubbles:Boolean=false, cancelable:Boolean=false) 
		{ 
			this._uid = _uid;
			super(type, bubbles, cancelable);
			
		} 
		
		public override function clone():Event 
		{ 
			return new AudioEvent(type, _uid, bubbles, cancelable);
		} 
		
		public override function toString():String 
		{ 
			return formatToString("AudioEvent", "type", "uid", "bubbles", "cancelable", "eventPhase"); 
		}
		
		public function get uid():int
		{
			return (_uid == -1) ? target.uid : _uid;
		}
		
	}
	
}