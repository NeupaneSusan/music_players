


import 'package:music_player/model/music.dart';

final List<Map<String, dynamic>> _musicList = [
  {
    'title': 'Abstract',
    'artist': 'Les A Album',
    'image': 'assets/image/music.png',
     'path': 'assets/audio/abstract.mp3',
  },
  {
    'title': 'Bad,Good',
    'artist': 'TeleCasted',
    'image': 'assets/image/music.png',
     'path': 'assets/audio/bad_good.mp3',
  },
  {
    'title': 'Happy Whistling Ukulele',
    'artist': 'Ukulele',
    'image': 'assets/image/music.png',
    'path': 'assets/audio/happy_whistling_ukulele.mp3',
  },
  {
    'title': "Landra's Dream",
    'artist': 'Dreamer',
    'image': 'assets/image/music.png',
    'path': 'assets/audio/landras_dream.mp3',
  },
  {
    'title': 'MotherLand',
    'artist': 'Rayan Stasik',
    'image': 'assets/image/music.png',
    'path': 'assets/audio/mother_land.mp3',
  },
  {
    'title': 'On The Bayou',
    'artist': 'Kanika Moore',
    'image': 'assets/image/music.png',
    'path': 'assets/audio/on_the_bayou.mp3',
  },
  
  {
    'title': 'River Meditations',
    'artist': 'Frank Sinatra',
    'image': 'assets/image/music.png',
    'path': 'assets/audio/river_meditations.mp3',
  },
  
  {
    'title': 'Seagull',
    'artist': 'TeleCasted',
    'image': 'assets/image/music.png',
     "path": 'assets/audio/seagull.mp3'
  },
  
 ];

  List<MusicModel> get musicList => _musicList.map((e) => MusicModel.fromJson(e)).toList();
  