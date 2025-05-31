import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:just_audio/just_audio.dart';
import 'package:music_player/page/home_page.dart';


class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final AudioPlayer _audioPlayer = AudioPlayer();

  String? error;


  @override
  void initState() {

    super.initState();
     _initializeAudio();
  
  }




Future<void> _initializeAudio() async {
  try {
    await _audioPlayer.setAsset('assets/audio/welcome.mp3');
    await _audioPlayer.play();

    // Wait exactly 3 seconds
    await Future.delayed(const Duration(seconds: 3));

    // Stop audio and navigate
    await _audioPlayer.stop();
    if (mounted) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const MyHomePage()),
      );
    }
  } catch (e) {
    setState(() {
      error = e.toString();
    });
    print('Error initializing audio: $e');
  }
}

 
  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          verticalDirection: VerticalDirection.down,
          children: [
            
            Text(
              'Welcome to the Music app',
              style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold),
            ),
            Text(
              'Experience Music in a New Dimension',
              style: TextStyle(fontSize: 14.5.sp, fontWeight: FontWeight.normal),
            ),
            Text(
              'Play, pause, and skip with a tap.',
              style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.normal),
            ),
            if(error!=null)
            Text(error.toString(),style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.normal),)
          ],
        ),
      ),
    );
  }
}