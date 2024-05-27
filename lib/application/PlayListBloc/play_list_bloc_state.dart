part of 'play_list_bloc_bloc.dart';

class PlayListBlocState {
  bool isLoading;
  bool isError;
  int currentIndex;
  List<CustomPlayListModel> playLists;
  List<CustomSongModel> favoriteList;
  List<CustomSongModel> currentSonglist;

  PlayListBlocState(
      {required this.isLoading,
      required this.isError,
      required this.currentIndex,
      required this.playLists,
      required this.favoriteList,
      required this.currentSonglist});

  PlayListBlocState copywith(
      {bool? isloading,
      bool? iserror,
      int? currentindex,
      List<CustomPlayListModel>? playlists,
      List<CustomSongModel>? favoritelist,
      List<CustomSongModel>? currentsongmodel}) {
    return PlayListBlocState(
        isLoading: isloading ?? isLoading,
        isError: iserror ?? isError,
        currentIndex: currentindex ?? currentIndex,
        playLists: playlists ?? playLists,
        favoriteList: favoritelist ?? favoriteList,
        currentSonglist: currentsongmodel ?? currentSonglist);
  }
}

final class PlayListBlocInitial extends PlayListBlocState {
  PlayListBlocInitial(
      {super.isLoading = false,
      super.isError = false,
      super.currentIndex = -0,
      super.playLists = const [],
      super.favoriteList = const [],
      super.currentSonglist = const []});
}
