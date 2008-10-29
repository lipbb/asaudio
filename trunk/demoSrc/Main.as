package 
{
	
	import com.neriksworkshop.lib.ASaudio.*;
	import com.neriksworkshop.lib.ASaudio.core.*;
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.events.ProgressEvent;
	import flash.media.Sound;
	import flash.media.SoundChannel;
	import flash.media.SoundMixer;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.system.System;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.ui.Keyboard;
	import flash.utils.ByteArray;
	
	public class Main extends Sprite
	{
		private var t:Track;
		private var g:Group;
		private var p:Playlist;
		private var bar:Sprite;
		private var tf:TextField;
		
		
		
		public function Main():void
		{

			stage.scaleMode = StageScaleMode.SHOW_ALL;
			
			bar = new Sprite();
			bar.graphics.beginFill(0x00ff00);
			bar.graphics.drawRect(0, 0, 10, 10);
			addChild(bar);
			
			tf = new TextField();
			tf.height = 800;
			tf.autoSize = TextFieldAutoSize.LEFT;
			addChild(tf);
			
			addEventListener(Event.ENTER_FRAME, run);
		
			t = new Track("../data/test.mp3");
			t.addEventListener(AudioEvents.PLAYING, handler);
			//t.fadeOutOnEnd = true;
			//add

			//t.loop = true
			//t.start();
			
			
			//

			//p = new Playlist([new Track("../data/test.mp3"),  new Track("../data/arpeg.mp3")]);
			//p.fadeAtEnd = true;
			
			//g = new Group([new Track("../data/med.mp3"), gt, new Track("../data/mu.mp3")]);
			//g.removeChild(g.getChildByName("arpeg"));
			//g.start();
			//g.loop = true;
			//g.fadeOutOnEnd = true;
			
			//g = new Group(new Track("../data/med.mp3"));
			
			//g = new Group("../data/pls.xspf");
			//g = new Group("../data/pls.m3u");
			//g.addEventListener(AudioAPI.PLAYLIST_LOADED, playlistLoaded);			
			
			//var u:URLLoader = new URLLoader();
			//u.addEventListener(Event.COMPLETE, xspfLoaded);
			//u.load(new URLRequest("../data/pls.xspf"));
			
			//g = new Group(["../data/med.mp3", "../data/short.mp3"]);
			

			//t = new Track("../data/med.mp3");
			//t.pan = -1;
			//t.volume = .1;
			//t.loop = true;
			//t.start()
			//t.loop = true;
			//t.fadeOutOnEnd = true;
			

			
			stage.addEventListener(KeyboardEvent.KEY_DOWN, test);
		}
		
		private function handler(e:Event):void 
		{
			trace("playing");
		}
		
		private function run(event:Event):void 
		{
			/*
			var ba:ByteArray = new ByteArray();
			var n:Number;
			var a:Array = new Array();
			
			SoundMixer.computeSpectrum(ba, true);
			

			graphics.clear();
			graphics.lineStyle(0, 0x0);
		

			
			
			for (var i:int = 0; i < 512; i++) 
			{
				a.push(ba.readFloat());
			}
			
			var bands:int = 16;
			var tmp:Array = new Array();
			var res:Array = new Array();
			
			for (var k:int = 0; k < 256; k++) 
			{
		
				tmp.push(a[k]);
				
				if (((k+1) % (256/bands)) == 0)
				{
					
					var sum:Number = 0;
					var bandRes:Number;
					
					for (var l:int = 0; l <  (256/bands); l++)
					{
						sum += tmp[l];
					}
					
					bandRes = sum / (256/bands);
					
					graphics.moveTo(k, 200);
					graphics.lineTo(k, 200 - bandRes*200);
					
					res.push(bandRes);		
					tmp = new Array();
				}
				
				//n = a[k] * 200;
				//graphics.moveTo(k, 200);
				//graphics.lineTo(k, 200 - n);
				
            }			
			
			trace(res)*/

		}
		

		private function xspfLoaded(event:Event):void 
		{
			//g = new Group(new XML(event.target.data));
			//g.start();
		}
		
		private function playlistLoaded(event:Event):void 
		{
			//g.start();
		}
		
		private function test(event:KeyboardEvent):void 
		{
			trace(event.charCode)
			var e:IAudioItem = t;
			
		
			switch (String.fromCharCode(event.charCode))
			{
				case " " : //SPACE
					e.start(false, .98);break
				case "u" : //UP
					e.volume += .1; break;
				case "d": //DOWN
					e.volume -= .1; break;
				case "l" : //LEFT
					e.pan -= .1; break;
				case "r" : //RIGHT
					e.pan += .1; break;					
				case "p" : //p
					e.togglePause(true); break;
				case 111 : //p
					e.resume(); break;					
				case "s" : //s
					e.stop(false); break;
				case "m" : //m
					e.toggleMute(true); break;
				case 108 : //l
					e.left(true); break;
				case 114 : //r
					e.right(true); break;
				case "c" : //c
					e.center(true); break;
				case "w" : //a
					(e as Playlist).previous(true); break;
				case "q" : //z
					(e as Playlist).next(true); break;	
					
					
				case "x" :
					trace(e.cookieWrite("zob")); break;
				case "k" :
					e.cookieRetrieve("zsob"); break;
					
				case "t" : 
					trace((e as Track).duration);
	
			}
		}
		
	}
}