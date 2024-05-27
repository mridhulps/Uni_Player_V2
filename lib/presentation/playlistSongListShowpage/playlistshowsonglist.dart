import 'package:flutter/material.dart';

import 'package:uni_player_2/Refactory/widgets.dart';
import 'package:uni_player_2/app_Global_const/const.dart';

import 'package:uni_player_2/global/Entity/songInfo_model.dart';

class PlayListSongList extends StatelessWidget {
  final List<CustomSongModel> songlist;
  final String playlistname;

  const PlayListSongList(
      {super.key, required this.songlist, required this.playlistname});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ConstColor.backgroundcolor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        title: CustomText(string: playlistname),
        centerTitle: true,
      ),
      body: SafeArea(
          child: SizedBox(
              child: ListView.separated(
                  itemBuilder: (context, index) {
                    if (songlist.isEmpty) {
                      return const Center(
                        child: CustomText(
                          string: 'No Song Found',
                          color: Colors.white,
                        ),
                      );
                    } else {
                      final model = songlist[index];

                      return ListTile(
                        title: CustomText(
                          string: model.title.toString(),
                        ),
                        subtitle: CustomText(string: model.artist),
                      );
                    }
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox();
                  },
                  itemCount: songlist.length))),
    );
  }
}
