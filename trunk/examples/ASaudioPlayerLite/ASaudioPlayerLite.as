package 
{
	import com.neriksworkshop.lib.ASaudio.*;
	import com.neriksworkshop.lib.ASaudio.events.AudioEvent;
	import com.neriksworkshop.lib.ASaudio.util.AudioUtil;
	import fl.events.SliderEvent;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	/**
	 * This is very simple example on how to use ASaudio's Track and Playlist classes.
	 * Have a look at ASaudioPlayer example for advanced ASaudio methods
	 */
	public class ASaudioPlayerLite extends Sprite
	{
		private var ui:ASaudioPlayerLiteUI;
		private var playlist:Playlist;
		
		public function ASaudioPlayerLite():void
		{
			buildUI();
			setSounds();
		}
		
	
		private function buildUI():void  //here we create interface elements and ui listeners
		{
		
			ui = new ASaudioPlayerLiteUI;
			addChild(ui);
						
			ui.btTogglePause.addEventListener(MouseEvent.CLICK, btTogglePauseHandler);
			ui.btPrev.addEventListener(MouseEvent.CLICK, btPrevHandler);
			ui.btNext.addEventListener(MouseEvent.CLICK, btNextHandler);
			ui.btToggleMute.addEventListener(MouseEvent.CLICK, btToggleMuteHandler);
			ui.btVolume.addEventListener(SliderEvent.CHANGE, btVolumeChangeHandler);
			ui.btSeek.addEventListener(MouseEvent.CLICK, btSeekChangeHandler);
			
		}

		
		private function setSounds():void
		{
			//we start by creating with some tracks
			var track1:Track = new Track("../../audioFiles/track01_Chewrafa.mp3");
			var track2:Track = new Track("../../audioFiles/track02_Pornophonique.mp3");
			var track3:Track = new Track("../../audioFiles/track03_Binarpilot.mp3");
			//then we create the playlist with 2 tracks
			playlist = new Playlist([track1, track2]);
			//we can also add a track this way
			playlist.addChild(track3);
			
	
			//we're gonna listen to the PLAYING event in order to visually update playhead position
			playlist.addEventListener(AudioEvent.PLAYING, playlistPlayingHandler);
			//also to the ID3 event to update song title TextField
			playlist.addEventListener(Event.ID3, playlistID3Handler);
			//and we want to update ui's volume bar each time playlist's volume change
			playlist.addEventListener(AudioEvent.VOLUME_CHANGE, playlistVolumeChangeHandler);			
			
			
			//the tracks must loop at the end of the playlist
			playlist.loop = true;
			//we set the volume to 70%
			playlist.volume = .7;
					
			
			//and finally we launch the playlist, without fading
			playlist.start(false);
		}			
		

		
				
		//----------------- Event handlers ----------------------------------
		
		private function btTogglePauseHandler(event:MouseEvent):void
		{
			//here we toggle playing state (if the playlist is playing, the playlist will pause and vice versa). 
			playlist.togglePause();
			
			//changing visual state of the button...
			ui.btTogglePause.label = (ui.btTogglePause.label == "II") ? ">" : "II";
		}		

		private function btPrevHandler(event:MouseEvent):void
		{
			//goes to the previous track of the playlist, with a fade
			playlist.previous(true);
		}
		
		private function btNextHandler(event:MouseEvent):void
		{
			//goes to the next track of the playlist, with a fade
			playlist.next(true);
		}	
		
		private function btToggleMuteHandler(event:MouseEvent):void
		{
			//we mute or unmute sound, depending on playlist current state.
			playlist.toggleMute(true);
			
			//changing visual state of the button...
			ui.btToggleMute.label = (ui.btToggleMute.label == "mute") ? "unmute" : "mute";
		}
		
		private function btVolumeChangeHandler(event:SliderEvent):void
		{
			//here we change volume of the playlist. 
			playlist.volume = event.value;
		}

		private function btSeekChangeHandler(event:MouseEvent):void
		{
			//gives the position where the user clicked on the seek bar, with 0 the minimum and 1 the maximum.
			var position:Number = ui.btSeek.mouseX / ui.btSeek.width;
			
			//then we use playlist's start method to seek through the current track (without fading). The playlist's start method is equivalent to : playlist.currentTrack.start(false, position)
			playlist.start(false, position)

		}
				
		
		
		
				
		private function playlistPlayingHandler(e:AudioEvent):void 
		{
			//here we update the position of the slider component (the value property) depending of playlist's position property
			ui.btSeek.value = playlist.position;
			
			//we'll also show current track position in minutes and seconds, and total track time
			var positionMilliseconds:Number = playlist.positionMs;
			var positionMinutes:Number = Math.floor((positionMilliseconds / 1000) / 60);
			var positionSeconds:Number = Math.round((positionMilliseconds / 1000) % 60);
			ui.timeLbl.text = positionMinutes + ":" + positionSeconds;
			
			trace(AudioUtil.getFormattedTime(positionMilliseconds));
		}

		private function playlistID3Handler(e:Event):void 
		{
			//we must gather id3 info from currently playing track, in order to show song's artist and title in a textfield
			
			//first we get the currently playing track :
			var currentlyPlayingTrack:Track = playlist.currentTrack;
			
			
			//then we gather ID3 info from it
			var trackArtist:String = currentlyPlayingTrack.id3.artist;
			var trackTitle:String = currentlyPlayingTrack.id3.songName;
			
			//finally we put that in a TextField
			ui.trackInfoLbl.text = trackArtist + "\n" + trackTitle;
		}
		
		private function playlistVolumeChangeHandler(e:AudioEvent):void 
		{
			//trace(playlist.volume)
			ui.btVolume.value = playlist.volume;
		}		
	
		

	}
}