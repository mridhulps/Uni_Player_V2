part of 'homepage_bloc.dart';

abstract class HomepageState {}

final class ArtworkState extends HomepageState {
  final bool isLoading;
  final int currentIndex;
  final int artworkId;

  ArtworkState({
    required this.isLoading,
    required this.currentIndex,
    required this.artworkId,
  });

  ArtworkState copyWith(
      {bool? isplaying, bool? isloading, int? currentindex, int? artworkid}) {
    return ArtworkState(
      isLoading: isloading ?? isLoading,
      currentIndex: currentindex ?? currentIndex,
      artworkId: artworkid ?? artworkId,
    );
  }
}

final class ArtworkStateInitial extends ArtworkState {
  ArtworkStateInitial({
    super.isLoading = false,
    super.currentIndex = 0,
    super.artworkId = 0,
  });
}

final class PlayingState extends HomepageState {
  final bool? isPlaying;

  PlayingState({required this.isPlaying});

  PlayingState copyWith({bool? isplaying}) {
    return PlayingState(
      isPlaying: isplaying ?? isPlaying,
    );
  }
}
