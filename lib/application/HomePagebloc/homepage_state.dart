part of 'homepage_bloc.dart';

class HomepageState {
  final bool isplaying;
  final int currentIndex;
  final int artworkId;

  HomepageState({
    required this.isplaying,
    required this.currentIndex,
    required this.artworkId,
  });

  HomepageState copyWith({bool? isplaying,int ?artworkId}) {
    return HomepageState(
      isplaying: isplaying ?? this.isplaying,
      currentIndex: currentIndex,
      artworkId: artworkId?? this.artworkId,
    );
  }
}

final class HomepageInitial extends HomepageState {
  HomepageInitial({
    super.isplaying = false,
    super.currentIndex = 0,
    super.artworkId = 0,
  });
}
