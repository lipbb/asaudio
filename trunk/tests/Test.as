package  
{
	import com.neriksworkshop.lib.ASaudio.Playlist;
	import com.neriksworkshop.lib.ASaudio.Track;
	import com.neriksworkshop.lib.ASaudio.core.IAudioItem;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	
	/**
	* ...
	* @author www.neriksworkshop.com
	*/
	public class Test extends Sprite
	{
		public static var BD:String = "../audioFiles/";
		private var pls:Playlist;
		private var t1:Track;
		private var t2:Track;
		private var a:/*IAudioItem*/Array;
		private var cur:int;
		
		public function Test() 
		{
			pls = new Playlist([BD + "short01.mp3", BD + "short02.mp3", BD + "short03.mp3"]);
			
			t1 = new Track(BD + "track02_Pornophonique.mp3", "t1");
			t2 = new Track(BD + "track03_Binarpilot.mp3", "t2");
			
			t1.loop = t2.loop = true;
			
			a  = [t1, pls, t2];
			cur = 0;
			
			stage.addEventListener(MouseEvent.MOUSE_DOWN, n);
			
			t1.start(true)
		}
		
		private function n(e:MouseEvent):void 
		{
			//trace("hop")
			var next:int = (cur == 2) ? 0 : cur+1;
			//trace(cur, next)
			a[cur].crossfade(a[next]);
			
			cur = next;
		}
		
	}
	
}