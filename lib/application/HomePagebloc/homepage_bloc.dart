import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_audio/just_audio.dart';

import 'package:uni_player_2/global/Locator/locator.dart';
import 'package:uni_player_2/global/domain/instances/instance.dart';

part 'homepage_event.dart';
part 'homepage_state.dart';

class HomepageBloc extends Bloc<HomepageEvent, HomepageState> {
  HomepageBloc() : super(HomepageInitial()) {
    final audioplayer = locator.get<Instances>().audioplayer;

    on<PlaySongEvent>((event, emit) => playSong(event, emit, audioplayer));

    on<PlayAndPauseEvent>(
        (event, emit) => playAndpause(event, emit, audioplayer));
  }

  playSong(PlaySongEvent event, Emitter<HomepageState> emit,
      AudioPlayer audioplayer) async {
    log(audioplayer.playerState.playing.toString());

    emit(HomepageState(
      artworkId: event.artworkId,
      isLoading: false,
      currentIndex: event.currentIndex,
    ));

    await audioplayer.setUrl(event.currentsonguri);

    audioplayer.play();
  }

  playAndpause(PlayAndPauseEvent event, Emitter<HomepageState> emit,
      AudioPlayer audioplayer) async {
    if (audioplayer.playerState.playing == true) {
      await audioplayer.pause();
    } else {
      await audioplayer.play();
    }
  }
}
