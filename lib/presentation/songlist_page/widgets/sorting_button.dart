import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:on_audio_query/on_audio_query.dart';

import 'package:uni_player_2/Refactory/widgets.dart';

import 'package:uni_player_2/application/SongListbloc/song_list_bloc.dart';
import 'package:uni_player_2/global/Entity/sort_model.dart';

class SortingButton extends StatelessWidget {
  SortingButton({
    super.key,
  });

  final List<SortItem> itemList = [
    SortItem(sortName: 'Date', sorttype: SongSortType.DATE_ADDED),
    SortItem(sortName: 'Artist', sorttype: SongSortType.ARTIST),
    SortItem(sortName: 'Album', sorttype: SongSortType.ALBUM),
    SortItem(sortName: 'Size', sorttype: SongSortType.SIZE),
    SortItem(sortName: 'Duration', sorttype: SongSortType.DURATION),
  ];

  @override
  Widget build(BuildContext context) {
    return CustomDropDownButton(
      icon: iconWidget(icon: Icons.sort_rounded, paddingright: 15),
      customitem: itemList
          .map((e) => customItem(
              text: e.sortName,
              onpress: () => context
                  .read<SongListBloc>()
                  .add(SortingEvent(sort: e.sorttype, context: context))))
          .toList(),
    );
  }
}

PopupMenuEntry<dynamic> customItem({
  required text,
  final Function? onpress,
}) {
  return PopupMenuItem<dynamic>(
      onTap: () {
        if (onpress != null) {
          onpress();
        }
      },
      child: CustomText(
        string: text,
        color: Colors.white,
        fontweight: FontWeight.bold,
        texttype: TextType.subtitleMedium,
        fonttype: FontType.aboretofont,
      ));
}
