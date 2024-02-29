// ignore_for_file: file_names

class PositionDataStream {
  final Duration positionsstream;
  final Duration durationstream;

  PositionDataStream({
    required this.positionsstream,
    required this.durationstream,
  });
}

class CurrentIndexDataStream {
  final int artwork;
  final String title;

  CurrentIndexDataStream({required this.artwork, required this.title});
}
