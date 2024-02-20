part of 'homepage_bloc.dart';

abstract class HomepageEvent {}

class PlaySongEvent extends HomepageEvent {
  final int currentIndex;
  final String currentsonguri;
  final int artworkId;

  PlaySongEvent(
      {required this.currentIndex,
      required this.currentsonguri,
      required this.artworkId});
}

class PlayAndPauseEvent extends HomepageEvent {
  bool isplaying;

  PlayAndPauseEvent({required this.isplaying});
}
