part of 'homepage_bloc.dart';

class HomepageState {
  final bool isplaying;
  final int currentIndex;
  final int artworkId;
  final String? currentsongtitle;
  final String? currentsongartist;
  final ConcatenatingAudioSource? audiosourceList;

  HomepageState({
    required this.isplaying,
    required this.currentIndex,
    required this.artworkId,
    this.currentsongartist,
    this.currentsongtitle,
    this.audiosourceList,
  });

  HomepageState copyWith(
      {bool? isplaying,
      int? artworkId,
      String? songtitle,
      String? songartist,
      ConcatenatingAudioSource? audiosource}) {
    return HomepageState(
        isplaying: isplaying ?? this.isplaying,
        currentIndex: currentIndex,
        artworkId: artworkId ?? this.artworkId,
        currentsongtitle: songtitle ?? currentsongtitle,
        currentsongartist: songartist ?? currentsongartist,
        audiosourceList: audiosource ?? audiosourceList);
  }
}

final class HomepageInitial extends HomepageState {
  HomepageInitial({
    super.isplaying = false,
    super.currentIndex = 0,
    super.artworkId = 0,
    super.currentsongtitle = 'Play Song',
    super.currentsongartist = '',
  });
}
