import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_audio/just_audio.dart';
import 'package:on_audio_query/on_audio_query.dart';

import 'package:uni_player_2/core/permission_acess.dart';

import 'package:uni_player_2/global/Locator/locator.dart';
import 'package:uni_player_2/global/Usecase/songlist_serviceImp.dart';
import 'package:uni_player_2/global/domain/instances/instance.dart';

part 'homepage_event.dart';
part 'homepage_state.dart';

class HomepageBloc extends Bloc<HomepageEvent, HomepageState> {
  HomepageBloc() : super(HomepageInitial()) {
    final audioplayer = locator.get<Instances>().audioplayer;

    on<GetSonglistEvnet>((event, emit) => getSongList(event, emit));

    on<PlaySongEvent>((event, emit) => playSong(event, emit, audioplayer));

    on<PlayAndPauseEvent>(
        (event, emit) => playAndpause(event, emit, audioplayer));

    on<ForwardEvent>((event, emit) => forWard(event, emit, audioplayer));

    on<BackwardEvent>((event, emit) => backWard(event, emit, audioplayer));

    // on<IndexStreamEvent>(
    //     (event, emit) => indexstream(event, emit, audioplayer));
  }

  getSongList(GetSonglistEvnet event, Emitter<HomepageState> emit) async {
    emit(state.copyWith(
        isloadings: true, permissiontype: PermissionType.granded));

    final songlist = await locator.get<SongListServiceImp>().getSongList();

    songlist.fold((error) {
      return emit(
          state.copyWith(isFailures: true, isloadings: false, songlist: []));
    }, (list) {
      final audiolist =
          list.map((e) => AudioSource.uri(Uri.parse(e.uri!))).toList();

      return emit(state.copyWith(
        isFailures: false,
        isloadings: false,
        alreadyLoaded: true,
        songlist: list,
        audiosource: ConcatenatingAudioSource(children: audiolist),
      ));
    });
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

      emit(state.copyWith(isplaying: false, isFailures: true));
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
