// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'music_player_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MusicPlayerController on _MusicPlayerControllerBase, Store {
  Computed<bool>? _$isFirstSongComputed;

  @override
  bool get isFirstSong =>
      (_$isFirstSongComputed ??= Computed<bool>(
            () => super.isFirstSong,
            name: '_MusicPlayerControllerBase.isFirstSong',
          ))
          .value;
  Computed<bool>? _$isLastSongComputed;

  @override
  bool get isLastSong =>
      (_$isLastSongComputed ??= Computed<bool>(
            () => super.isLastSong,
            name: '_MusicPlayerControllerBase.isLastSong',
          ))
          .value;

  late final _$currentIndexAtom = Atom(
    name: '_MusicPlayerControllerBase.currentIndex',
    context: context,
  );

  @override
  int get currentIndex {
    _$currentIndexAtom.reportRead();
    return super.currentIndex;
  }

  @override
  set currentIndex(int value) {
    _$currentIndexAtom.reportWrite(value, super.currentIndex, () {
      super.currentIndex = value;
    });
  }

  late final _$isPlayingAtom = Atom(
    name: '_MusicPlayerControllerBase.isPlaying',
    context: context,
  );

  @override
  bool get isPlaying {
    _$isPlayingAtom.reportRead();
    return super.isPlaying;
  }

  @override
  set isPlaying(bool value) {
    _$isPlayingAtom.reportWrite(value, super.isPlaying, () {
      super.isPlaying = value;
    });
  }

  late final _$_MusicPlayerControllerBaseActionController = ActionController(
    name: '_MusicPlayerControllerBase',
    context: context,
  );

  @override
  void togglePlay() {
    final _$actionInfo = _$_MusicPlayerControllerBaseActionController
        .startAction(name: '_MusicPlayerControllerBase.togglePlay');
    try {
      return super.togglePlay();
    } finally {
      _$_MusicPlayerControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void nextSong() {
    final _$actionInfo = _$_MusicPlayerControllerBaseActionController
        .startAction(name: '_MusicPlayerControllerBase.nextSong');
    try {
      return super.nextSong();
    } finally {
      _$_MusicPlayerControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void previousSong() {
    final _$actionInfo = _$_MusicPlayerControllerBaseActionController
        .startAction(name: '_MusicPlayerControllerBase.previousSong');
    try {
      return super.previousSong();
    } finally {
      _$_MusicPlayerControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentIndex: ${currentIndex},
isPlaying: ${isPlaying},
isFirstSong: ${isFirstSong},
isLastSong: ${isLastSong}
    ''';
  }
}
