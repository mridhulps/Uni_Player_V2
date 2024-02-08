import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:uni_player_2/global/Locator/locator.dart';
import 'package:uni_player_2/global/Usecase/songlist_serviceImp.dart';

part 'song_list_event.dart';
part 'song_list_state.dart';

class SongListBloc extends Bloc<SongListEvent, SongListState> {
  SongListBloc() : super(SongListInitial()) {
    on<GetsonglistEvent>((event, emit) async {
      final getsong = locator.get<SongListServiceImp>();

      final songlist = await getsong.getSongList();

      state.copyWith(isloadings: true);

      return songlist.fold(
          (failure) =>
              state.copyWith(isloadings: false, isFailures: true, songlist: []),
          (songlist) => state.copyWith(
              isloadings: false, isFailures: false, songlist: songlist));
    });
  }
}
