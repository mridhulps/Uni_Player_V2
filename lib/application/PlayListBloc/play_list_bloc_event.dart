part of 'play_list_bloc_bloc.dart';

abstract class PlayListBlocEvent {}

class AddCurrentIndexEvent extends PlayListBlocEvent {
  final int currentindex;

  AddCurrentIndexEvent({required this.currentindex});
}

class AddFavoriteEvent extends PlayListBlocEvent {
  final CustomSongModel favsong;

  AddFavoriteEvent({required this.favsong});
}

class RemoveFromFavoriteEvent extends PlayListBlocEvent {
  final int currentsongid;
  RemoveFromFavoriteEvent({required this.currentsongid});
}

class AddPlayListEvent extends PlayListBlocEvent {
  final CustomPlayListModel playlistmodel;

  AddPlayListEvent({required this.playlistmodel});
}

class AddSongsToCreatePlayListEvent extends PlayListBlocEvent {
  final int selectplaylist;
  final CustomSongModel selectSong;

  AddSongsToCreatePlayListEvent(
      {required this.selectplaylist, required this.selectSong});
}

class AddcurrentSongList extends PlayListBlocEvent {
  final List<CustomSongModel> currentlist;

  AddcurrentSongList({required this.currentlist});
}

class DeleteAllEvent extends PlayListBlocEvent {
  DeleteAllEvent();
}
