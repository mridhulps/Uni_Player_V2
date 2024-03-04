part of 'song_list_bloc.dart';

abstract class SongListEvent {}

class GrandedPermission extends SongListEvent {}

class DeniedPermission extends SongListEvent {}

class PermenentDeniedPermission extends SongListEvent {}

class GetSonglist extends SongListEvent {
  final BuildContext context;

  final SongSortType sorttype;

  GetSonglist({required this.context, this.sorttype = SongSortType.DATE_ADDED});
}

class SortingEvent extends SongListEvent {}
