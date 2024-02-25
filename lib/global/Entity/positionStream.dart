// ignore_for_file: file_names

class PositionDataStream {
  final Duration positionsstream;
  final Duration durationstream;
  final Duration currentindexstream;

  PositionDataStream(
      {required this.positionsstream,
      required this.durationstream,
      required this.currentindexstream});
}
