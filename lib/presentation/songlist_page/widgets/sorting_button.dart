import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:uni_player_2/Refactory/widgets.dart';
import 'package:uni_player_2/app_Global_const/const.dart';
import 'package:uni_player_2/application/SongListbloc/song_list_bloc.dart';

class SortingDropdown extends StatelessWidget {
  const SortingDropdown({super.key});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<SongSortType>(
        shape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide.none),
        clipBehavior: Clip.antiAlias,
        color: ConstColor.backgroundcolor,
        elevation: 10,
        tooltip: 'Sort',
        onSelected: (value) {
          context
              .read<SongListBloc>()
              .add(SortingEvent(context: context, sort: value));
        },
        child: iconWidget(icon: Icons.sort_rounded, paddingright: 15),
        itemBuilder: (context) => [
              customItem('Date', SongSortType.DATE_ADDED),
              customItem('Artist', SongSortType.ARTIST),
              customItem('Album ', SongSortType.ALBUM),
              customItem('Size', SongSortType.SIZE),
              customItem('Duration', SongSortType.DURATION),
            ]);
  }
}

PopupMenuEntry<SongSortType> customItem(String text, SongSortType type) {
  return PopupMenuItem<SongSortType>(
      value: type,
      onTap: () {},
      child: CustomText(
        string: text,
        color: Colors.white,
        fontweight: FontWeight.bold,
        texttype: TextType.subtitleMedium,
        fonttype: FontType.aboretofont,
      ));
}
