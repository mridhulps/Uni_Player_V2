// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:uni_player_2/Refactory/funtions.dart';
import 'package:uni_player_2/Refactory/widgets.dart';
import 'package:uni_player_2/app_Global_const/const.dart';

import 'package:uni_player_2/application/PlayListBloc/play_list_bloc_bloc.dart';
import 'package:uni_player_2/presentation/Favorite_page/favorite_page.dart';

import 'package:uni_player_2/presentation/playlistSongListShowpage/playlistshowsonglist.dart';

class PlayListTile extends StatelessWidget {
  final ScrollController? controller;
  final OnTapMode? ontapmode;

  const PlayListTile({super.key, this.ontapmode, this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: ConstColor.backgroundcolor,
        width: screnRatio(context: context).width,
        height: screnRatio(context: context).height,
        child: BlocBuilder<PlayListBlocBloc, PlayListBlocState>(
            builder: (context, state) {
          return Column(
            children: [
              const CustomTextField(
                hintname: 'Search',
              ),
              //FAVORITE LIST;
              ListTile(
                leading: iconWidget(icon: Icons.favorite, color: Colors.red),
                title: const CustomText(
                  string: 'Favorites',
                ),
                trailing: iconWidget(icon: Icons.more_vert),
                onTap: () => customNavigator(context, const FavoritePage()),
              ),

              //CREATED PLAYLISTS;
              Expanded(
                child: ListView.separated(
                    controller: controller,
                    itemBuilder: (context, index) {
                      final playlist = state.playLists[index];

                      return ListTile(
                        leading:
                            iconWidget(icon: Icons.my_library_music_rounded),
                        title: CustomText(
                          string: playlist.playistName,
                          color: Colors.white,
                        ),
                        trailing: iconWidget(icon: Icons.more_vert),
                        onTap: () {
                          if (ontapmode == null) {
                          } else if (ontapmode == OnTapMode.addsong) {
                            context.read<PlayListBlocBloc>().add(
                                AddSongsToCreatePlayListEvent(
                                    selectplaylist: index));
                          } else {
                            customNavigator(
                                context,
                                PlayListSongList(
                                    songlist: state.playLists[index].songList,
                                    playlistname: playlist.playistName));
                          }
                        },
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox();
                    },
                    itemCount: state.playLists.length),
              ),
            ],
          );
        }));
  }
}

enum OnTapMode { addsong, gotosongList }
