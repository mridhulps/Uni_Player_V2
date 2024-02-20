part of 'homepage_bloc.dart';

class HomepageState {
  final bool isLoading;
  final int currentIndex;
  final int artworkId;

  HomepageState({
    required this.isLoading,
    required this.currentIndex,
    required this.artworkId,
  });

  HomepageState copyWith() {
    return HomepageState(
      isLoading: isLoading,
      currentIndex: currentIndex,
      artworkId: artworkId,
    );
  }
}

final class HomepageInitial extends HomepageState {
  HomepageInitial({
    super.isLoading = false,
    super.currentIndex = 0,
    super.artworkId = 0,
  });
}
