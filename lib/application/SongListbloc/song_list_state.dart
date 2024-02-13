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
    bool? isloadings,
    bool? isFailures,
    PermissionType? permissiontype,
    List<SongModel>? songlist,
  }) {
    return SongListState(
        isFailure: isFailures ?? isFailure,
        isLoading: isloadings ?? isLoading,
        permissionstat: permissiontype ?? permissionstat,
        songList: songlist ?? songList);
  }
}

final class SongListInitial extends SongListState {
  SongListInitial()
      : super(
            isLoading: false,
            isFailure: false,
            permissionstat: PermissionType.initial,
            songList: []);
}
