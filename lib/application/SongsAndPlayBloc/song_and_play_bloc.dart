import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_audio/just_audio.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:uni_player_2/core/permission_acess.dart';
import 'package:uni_player_2/global/Entity/songInfo_model.dart';

part 'song_and_play_event.dart';
part 'song_and_play_state.dart';

class SongAndPlayBloc extends Bloc<SongAndPlayEvent, SongAndPlayState> {
  SongAndPlayBloc() : super(SongAndPlayInitial()) {
    on<SongAndPlayEvent>((event, emit) {});
  }
}
