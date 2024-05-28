import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:uni_player_2/Refactory/widgets.dart';
import 'package:uni_player_2/app_Global_const/const.dart';
import 'package:uni_player_2/application/PlayListBloc/play_list_bloc_bloc.dart';

import 'package:uni_player_2/presentation/playList_page/Widgets/addplaylist_bottomsheet.dart';
import 'package:uni_player_2/presentation/playList_page/Widgets/playlist_Tile.dart';

class PlayListScreen extends StatelessWidget {
  const PlayListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ConstColor.backgroundcolor,
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
          title: const CustomText(
            string: 'PlayList',
            fonttype: FontType.aboretofont,
            fontweight: FontWeight.bold,
          ),
          actions: [
            InkWell(
              onTap: () {
                context.read<PlayListBlocBloc>().add(DeleteAllEvent());
              },
              child: iconWidget(
                icon: Icons.delete_forever_rounded,
              ),
            )
          ],
        ),
        body: const SafeArea(
            child: PlayListTile(
          ontapmode: OnTapMode.gotosongList,
        )),
        floatingActionButton: FloatingActionButton.extended(
            backgroundColor: Colors.white,
            onPressed: () {
              addPlayListBottomSheet(context);
            },
            label: iconWidget(
                icon: Icons.my_library_add_rounded, color: Colors.black)));
  }
}
