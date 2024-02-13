import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:uni_player_2/Refactory/funtions.dart';
import 'package:uni_player_2/Refactory/widgets.dart';
import 'package:uni_player_2/global/domain/instances/instance.dart';

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
    final some = Instances();
    print(some.toString());

    return imageContainer(
      image: imageurl,
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
                            child: const Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                // ARTWORK CONTAINER ;
                                ArtWorkWidget(),
                                //SPACER;

                                CustomContainer(
                                  color: Colors.transparent,
                                  child: CustomText(
                                    string: 'Eradaze - Not Like That',
                                    color: Colors.white,
                                    fonttype: FontType.aboretofont,
                                    texttype: TextType.titleMedium,
                                    fontweight: FontWeight.bold,
                                  ),
                                ),

                                //DURATION CONTAINER;
                                DurationBar()
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
        drawer: const MusicListScreen(),
      ),
    );
  }
}
