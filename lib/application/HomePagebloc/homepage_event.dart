part of 'homepage_bloc.dart';

abstract class HomepageEvent {}

class GenerateAudioSourceEvent extends HomepageEvent {
  final List<SongModel> songlist;

  GenerateAudioSourceEvent({required this.songlist});
}

class PlaySongEvent extends HomepageEvent {
  final int currentIndex;

  PlaySongEvent({required this.currentIndex});
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
  GenerateAudioListEvent();
}
