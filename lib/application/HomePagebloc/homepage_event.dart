part of 'homepage_bloc.dart';

abstract class HomepageEvent {}

class PlaySongEvent extends HomepageEvent {
  final String currentsonguri;
  final int currentIndex;

  PlaySongEvent({required this.currentsonguri, required this.currentIndex});
}

class GetArtworkEvent extends HomepageEvent {
  final int artworkId;
  final String title;

  GetArtworkEvent({required this.artworkId, required this.title});
}

class PlayAndPauseEvent extends HomepageEvent {
  PlayAndPauseEvent();
}

class ForwardEvent extends HomepageEvent {}

class BackwardEvent extends HomepageEvent {}

class GenerateAudioListEvent extends HomepageEvent {
  final List<SongModel> songlist;

  GenerateAudioListEvent({required this.songlist});
}

class IndexStreamEvent extends HomepageEvent {}
