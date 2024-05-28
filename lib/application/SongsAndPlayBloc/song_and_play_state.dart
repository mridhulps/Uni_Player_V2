part of 'song_and_play_bloc.dart';

class SongAndPlayState {
  final PermissionType permissionstat;
  final bool alreadySongListLoaded;
  final bool isLoading;
  final bool isplaying;
  final bool isFailure;
  final int? currentIndex;

  final SongSortType sorttype;

  final ConcatenatingAudioSource? audiosourceList;

  final List<CustomSongModel> sortingList;

  final List<CustomSongModel> currentSongList;

  SongAndPlayState({
    required this.permissionstat,
    required this.alreadySongListLoaded,
    required this.isplaying,
    required this.isLoading,
    required this.isFailure,
    this.audiosourceList,
    this.currentIndex,
    this.sorttype = SongSortType.DATE_ADDED,
    required this.sortingList,
    required this.currentSongList,
  });

  SongAndPlayState copyWith(
      {bool? isplaying,
      int? currentindex,
      bool? alreadyLoaded,
      PermissionType? permissiontype,
      int? artworkId,
      String? songtitle,
      String? songartist,
      bool? isloadings,
      bool? isFailures,
      SongSortType? sortingtype,
      List<CustomSongModel>? sortingList,
      List<CustomSongModel>? currentsonglist,
      ConcatenatingAudioSource? audiosource}) {
    return SongAndPlayState(
      alreadySongListLoaded: alreadyLoaded ?? alreadySongListLoaded,
      currentIndex: currentindex ?? currentIndex,
      permissionstat: permissiontype ?? permissionstat,
      isplaying: isplaying ?? this.isplaying,
      isFailure: isFailures ?? isFailure,
      isLoading: isloadings ?? isLoading,
      sorttype: sortingtype ?? sorttype,
      sortingList: sortingList ?? this.sortingList,
      currentSongList: currentsonglist ?? currentSongList,
      audiosourceList: audiosource ?? audiosourceList,
    );
  }
}

final class SongAndPlayInitial extends SongAndPlayState {
  SongAndPlayInitial({
    super.permissionstat = PermissionType.initial,
    super.alreadySongListLoaded = false,
    super.isplaying = false,
    super.isLoading = false,
    super.isFailure = false,
    super.sortingList = const[],
    super.currentSongList = const [],
    super.sorttype = SongSortType.DATE_ADDED,
  });
}
