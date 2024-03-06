import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_audio/just_audio.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:uni_player_2/Refactory/funtions.dart';

import 'package:uni_player_2/core/permission_acess.dart';
import 'package:uni_player_2/global/Entity/songInfo_model.dart';

import 'package:uni_player_2/global/Locator/locator.dart';

import 'package:uni_player_2/global/domain/instances/instance.dart';

part 'homepage_event.dart';
part 'homepage_state.dart';

class HomepageBloc extends Bloc<HomepageEvent, HomepageState> {
  HomepageBloc() : super(HomepageInitial()) {
    final audioplayer = locator.get<Instances>().audioplayer;

    on<GenerateAudioSourceEvent>(
        (event, emit) => generateAudiosource(event, emit));

    on<PlaySongEvent>((event, emit) => playSong(event, emit, audioplayer));

    on<PlayAndPauseEvent>(
        (event, emit) => playAndpause(event, emit, audioplayer));

    on<ForwardEvent>((event, emit) => forWard(event, emit, audioplayer));

    on<BackwardEvent>((event, emit) => backWard(event, emit, audioplayer));

    on<GetArtworkEvent>((event, emit) {
      emit(state.copyWith(artworkId: event.artworkId));
    });
  }

  generateAudiosource(
      GenerateAudioSourceEvent event, Emitter<HomepageState> emit) async {
    List<UriAudioSource> audiosourcelist = [];

    try {
      for (var e in event.songlist) {
        final list = AudioSource.uri(Uri.parse(e.songuri!));

        audiosourcelist.add(list);
      }

      return emit(state.copyWith(
          modellist: event.songlist,
          audiosource: ConcatenatingAudioSource(children: audiosourcelist)));
    } catch (e) {
      log('generateaudiosource error catched - ${e.toString()}');
      return emit(state.copyWith(
          songlist: [], audiosource: ConcatenatingAudioSource(children: [])));
    }
  }

  playSong(PlaySongEvent event, Emitter<HomepageState> emit,
      AudioPlayer audioplayer) async {
    try {
      audioplayer.setAudioSource(
          state.audiosourceList ?? ConcatenatingAudioSource(children: []),
          initialIndex: event.currentIndex);

      emit(state.copyWith(isplaying: true));

      audioplayer.play();
    } catch (e) {
      log('Error catched ${e.toString()}');

      showtoastCustom('Something Went Wrong to Play');

      return emit(state.copyWith(
        isplaying: false,
      ));
    }
  }

  playAndpause(PlayAndPauseEvent event, Emitter<HomepageState> emit,
      AudioPlayer audioplayer) async {
    if (audioplayer.playerState.playing == true) {
      emit(state.copyWith(isplaying: false));
      audioplayer.pause();
    } else {
      emit(state.copyWith(isplaying: true));
      audioplayer.play();
    }
  }

  forWard(ForwardEvent event, Emitter<HomepageState> emit, AudioPlayer player) {
    if (player.hasNext) {
      player.seekToNext();
    }
  }

  backWard(
      BackwardEvent event, Emitter<HomepageState> emit, AudioPlayer player) {
    if (player.hasPrevious) {
      player.seekToPrevious();
    }
  }
}
