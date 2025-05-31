import 'package:mobx/mobx.dart';
import 'package:music_player/constant/music_list.dart';

part 'music_player_controller.g.dart';

// ignore: library_private_types_in_public_api
class MusicPlayerController = _MusicPlayerControllerBase with _$MusicPlayerController;

abstract class _MusicPlayerControllerBase with Store {
  @observable
  int currentIndex = 0;

  @observable
  bool isPlaying = false;

  @computed
  bool get isFirstSong => currentIndex == 0;

  @computed
  bool get isLastSong => currentIndex == musicList.length - 1;

  @action
  void togglePlay() {
    isPlaying = !isPlaying;
  }

  @action
  void nextSong() {
    isPlaying = false;
    if (!isLastSong) {
      currentIndex++;
    } else {
      currentIndex = 0;
    }
    isPlaying = true;
  }

  @action
  void previousSong() {
     isPlaying = false;
    if (!isFirstSong) {
      currentIndex--;
    } else {
      currentIndex = musicList.length - 1;
    }
    isPlaying = true;
  }
}