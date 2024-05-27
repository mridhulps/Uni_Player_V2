import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:uni_player_2/Refactory/funtions.dart';

import 'package:uni_player_2/global/Entity/playlist_model.dart';
import 'package:uni_player_2/global/Entity/songInfo_model.dart';

part 'play_list_bloc_event.dart';
part 'play_list_bloc_state.dart';

class PlayListBlocBloc extends Bloc<PlayListBlocEvent, PlayListBlocState> {
  PlayListBlocBloc() : super(PlayListBlocInitial()) {
    on<AddPlayListEvent>((event, emit) => addPlayList(event, emit));
    on<AddFavoriteEvent>((event, emit) => addtofavorite(event, emit));
    on<AddSongsToCreatePlayListEvent>(
        (event, emit) => addSongToPlaylist(event, emit));
    on<DeleteAllEvent>((event, emit) => deleteAllPlaylist(event, emit));

    on<AddcurrentSongList>((event, emit) => addcurrentsonglist(event, emit));

    on<AddCurrentIndexEvent>((event, emit) => addcurrentIndex(event, emit));
  }

  addPlayList(AddPlayListEvent event, Emitter<PlayListBlocState> emit) {
    final playlist = event.playlistmodel;

    final copylist = List<CustomPlayListModel>.from(state.playLists);

    copylist.add(playlist);

    return emit(state.copywith(playlists: copylist.reversed.toList()));
  }

  addtofavorite(AddFavoriteEvent event, Emitter<PlayListBlocState> emit) {
    final song = event.favsong;

    final copylist = List<CustomSongModel>.from(state.favoriteList);

    copylist.add(song);
    customToast('Added to Favorite');

    return emit(state.copywith(favoritelist: copylist));
  }

  addSongToPlaylist(
      AddSongsToCreatePlayListEvent event, Emitter<PlayListBlocState> emit) {
    final selectplaylist = event.selectplaylist;

    final currentsong = state.currentSonglist[state.currentIndex];

    state.playLists[selectplaylist].songList.add(currentsong);
    emit(state);
    customToast(
        'Song Added to -( ${state.playLists[selectplaylist].playistName} )');
  }

  deleteAllPlaylist(DeleteAllEvent event, Emitter<PlayListBlocState> emit) {
    customToast('All Deleted');
    emit(state.copywith(playlists: []));
  }

  addcurrentsonglist(
      AddcurrentSongList event, Emitter<PlayListBlocState> emit) {
    List<CustomSongModel> list = event.currentlist;

    emit(state.copywith(currentsongmodel: list));
  }

  addcurrentIndex(AddCurrentIndexEvent event, Emitter<PlayListBlocState> emit) {
    emit(state.copywith(currentindex: event.currentindex));
  }
}
