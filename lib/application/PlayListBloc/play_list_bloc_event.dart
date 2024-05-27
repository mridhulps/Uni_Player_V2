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

class AddPlayListEvent extends PlayListBlocEvent {
  final CustomPlayListModel playlistmodel;

  AddPlayListEvent({required this.playlistmodel});
}

class AddSongsToCreatePlayListEvent extends PlayListBlocEvent {
  final int selectplaylist;

  AddSongsToCreatePlayListEvent({required this.selectplaylist});
}

class AddcurrentSongList extends PlayListBlocEvent {
  final List<CustomSongModel> currentlist;

  AddcurrentSongList({required this.currentlist});
}

class DeleteAllEvent extends PlayListBlocEvent {
  DeleteAllEvent();
}
