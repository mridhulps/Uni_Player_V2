import 'package:dartz/dartz.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:uni_player_2/global/MainFailures/mainfailure.dart';

abstract class SonglistService {
  Future<Either<SongListError, List<SongModel>>> getSongList();
}
