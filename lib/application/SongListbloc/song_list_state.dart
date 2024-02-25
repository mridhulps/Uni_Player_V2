part of 'song_list_bloc.dart';

class SongListState {
  final bool isLoading;
  final bool isFailure;
  final PermissionType permissionstat;
  final List<SongModel> songList;

  SongListState(
      {required this.isLoading,
      required this.isFailure,
      required this.permissionstat,
      required this.songList});

  SongListState copyWith({
    PermissionType? permissiontype,
    bool? isloadings,
    bool? isFailures,
    List<SongModel>? songlist,
  }) {
    return SongListState(
        permissionstat: permissiontype ?? permissionstat,
        isFailure: isFailures ?? isFailure,
        isLoading: isloadings ?? isLoading,
        songList: songlist ?? songList);
  }
}

final class SongListInitial extends SongListState {
  SongListInitial()
      : super(
            permissionstat: PermissionType.initial,
            isLoading: false,
            isFailure: false,
            songList: []);
}
