// ignore_for_file: file_names

import 'package:dartz/dartz.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:uni_player_2/global/Locator/locator.dart';

import 'package:uni_player_2/global/MainFailures/mainfailure.dart';
import 'package:uni_player_2/global/domain/instances/instance.dart';
import 'package:uni_player_2/global/domain/songlist_service.dart';

class SongListServiceImp extends SonglistService {
  @override
  Future<Either<SongListError, List<SongModel>>> getSongList() async {
    final querysong = locator.get<Instances>().audioQuery;

    try {
      final songlist = await querysong.querySongs(
          sortType: SongSortType.ALBUM,
          orderType: OrderType.DESC_OR_GREATER,
          uriType: UriType.EXTERNAL,
          ignoreCase: true);

      return right(songlist);
    } catch (e) {
      print('error catched in songlistserviceIemp');
      return left(SongListError(failure: 'GetsonglistError - ${e.toString()}'));
    }
  }
}
