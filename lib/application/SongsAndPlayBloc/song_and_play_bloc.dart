import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_audio/just_audio.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:uni_player_2/Refactory/funtions.dart';
import 'package:uni_player_2/core/permission_acess.dart';
import 'package:uni_player_2/global/Entity/songInfo_model.dart';
import 'package:uni_player_2/global/Locator/locator.dart';
import 'package:uni_player_2/global/Usecase/songlist_serviceImp.dart';
import 'package:uni_player_2/global/domain/instances/instance.dart';

part 'song_and_play_event.dart';
part 'song_and_play_state.dart';

class SongAndPlayBloc extends Bloc<SongAndPlayEvent, SongAndPlayState> {
  SongAndPlayBloc() : super(SongAndPlayInitial()) {
    final audioplayer = Instances.audioplayer;
    on<GenerateAudioSourceEvent>(
        (event, emit) => generateAudiosource(event, emit));

    on<PlaySongEvent>((event, emit) => playSong(event, emit, audioplayer));

    on<PlayAndPauseEvent>(
        (event, emit) => playAndpause(event, emit, audioplayer));

    on<PlayNextEvent>((event, emit) => playNext(event, emit, audioplayer));

    on<PlayPreviousEvent>(
        (event, emit) => playPrevious(event, emit, audioplayer));

    on<GrandedPermission>((event, emit) => grandedpermission(event, emit));

    on<DeniedPermission>((event, emit) => deniedPermission(event, emit));

    on<PermenentDeniedPermission>(
        (event, emit) => permenentDeniedPermission(event, emit));

    on<GetSonglist>((event, emit) => getSongList(event, emit));

    on<SortingEvent>((event, emit) {
      emit(state.copyWith(sortingtype: event.sort));

      event.context
          .read<SongAndPlayBloc>()
          .add(GetSonglist(sorttype: state.sorttype));
    });
  }

  //REQUIST PERMISSION METHODE;
  grandedpermission(
      GrandedPermission event, Emitter<SongAndPlayState> emit) async {
    return emit(state.copyWith(permissiontype: PermissionType.granded));
  }

  deniedPermission(DeniedPermission event, Emitter<SongAndPlayState> emit) {
    return emit(state.copyWith(permissiontype: PermissionType.denied));
  }

  permenentDeniedPermission(
      PermenentDeniedPermission event, Emitter<SongAndPlayState> emit) {
    return emit(state.copyWith(permissiontype: PermissionType.permanentdenied));
  }

  // GENERATE CONCATINATING AUDIOSOURCE LIST;

  generateAudiosource(
      GenerateAudioSourceEvent event, Emitter<SongAndPlayState> emit) async {
    List<UriAudioSource> audiosourcelist = [];

    try {
      for (var e in event.songlist) {
        final list = AudioSource.uri(Uri.parse(e.songuri!));

        audiosourcelist.add(list);
      }

      emit(state.copyWith(
        currentsonglist: event.songlist,
        audiosource: ConcatenatingAudioSource(children: audiosourcelist),
      ));
    } catch (e) {
      log('generateaudiosource error catched - ${e.toString()}');
      emit(state.copyWith(
          currentsonglist: [],
          audiosource: ConcatenatingAudioSource(children: [])));
    }
  }

  //PLAYSONG ;

  playSong(PlaySongEvent event, Emitter<SongAndPlayState> emit,
      AudioPlayer audioplayer) async {
    try {
      audioplayer.setAudioSource(
          state.audiosourceList ?? ConcatenatingAudioSource(children: []),
          initialIndex: event.currentIndex);

      emit(state.copyWith(
        isplaying: true,
      ));

      audioplayer.play();
    } catch (e) {
      log('Error catched ${e.toString()}');

      customToast('Something Went Wrong to Play');

      return emit(state.copyWith(
        isplaying: false,
      ));
    }
  }

  //PLAY AND PAUSE ;

  playAndpause(PlayAndPauseEvent event, Emitter<SongAndPlayState> emit,
      AudioPlayer audioplayer) async {
    if (audioplayer.playerState.playing == true) {
      emit(state.copyWith(isplaying: false));
      audioplayer.pause();
    } else {
      emit(state.copyWith(isplaying: true));
      audioplayer.play();
    }
  }

  //PLAY NEXT ;

  playNext(
      PlayNextEvent event, Emitter<SongAndPlayState> emit, AudioPlayer player) {
    if (player.hasNext) {
      player.seekToNext();
    }
  }

  //PLAY PREVIOUS;

  playPrevious(PlayPreviousEvent event, Emitter<SongAndPlayState> emit,
      AudioPlayer player) {
    if (player.hasPrevious) {
      player.seekToPrevious();
    }
  }

  // GET SONGLIST MODEL FROM PACKAGE;
  getSongList(GetSonglist event, Emitter<SongAndPlayState> emit) async {
    log(event.sorttype.name.toString());

    emit(state.copyWith(
        isloadings: true, permissiontype: PermissionType.granded));

    final songlist =
        await locator.get<SongListServiceImp>().getSongList(state.sorttype);

    songlist.fold((error) {
      return emit(
          state.copyWith(isFailures: true, isloadings: false, songlist: []));
    }, (list) {
      return emit(
          state.copyWith(isFailures: false, isloadings: false, songlist: list));
    });
  }
}
