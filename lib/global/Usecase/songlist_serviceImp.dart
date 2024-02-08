// ignore_for_file: file_names

import 'package:dartz/dartz.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:uni_player_2/global/Locator/locator.dart';

import 'package:uni_player_2/global/MainFailures/mainfailure.dart';
import 'package:uni_player_2/global/domain/InitialObjects/initialobjects.dart';
import 'package:uni_player_2/global/domain/songlist_service.dart';

class SongListServiceImp extends SonglistService {
  @override
  Future<Either<SongListError, List<SongModel>>> getSongList() async {
    final querysong = locator.get<InitialObjects>().audioQuery;
    final querysong1 = locator.get<InitialObjects>().audioQuery;

    final issame = querysong == querysong1;
    print(issame);

    try {
      final sonlist = querysong.querySongs(
          sortType: SongSortType.DATE_ADDED,
          orderType: OrderType.DESC_OR_GREATER,
          uriType: UriType.EXTERNAL,
          ignoreCase: true);

      return right(await sonlist);
    } catch (e) {
      return left(SongListError(failure: 'GetsonglistError - ${e.toString()}'));
    }
  }
}
