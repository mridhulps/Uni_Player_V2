import 'dart:async';
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

    on<GetArtworkEvent>((event, emit) => getArtwork(event, emit, audioplayer));

    on<ForwardEvent>((event, emit) => forWard(event, emit, audioplayer));

    on<BackwardEvent>((event, emit) => backWard(event, emit, audioplayer));

    on<GenerateAudioListEvent>((event, emit) => generatemusicList(
          event,
          emit,
          audioplayer,
        ));

    // on<IndexStreamEvent>((event, emit) => indexStream(audioplayer, emit));
  }

  getSongList(GetSonglistEvnet event, Emitter<HomepageState> emit) async {
    emit(state.copyWith(
        isloadings: true, permissiontype: PermissionType.granded));

    final songlist = await locator.get<SongListServiceImp>().getSongList();

    songlist.fold((error) async {
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
    log(state.audiosourceList.toString());
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

  getArtwork(
      GetArtworkEvent event, Emitter<HomepageState> emit, AudioPlayer player) {
    final songlist = locator.get<SongListServiceImp>().modelList;

    player.currentIndexStream.listen((index) {
      if (index == null) {
        return;
      } else {
        final title = songlist[index].displayNameWOExt;
        final artworkid = songlist[index].id;

        log('currentindex $title');

        return emit(state.copyWith(songtitle: title, artworkId: artworkid));
      }
    });

    return emit(
        state.copyWith(artworkId: event.artworkId, songtitle: event.title));
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

  generatemusicList(GenerateAudioListEvent event, Emitter<HomepageState> emit,
      AudioPlayer player) {
    locator.get<SongListServiceImp>().getSongList();

    final list =
        state.songList.map((e) => AudioSource.uri(Uri.parse(e.uri!))).toList();

    state.copyWith(audiosource: ConcatenatingAudioSource(children: list));
  }

  indexStream(AudioPlayer audioplayer, Emitter<HomepageState> emit) {
    //   audioplayer.currentIndexStream.listen((event) {
    //     log('currentindex $event');
    //     if (event == null) {
    //       return;
    //     }

    //     int artwork = state.songList[event].id;
    //     String title = state.songList[event].displayNameWOExt;

    //     log('artwork $artwork');
    //     log('indexstream builded');

    //     emit(state.copyWith(artworkId: artwork, songtitle: title));
    //   });
  }
}
