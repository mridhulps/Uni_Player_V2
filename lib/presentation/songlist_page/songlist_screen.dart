import 'dart:async';
import 'dart:developer';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:permission_handler/permission_handler.dart';

import 'package:uni_player_2/Refactory/funtions.dart';

import 'package:uni_player_2/Refactory/widgets.dart';
import 'package:uni_player_2/app_Global_const/const.dart';
import 'package:uni_player_2/application/HomePagebloc/homepage_bloc.dart';

import 'package:uni_player_2/presentation/songlist_page/widgets/build_state.dart';

class MusicListScreen extends StatelessWidget {
  const MusicListScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      context.read<HomepageBloc>().add(GetSonglistEvnet());

      Timer(const Duration(milliseconds: 100), () {});
    });
    return imageContainer(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        //DRAWER;
        body: Drawer(
            width: screnRatio(context: context).width,
            backgroundColor: Colors.transparent,
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
              child: SizedBox(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    AppBar(
                      automaticallyImplyLeading: false,
                      backgroundColor: Colors.transparent,
                      title: const CustomText(
                        string: 'Songs',
                        texttype: TextType.titleLarge,
                        fonttype: FontType.aboretofont,
                        color: Colors.white,
                        fontsize: 23,
                        fontweight: FontWeight.bold,
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
                    //SONG LIST build CONTAINER;

                    const BuildSongList(),
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
