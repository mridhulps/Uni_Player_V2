part of 'song_list_bloc.dart';

class SongListState {
  final bool isLoading;
  final bool isFailure;

  final List<SongModel> songList;

  SongListState(
      {required this.isLoading,
      required this.isFailure,
      required this.songList});

  SongListState copyWith(
      {bool? isloadings, bool? isFailures, List<SongModel>? songlist}) {
    return SongListState(
        isFailure: isFailures ?? isFailure,
        isLoading: isloadings ?? isLoading,
        songList: songlist ?? songList);
  }
}

final class SongListInitial extends SongListState {
  SongListInitial() : super(isLoading: false, isFailure: false, songList: []);
}
