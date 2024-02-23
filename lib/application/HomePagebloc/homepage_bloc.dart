import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_audio/just_audio.dart';
import 'package:on_audio_query/on_audio_query.dart';

import 'package:uni_player_2/global/Locator/locator.dart';
import 'package:uni_player_2/global/Usecase/songlist_serviceImp.dart';
import 'package:uni_player_2/global/domain/instances/instance.dart';

part 'homepage_event.dart';
part 'homepage_state.dart';

class HomepageBloc extends Bloc<HomepageEvent, HomepageState> {
  HomepageBloc() : super(HomepageInitial()) {
    final audioplayer = locator.get<Instances>().audioplayer;

    on<PlaySongEvent>((event, emit) => playSong(event, emit, audioplayer));

    on<PlayAndPauseEvent>(
        (event, emit) => playAndpause(event, emit, audioplayer));

    on<GetArtworkEvent>((event, emit) => getArtwork(event, emit, audioplayer));

    on<ForwardEvent>((event, emit) => forWard(event, emit, audioplayer));

    on<BackwardEvent>((event, emit) => backWard(event, emit, audioplayer));

    on<GenerateAudioListEvent>((event, emit) =>
        generatemusicList(event, emit, audioplayer, event.songlist));

    // on<IndexStreamEvent>((event, emit) => indexStream(
    //       audioplayer,
    //     ));
  }

  playSong(PlaySongEvent event, Emitter<HomepageState> emit,
      AudioPlayer audioplayer) async {
    log(audioplayer.playerState.playing.toString());

    int artwork = 0 ;

    final songlist = locator.get<SongListServiceImp>().modelList;

    audioplayer.setAudioSource(
        state.audiosourceList ?? ConcatenatingAudioSource(children: []),
        initialIndex: event.currentIndex);

    audioplayer.play();

    audioplayer.currentIndexStream.listen((event) {
      if (event == null) {}

      artwork = songlist[event!].id;
    });

    emit(state.copyWith(artworkId: artwork, isplaying: true));

    //emit(state.copyWith(isplaying: true));
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

      // final artworkid = indexStream(player);

      //  log('forward pressed ${a

      //  emit(state.copyWith(artworkId: artworkid));

      // final title = streamvalue['title'];

      // final artwork = streamvalue['artworkId'];

      // log(title);
      // log(artwork.toString());

      // return emit(state.copyWith(songtitle: title, artworkId: artwork));
    }
  }

  backWard(
      BackwardEvent event, Emitter<HomepageState> emit, AudioPlayer player) {
    if (player.hasPrevious) {
      player.seekToPrevious();
    }
  }

  generatemusicList(GenerateAudioListEvent event, Emitter<HomepageState> emit,
      AudioPlayer player, List<SongModel> songlist) {
    final list =
        songlist.map((e) => AudioSource.uri(Uri.parse(e.uri!))).toList();

    emit(state.copyWith(audiosource: ConcatenatingAudioSource(children: list)));
  }

  indexStream(
    AudioPlayer audioplayer,
  ) {
    final songlist = locator.get<SongListServiceImp>().modelList;

    int? artwork;

    audioplayer.currentIndexStream.listen((event) {
      log('currentindex $event');
      if (event == null) {
        return;
      }

      artwork = songlist[event].id;
      log('artwork $artwork');
    });

    return artwork ?? 0;
  }
}
