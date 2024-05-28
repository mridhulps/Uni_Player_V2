import 'package:flutter/material.dart';
import 'package:uni_player_2/presentation/playList_page/Widgets/playlist_Tile.dart';

playListBottomSheet(BuildContext context) => showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (ctx) {
      return DraggableScrollableSheet(
          initialChildSize: 0.5,
          maxChildSize: 0.95,
          builder: (context, controller) {
            return PlayListTile(
              controller: controller,
              ontapmode: OnTapMode.addsong,
            );
          });
    });
