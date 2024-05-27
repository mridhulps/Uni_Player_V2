// ignore_for_file: file_names

import 'dart:developer';

import 'package:dartz/dartz.dart';

import 'package:on_audio_query/on_audio_query.dart';
import 'package:uni_player_2/global/Entity/songInfo_model.dart';


import 'package:uni_player_2/global/MainFailures/mainfailure.dart';
import 'package:uni_player_2/global/domain/instances/instance.dart';

class SongListServiceImp {
  Future<Either<SongListError, List<CustomSongModel>>> getSongList(
      SongSortType sorttype) async {
    final querysong = Instances.audioQuery;

    try {
      final songList = await querysong.querySongs(
          sortType: sorttype,
          orderType: OrderType.DESC_OR_GREATER,
          uriType: UriType.EXTERNAL,
          ignoreCase: true);
      final modellist = songList
          .map((song) => CustomSongModel(
              songuri: song.uri,
              title: song.displayNameWOExt,
              artist: song.artist ?? '<Unknown>',
              artworkid: song.id))
          .toList();

      return right(
        modellist,
      );
    } catch (e) {
      log('error catched in songlistserviceIemp');

      return left(SongListError(
        failure: 'GetsonglistError - ${e.toString()}',
      ));
    }
  }
}
