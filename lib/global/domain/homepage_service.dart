import 'package:on_audio_query/on_audio_query.dart';
import 'package:uni_player_2/global/Entity/songInfo_model.dart';

class HomepageService {
  List<CustomSongModel> customModelList(
      {required List<SongModel> songModellist}) {
    return songModellist
        .map((e) => CustomSongModel(
            title: e.displayNameWOExt, subtitle: e.artist!, isfavorite: false))
        .toList();
  }
}
