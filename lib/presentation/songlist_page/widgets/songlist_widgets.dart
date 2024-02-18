import 'package:flutter/material.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:uni_player_2/Refactory/widgets.dart';
import 'package:uni_player_2/app_Global_const/const.dart';

class SongLIstWidget extends StatelessWidget {
  final List<SongModel> songlist;

  const SongLIstWidget({super.key, required this.songlist});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          final song = songlist[index];

          print(songlist.length.toString());

          return ListTile(
            leading: iconWidget(icon: Icons.music_note),
            title: CustomText(
                string: song.displayNameWOExt,
                fontweight: FontWeight.bold,
                fonttype: FontType.roboto,
                color: ConstColor.whitecolor),
            subtitle: Text(
              song.artist ?? '<Unknown>',
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: Colors.grey.shade600),
            ),
            trailing: iconWidget(icon: Icons.more_vert),
          );
        },
        separatorBuilder: (context, index) {
          return const SizedBox();
        },
        itemCount: songlist.length);
  }
}
