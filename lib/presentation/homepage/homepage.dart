import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uni_player_2/Refactory/funtions.dart';
import 'package:uni_player_2/Refactory/widgets.dart';
import 'package:uni_player_2/app_Global_const/const.dart';

import 'package:uni_player_2/presentation/homepage/widgets/appbar.dart';
import 'package:uni_player_2/presentation/homepage/widgets/artwork_image.dart';
import 'package:uni_player_2/presentation/homepage/widgets/controll_system.dart';
import 'package:uni_player_2/presentation/homepage/widgets/duration_bar.dart';
import 'package:uni_player_2/presentation/songlist_page/songlist.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  final String imageurl = 'https://wallpapercave.com/wp/wp5121792.jpg';

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
        image: NetworkImage(imageurl),
        fit: BoxFit.cover,
      )),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        resizeToAvoidBottomInset: false,
        // APPBAR CONTAINER;
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: AppbarCustom(
            paddingbottom: 15,
          ),
        ),

        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: SizedBox(
                width: screnRatio(context: context).width,
                height: screnRatio(context: context).height,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    //FIRST CONTAINER FLEX;
                    Expanded(
                        flex: 6,
                        child: Container(
                            // color: Colors.lightBlue,
                            padding: const EdgeInsets.only(
                                left: 5, right: 5, top: 5, bottom: 20),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                // ARTWORK CONTAINER ;
                                const ArtWorkWidget(),
                                //SPACER;

                                CustomContainer(
                                  color: Colors.transparent,
                                  child: Text(
                                    'Eradaze -Not like That',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(
                                            color: ConstColor.whitecolor,
                                            fontFamily: GoogleFonts.aboreto()
                                                .fontFamily,
                                            fontWeight: FontWeight.bold),
                                  ),
                                ),

                                //DURATION CONTAINER;
                                const DurationBar()
                              ],
                            ))),

                    // SECOND CONTAINER FLEX;

                    const Expanded(child: SizedBox(child: ControllSystem())),
                  ],
                ),
              ),
            ),
          ),
        ),
        drawer: MusicListScreen(),
      ),
    );
  }
}
