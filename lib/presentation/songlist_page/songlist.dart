import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uni_player_2/Refactory/funtions.dart';

import 'package:uni_player_2/Refactory/widgets.dart';
import 'package:uni_player_2/app_Global_const/const.dart';
import 'package:uni_player_2/application/SongListbloc/song_list_bloc.dart';

class MusicListScreen extends StatelessWidget {
  const MusicListScreen({super.key});

  final String imageurl = 'https://wallpapercave.com/wp/wp5121792.jpg';

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<SongListBloc>().add(GetsonglistEvent());
    });

    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(imageurl),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(30)),
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
                    Expanded(
                      child: BlocBuilder<SongListBloc, SongListState>(
                        builder: (context, state) {
                          return ListView.separated(
                              physics: const BouncingScrollPhysics(),
                              itemBuilder: (context, index) {
                                final song = state.songList[index];

                                if (state.isLoading == true) {
                                  return const Center(
                                    child: CircularProgressIndicator(
                                      color: ConstColor.whitecolor,
                                      strokeWidth: 5,
                                    ),
                                  );
                                } else if (state.isFailure) {
                                  return Center(
                                    child: textwidget(
                                        string: 'SomeThing Went Wrong'),
                                  );
                                } else if (state.songList.isEmpty) {
                                  return Center(
                                    child: textwidget(string: 'Nothing Found'),
                                  );
                                }

                                return ListTile(
                                  leading: iconWidget(icon: Icons.music_note),
                                  title: textwidget(
                                      string: song.displayNameWOExt,
                                      fonttype: FontType.roboto,
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
                              itemCount: state.songList.length);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
