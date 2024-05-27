part of 'song_and_play_bloc.dart';

class SongAndPlayState {
  final PermissionType permissionstat;
  final bool alreadyLoaded;
  final bool isLoading;
  final bool isplaying;
  final bool isFailure;
  final int? currentIndex;

  final ConcatenatingAudioSource? audiosourceList;

  final List<CustomSongModel> currentPLayingList;

  final SongSortType sorttype;

  SongAndPlayState({
    required this.permissionstat,
    required this.alreadyLoaded,
    required this.isplaying,
    required this.isLoading,
    required this.isFailure,
    this.audiosourceList,
    this.currentIndex,
    required this.currentPLayingList,
    this.sorttype = SongSortType.DATE_ADDED,
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
      List<CustomSongModel>? songlist,
      List<CustomSongModel>? currentsonglist,
      ConcatenatingAudioSource? audiosource}) {
    return SongAndPlayState(
      alreadyLoaded: alreadyLoaded ?? this.alreadyLoaded,
      currentIndex: currentindex ?? currentIndex,
      permissionstat: permissiontype ?? permissionstat,
      isplaying: isplaying ?? this.isplaying,
      isFailure: isFailures ?? isFailure,
      isLoading: isloadings ?? isLoading,
      currentPLayingList: currentsonglist ?? currentPLayingList,
      audiosourceList: audiosource ?? audiosourceList,
      sorttype: sortingtype ?? sorttype,
    );
  }
}

final class SongAndPlayInitial extends SongAndPlayState {
  SongAndPlayInitial({
    super.permissionstat = PermissionType.initial,
    super.alreadyLoaded = false,
    super.isplaying = false,
    super.isLoading = false,
    super.isFailure = false,
    super.currentPLayingList = const [],
    super.sorttype = SongSortType.DATE_ADDED,
  });
}
