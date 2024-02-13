part of 'song_list_bloc.dart';

abstract class SongListEvent {}

class PermissionAccess extends SongListEvent {
  final BuildContext context;
  PermissionAccess({required this.context});
}

class GetSonglist extends SongListEvent {
  final bool? permissiongranded;

  GetSonglist({this.permissiongranded});
}
