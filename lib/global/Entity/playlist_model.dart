import 'package:uni_player_2/global/Entity/songInfo_model.dart';

class CustomPlayListModel {
  final List<CustomSongModel> songList;
  final String playistName;

  CustomPlayListModel({required this.songList, required this.playistName});

  CustomPlayListModel copyWith(
      List<CustomSongModel>? songlist, String? playlistname) {
    return CustomPlayListModel(
        songList: songlist ?? songList,
        playistName: playlistname ?? playistName);
  }
}
