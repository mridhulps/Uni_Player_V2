part of 'song_and_play_bloc.dart';

abstract class SongAndPlayEvent {}

class GrandedPermission extends SongAndPlayEvent {}

class DeniedPermission extends SongAndPlayEvent {}

class PermenentDeniedPermission extends SongAndPlayEvent {}

class GetSonglist extends SongAndPlayEvent {
  final SongSortType sorttype;

  GetSonglist({this.sorttype = SongSortType.DATE_ADDED});
}

class SortingEvent extends SongAndPlayEvent {
  final SongSortType sort;
  final BuildContext context;

  SortingEvent({required this.sort, required this.context});
}

class GenerateAudioSourceEvent extends SongAndPlayEvent {
  final List<CustomSongModel> songlist;

  GenerateAudioSourceEvent({required this.songlist});
}

class PlaySongEvent extends SongAndPlayEvent {
  final int currentIndex;

  PlaySongEvent({required this.currentIndex});
}

class PlayAndPauseEvent extends SongAndPlayEvent {
  PlayAndPauseEvent();
}

class PlayNextEvent extends SongAndPlayEvent {}

class PlayPreviousEvent extends SongAndPlayEvent {}
