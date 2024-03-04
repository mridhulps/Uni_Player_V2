// ignore_for_file: file_names

import 'dart:developer';

import 'package:dartz/dartz.dart';

import 'package:on_audio_query/on_audio_query.dart';
import 'package:uni_player_2/global/Entity/songInfo_model.dart';

import 'package:uni_player_2/global/Locator/locator.dart';

import 'package:uni_player_2/global/MainFailures/mainfailure.dart';
import 'package:uni_player_2/global/domain/instances/instance.dart';

class SongListServiceImp {
  List<SongModel> songlist = [];

  Future<Either<SongListError, List<SongModel>>> getSongList(
      SongSortType sorttype) async {
    final querysong = locator.get<Instances>().audioQuery;

    try {
      final songList = await querysong.querySongs(
          sortType: sorttype,
          orderType: OrderType.DESC_OR_GREATER,
          uriType: UriType.EXTERNAL,
          ignoreCase: true);

      for (var song in songList) {
        songlist.add(song);
      }

      // final customsongmodellist = songList
      //     .map((e) => CustomSongModel(
      //         songuri: e.uri,
      //         title: e.displayNameWOExt,
      //         artist: e.artist ?? '<Unknown>',
      //         artworkid: e.id,
      //         isfavorite: false))
      //     .toList();

      return right(
        songList,
      );
    } catch (e) {
      log('error catched in songlistserviceIemp');

      return left(SongListError(
        failure: 'GetsonglistError - ${e.toString()}',
      ));
    }
  }
}
