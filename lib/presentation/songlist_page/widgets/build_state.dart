import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:uni_player_2/Refactory/widgets.dart';
import 'package:uni_player_2/app_Global_const/const.dart';

import 'package:uni_player_2/presentation/songlist_page/widgets/songlist_widgets.dart';

import '../../../application/HomePagebloc/homepage_bloc.dart';

class BuildSongList extends StatelessWidget {
  const BuildSongList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomepageBloc, HomepageState>(
      buildWhen: (previous, current) {
        return previous.alreadyLoaded == false ||
            current.alreadyLoaded == false;
      },
      builder: (context, state) {
        if (state.isLoading == true) {
          return const Expanded(
            child: Center(
              child: CircularProgressIndicator(
                color: ConstColor.whitecolor,
                strokeWidth: 5,
              ),
            ),
          );
        } else if (state.isFailure) {
          return const Expanded(
            child: Center(
              child: CustomText(
                string: 'SomeThing Went Wrong',
                color: Colors.white,
                fontweight: FontWeight.bold,
              ),
            ),
          );
        } else if (state.songList.isEmpty) {
          return const Expanded(
            child: Center(
              child: CustomText(
                string: 'Nothing Found',
                color: Colors.white,
                fontweight: FontWeight.bold,
              ),
            ),
          );
        } else {
          return Expanded(
              child: SongLIstWidget(
            songlist: state.songList,
          ));
        }
      },
    );
  }
}
