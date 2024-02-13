import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:uni_player_2/Refactory/funtions.dart';

import 'package:uni_player_2/Refactory/widgets.dart';
import 'package:uni_player_2/app_Global_const/const.dart';
import 'package:uni_player_2/application/SongListbloc/song_list_bloc.dart';
import 'package:uni_player_2/core/permission_acess.dart';

import 'package:uni_player_2/presentation/songlist_page/widgets/permission_container.dart';

class MusicListScreen extends StatelessWidget {
  const MusicListScreen({super.key});

  final String imageurl = 'https://wallpapercave.com/wp/wp5121792.jpg';

  @override
  Widget build(BuildContext context) {
    return imageContainer(
      image: imageurl,
      child: Scaffold(
        backgroundColor: Colors.transparent.withOpacity(0.2),
        //DRAWER;
        body: Drawer(
            width: screnRatio(context: context).width,
            backgroundColor: Colors.transparent,
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
              child: SizedBox(
                child: Column(
                  children: [
                    AppBar(
                      backgroundColor: Colors.transparent,
                      title: Text(
                        'Songs',
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            color: ConstColor.whitecolor,
                            fontFamily: GoogleFonts.aboreto().fontFamily,
                            fontWeight: FontWeight.bold),
                      ),
                      actions: [
                        iconWidget(icon: Icons.sort_rounded, paddingright: 15)
                      ],
                    ),

                    //TEXTFIELD CONTAINER;
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Container(
                        padding: const EdgeInsets.only(top: 4, bottom: 4),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: ConstColor.whitecolor,
                        ),
                        child: TextFormField(
                          decoration: InputDecoration(
                              hintText: 'Search Songs',
                              prefixIcon: iconWidget(
                                  icon: Icons.search, color: Colors.black54),
                              border: InputBorder.none,
                              contentPadding: const EdgeInsets.only(top: 10)),
                        ),
                      ),
                    ),
                    //SONG LIST CONTAINER;
                    BlocBuilder<SongListBloc, SongListState>(
                      builder: (context, state) {
                        if (state.isLoading == true) {
                          return const Center(
                            child: CircularProgressIndicator(
                              color: ConstColor.whitecolor,
                              strokeWidth: 5,
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
                        } else if (state.permissionstat ==
                            PermissionType.initial) {
                          return const Expanded(child: Permissioncontainer());
                        }
                        return

                            //PERMISSION GRANDED;
                            Expanded(
                          child: ListView.separated(
                              physics: const BouncingScrollPhysics(),
                              itemBuilder: (context, index) {
                                final song = state.songList[index];

                                return ListTile(
                                  leading: iconWidget(icon: Icons.music_note),
                                  title: CustomText(
                                      string: song.displayNameWOExt,
                                      fontweight: FontWeight.bold,
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
                              itemCount: state.songList.length),
                        );
                        //SHOW ALLOW PERMISSION BUTTON;
                      },
                    ),
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
