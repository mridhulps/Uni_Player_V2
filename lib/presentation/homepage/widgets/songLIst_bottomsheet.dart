// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:uni_player_2/Refactory/widgets.dart';
import 'package:uni_player_2/app_Global_const/const.dart';

import 'package:uni_player_2/application/SongsAndPlayBloc/song_and_play_bloc.dart';

import 'package:uni_player_2/presentation/songlist_page/widgets/songlist_widgets.dart';

songListBottomSheet(BuildContext context) {
  return showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (ctx) {
        return DraggableScrollableSheet(
            initialChildSize: 0.5,
            maxChildSize: 0.95,
            builder: (context, controller) {
              return Container(
                color: ConstColor.backgroundcolor,
                child: Column(
                  children: [
                    PreferredSize(
                      preferredSize: const Size.fromHeight(20),
                      child: AppBar(
                        automaticallyImplyLeading: false,
                        backgroundColor: Colors.transparent,
                        title: const CustomText(
                          string: 'Current Songs',
                        ),
                      ),
                    ),
                    BlocBuilder<SongAndPlayBloc, SongAndPlayState>(
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
                        } else if (state.isFailure == true) {
                          return const Expanded(
                            child: Center(
                              child: CustomText(
                                string: 'SomeThing Went Wrong',
                                color: Colors.white,
                                fontweight: FontWeight.bold,
                              ),
                            ),
                          );
                        } else if (state.currentSongList.isEmpty) {
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
                            songlist: state.currentSongList,
                            controller: controller,
                          ));
                        }
                      },
                    ),
                  ],
                ),
              );
            });
      });
}
