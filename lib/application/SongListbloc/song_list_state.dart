part of 'song_list_bloc.dart';

class SongListState {
  final bool isLoading;
  final bool isFailure;
  final PermissionType permissionstat;
  final bool? alreadyLoaded;
  final SongSortType sorttype;

  final List<CustomSongModel> songList;

  SongListState(
      {required this.isLoading,
      required this.isFailure,
      required this.permissionstat,
      this.alreadyLoaded = false,
      this.sorttype = SongSortType.DATE_ADDED,
      required this.songList});

  SongListState copyWith({
    PermissionType? permissiontype,
    bool? isloadings,
    bool? isFailures,
    bool? alreadyloaded,
    SongSortType? sortingtype,
    List<CustomSongModel>? songlist,
  }) {
    return SongListState(
        permissionstat: permissiontype ?? permissionstat,
        isFailure: isFailures ?? isFailure,
        isLoading: isloadings ?? isLoading,
        alreadyLoaded: alreadyloaded ?? alreadyLoaded,
        sorttype: sortingtype ?? sorttype,
        songList: songlist ?? songList);
  }
}

final class SongListInitial extends SongListState {
  SongListInitial()
      : super(
            permissionstat: PermissionType.initial,
            isLoading: false,
            isFailure: false,
            sorttype: SongSortType.DATE_ADDED,
            songList: []);
}
