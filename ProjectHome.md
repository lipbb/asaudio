Creation and handling of sounds via a **straight-forward, clear and coherent syntax**. For example, to create a sound, play it and change its volume:
```
var track:Track = new Track("path/to/track.mp3");
track.start();
track.volume = .5;
```
Whereas with the standard API, you would write:
```
var urlRequest:URLRequest = new URLRequest("path/to/track.mp3");
var sound:Sound = new Sound(urlRequest);
var soundChannel:SoundChannel = sound.play();
var soundTrans:SoundTransform = soundChannel.soundTransform;
soundTrans.volume = .5;
soundChannel.soundTransform = soundTrans;
```

---

**Hierarchical sound structures**. You can put a bunch of sounds into a Group or a Playlist object and control them globally. For example:
```
var group:Group = new Group( [new Track("path/to/track1.mp3"), new Track("path/to/track2.mp3"), new Track("path/to/track3.mp3")] );
group.pan = -1;
group.addChild(new Track("path/to/track4.mp3"));
group.start(); 
```
You can also put groups into other groups, and thus create complex hierarchical structures. The 4 main structures (Track, Group, Playlist and Mixer) implements a common interface, so for many methods and properties, you can treat every element the same way.


---

Each navigation/sound transform methods (start(), stop(), mute(), left/right/center(), etc.) has a **"fade"** option to make smooth sound transitions (tiny internal tween engine, with a single timer)


---

Efficient **memory management**.


---

M3U/XSPF **playlists** import/export.


---

Event-driven objects.


---

And many more to come: BPM detection, complex ID3 data (covers...), last.fm metadata, cue points...


---


[ASaudio online documentation](http://nerik.me/project/ASaudio/doc/)