import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:uni_player_2/Refactory/widgets.dart';
import 'package:uni_player_2/app_Global_const/const.dart';

import 'package:uni_player_2/application/PlayListBloc/play_list_bloc_bloc.dart';
import 'package:uni_player_2/application/SongsAndPlayBloc/song_and_play_bloc.dart';

import 'package:uni_player_2/global/Entity/songInfo_model.dart';

class SongLIstWidget extends StatelessWidget {
  final List<CustomSongModel> songlist;
  final ScrollController? controller;

  const SongLIstWidget({super.key, required this.songlist, this.controller});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        controller: controller,
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          final song = songlist[index];

          return ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.transparent,
              radius: 20,
              child: onlyqueryArtwork(
                  artworkId: song.artworkid,
                  nullwiget: StreamNullWidget.musicnote,
                  musicnotesize: 25),
            ),
            title: CustomText(
                string: song.title,
                fontweight: FontWeight.bold,
                fonttype: FontType.roboto,
                texttype: TextType.titleMedium,
                color: ConstColor.whitecolor),
            subtitle: CustomText(
              string: song.artist,
              fonttype: FontType.roboto,
              color: Colors.white54,
            ),
            trailing: iconWidget(icon: Icons.more_vert),
            onTap: () => onClick(context, songlist, index),
          );
        },
        separatorBuilder: (context, index) {
          return const SizedBox();
        },
        itemCount: songlist.length);
  }
}

void onClick(
    BuildContext context, List<CustomSongModel> songlist, int currentindex) {
  context
      .read<SongAndPlayBloc>()
      .add(GenerateAudioSourceEvent(songlist: songlist));

  context
      .read<SongAndPlayBloc>()
      .add(PlaySongEvent(currentIndex: currentindex));
}
