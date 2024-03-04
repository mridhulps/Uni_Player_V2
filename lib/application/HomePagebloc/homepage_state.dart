part of 'homepage_bloc.dart';

class HomepageState {
  final PermissionType permissionstat;
  bool alreadyLoaded;
  final bool isLoading;
  final bool isplaying;
  final bool isFailure;

  final int artworkId;
  final String? currentsongtitle;
  final String? currentsongartist;
  final ConcatenatingAudioSource? audiosourceList;
  final List<SongModel> songList;
  final List<CustomSongModel> modelList;
  final int currentIndex;

  HomepageState({
    required this.permissionstat,
    required this.alreadyLoaded,
    required this.isplaying,
    //required this.isnext,
    required this.artworkId,
    this.currentsongartist,
    this.currentsongtitle,
    required this.isLoading,
    required this.isFailure,
    required this.songList,
    this.modelList = const [],
    this.audiosourceList,
    this.currentIndex = 0,
  });

  HomepageState copyWith(
      {bool? isplaying,
      int? currentindex,
      bool? alreadyLoaded,
      PermissionType? permissiontype,
      int? artworkId,
      String? songtitle,
      String? songartist,
      bool? isloadings,
      bool? isFailures,
      List<SongModel>? songlist,
      List<CustomSongModel>? modellist,
      ConcatenatingAudioSource? audiosource}) {
    return HomepageState(
        alreadyLoaded: alreadyLoaded ?? this.alreadyLoaded,
        currentIndex: currentindex ?? currentIndex,
        permissionstat: permissiontype ?? permissionstat,
        isplaying: isplaying ?? this.isplaying,
        artworkId: artworkId ?? this.artworkId,
        currentsongtitle: songtitle ?? currentsongtitle,
        currentsongartist: songartist ?? currentsongartist,
        isFailure: isFailures ?? isFailure,
        isLoading: isloadings ?? isLoading,
        songList: songlist ?? songList,
        modelList: modellist ?? modelList,
        audiosourceList: audiosource ?? audiosourceList);
  }
}

final class HomepageInitial extends HomepageState {
  HomepageInitial({
    super.permissionstat = PermissionType.initial,
    super.alreadyLoaded = false,
    super.isplaying = false,
    super.artworkId = 0,
    super.currentsongtitle = 'Play Song',
    super.currentsongartist = '',
    super.isLoading = false,
    super.isFailure = false,
    super.songList = const [],
  });
}
