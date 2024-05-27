part of 'song_list_bloc.dart';

abstract class SongListEvent {}

class GrandedPermission extends SongListEvent {}

class DeniedPermission extends SongListEvent {}

class PermenentDeniedPermission extends SongListEvent {}

class GetSonglist extends SongListEvent {
  final SongSortType sorttype;

  GetSonglist({this.sorttype = SongSortType.DATE_ADDED});
}

class SortingEvent extends SongListEvent {
  final SongSortType sort;
  final BuildContext context;

  SortingEvent({required this.sort, required this.context});
}
