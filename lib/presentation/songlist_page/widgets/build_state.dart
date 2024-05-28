import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:uni_player_2/Refactory/widgets.dart';
import 'package:uni_player_2/app_Global_const/const.dart';

import 'package:uni_player_2/application/SongsAndPlayBloc/song_and_play_bloc.dart';

import 'package:uni_player_2/presentation/songlist_page/widgets/songlist_widgets.dart';

class BuildSongList extends StatelessWidget {
  const BuildSongList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SongAndPlayBloc, SongAndPlayState>(
      builder: (context, state) {
        if (state.isLoading == true) {
          return const Center(
            child: CircularProgressIndicator(
              color: ConstColor.whitecolor,
              strokeWidth: 5,
            ),
          );
        } else if (state.isFailure == true) {
          return const Center(
            child: CustomText(
              string: 'SomeThing Went Wrong',
              color: Colors.white,
              fontweight: FontWeight.bold,
            ),
          );
        } else if (state.sortingList.isEmpty) {
          return const Center(
            child: CustomText(
              string: 'Nothing Found',
              color: Colors.white,
              fontweight: FontWeight.bold,
            ),
          );
        } else {
          return SongLIstWidget(
            songlist: state.sortingList,
          );
        }
      },
    );
  }
}
