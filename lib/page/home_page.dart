import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:just_audio/just_audio.dart';
import 'package:music_player/controller/music_player_controller.dart';
import 'package:music_player/constant/music_list.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final MusicPlayerController _controller = MusicPlayerController();
  final AudioPlayer _audioPlayer = AudioPlayer();
  bool _isPlaying = false;

  @override
  void initState() {
    super.initState();
    _initializePlayer();
  }

  Future<void> _initializePlayer() async {
    try {
      await _audioPlayer.setAsset(musicList[_controller.currentIndex].path);
      _setupAudioListeners();
      _controller.isPlaying = true;
      await _audioPlayer.play();
    } catch (e) {
      print('Error initializing player: $e');
    }
  }

  void _setupAudioListeners() {
    _audioPlayer.playerStateStream.listen((state) {
      if (state.processingState == ProcessingState.completed) {
        _playNextSong();
      }
    });
  }

  Future<void> _playNextSong() async {
    try {
  
      _controller.nextSong();
      await _audioPlayer.setAsset(musicList[_controller.currentIndex].path);
      await _audioPlayer.seek(Duration.zero);
      await _audioPlayer.play();
    
    } catch (e) {
      print('Error playing next song: $e');
    }
  }

  Future<void> _playPreviousSong() async {
    try {
     
      _controller.previousSong();
      await _audioPlayer.setAsset(musicList[_controller.currentIndex].path);
      await _audioPlayer.seek(Duration.zero);
      await _audioPlayer.play();
     
    } catch (e) {
      print('Error playing previous song: $e');
    }
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return '$minutes:$seconds';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Music Players'),
      ),
      body: Center(
        heightFactor: 1.5,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Container(
            height: 480,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Observer(
              builder: (context) {
                final currentSong = musicList[_controller.currentIndex];
                return Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(height: 20.h),
                    Card(
                      color: Colors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Image.asset(
                        currentSong.image,
                        height: 200,
                        width: 200,
                        fit: BoxFit.cover,
                        alignment: Alignment.topCenter
                      ),
                    ),
                    Column(
                      children: [
                        Text(
                          currentSong.title,
                          style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold)
                        ),
                        Text(
                          currentSong.artist,
                          style: TextStyle(fontSize: 10.sp, fontWeight: FontWeight.normal)
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        StreamBuilder<Duration>(
                          stream: _audioPlayer.positionStream,
                          builder: (context, snapshot) {
                            final position = snapshot.data ?? Duration.zero;
                            return StreamBuilder<Duration?>(
                              stream: _audioPlayer.durationStream,
                              builder: (context, snapshot) {
                                final duration = snapshot.data ?? Duration.zero;
                                final maxDuration = duration.inMilliseconds;
                                final currentPosition = position.inMilliseconds;
                                
                                final sliderValue = maxDuration > 0 
                                    ? currentPosition.clamp(0, maxDuration).toDouble()
                                    : 0.0;
                                
                                return Slider(
                                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                                  value: sliderValue,
                                  min: 0.0,
                                  max: maxDuration > 0 ? maxDuration.toDouble() : 1.0,
                                  onChangeStart: (value) {
                                    _isPlaying = _controller.isPlaying;
                                    if (_isPlaying) {
                                      _audioPlayer.pause();
                                    }
                                  },
                                  onChanged: (value) {
                                    _controller.isPlaying = false;
                                    if (maxDuration > 0) {
                                      final newPosition = value.clamp(0, maxDuration);
                                      _audioPlayer.seek(Duration(milliseconds: newPosition.toInt()));
                                    }
                                  },
                                  onChangeEnd: (value) async {
                                      _controller.isPlaying = true;
                                    
                                      await _audioPlayer.play();
                                     
                                    
                                  },
                                );
                              },
                            );
                          },
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 13.w, right: 18.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              StreamBuilder<Duration>(
                                stream: _audioPlayer.positionStream,
                                builder: (context, snapshot) {
                                  return Text(
                                    _formatDuration(snapshot.data ?? Duration.zero),
                                    style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.normal),
                                  );
                                },
                              ),
                              StreamBuilder<Duration?>(
                                stream: _audioPlayer.durationStream,
                                builder: (context, snapshot) {
                                  return Text(
                                    _formatDuration(snapshot.data ?? Duration.zero),
                                    style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.normal),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                          onPressed: _playPreviousSong,
                          icon: Icon(Icons.skip_previous_sharp, size: 32.sp),
                        ),
                        IconButton(
                          onPressed: () async {
                            _controller.togglePlay();
                            if (_controller.isPlaying) {
                              await _audioPlayer.play();
                            } else {
                              await _audioPlayer.pause();
                            }
                          },
                          icon: Icon(
                            _controller.isPlaying ? Icons.pause_circle : Icons.play_circle,
                            size: 32.sp,
                          ),
                        ),
                        IconButton(
                          onPressed: _playNextSong,
                          icon: Icon(Icons.skip_next_sharp, size: 32.sp),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.h),
                  ],
                );
              }
            ),
          ),
        ),
      ),
    );
  }
}  