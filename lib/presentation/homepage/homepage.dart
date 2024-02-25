import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:uni_player_2/Refactory/funtions.dart';
import 'package:uni_player_2/Refactory/widgets.dart';
import 'package:uni_player_2/application/HomePagebloc/homepage_bloc.dart';

import 'package:uni_player_2/presentation/homepage/widgets/appbar.dart';
import 'package:uni_player_2/presentation/homepage/widgets/artwork_image.dart';
import 'package:uni_player_2/presentation/homepage/widgets/controll_system.dart';
import 'package:uni_player_2/presentation/homepage/widgets/duration_bar.dart';
import 'package:uni_player_2/presentation/songlist_page/songlist_screen.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return artWorkContainer(
      isStreamNullWidget: StreamNullWidget.plain,
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
              filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
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
                                BlocBuilder<HomepageBloc, HomepageState>(
                                  buildWhen: (previous, current) {
                                    final ischanged =
                                        previous.artworkId != current.artworkId;

                                    return ischanged;
                                  },
                                  builder: (context, state) {
                                    return ArtWorkWidget(
                                      artworkId: state.artworkId,
                                    );
                                  },
                                ),

                                BlocBuilder<HomepageBloc, HomepageState>(
                                  builder: (context, state) {
                                    return CustomContainer(
                                      color: Colors.transparent,
                                      child: CustomText(
                                        paddingleft: 10,
                                        string: state.currentsongtitle ?? '',
                                        color: Colors.white,
                                        fonttype: FontType.aboretofont,
                                        texttype: TextType.titleMedium,
                                        fontweight: FontWeight.bold,
                                      ),
                                    );
                                  },
                                ),

                                //DURATION CONTAINER;
                                const DurationBar()
                              ],
                            ))),

                    // SECOND CONTAINER FLEX;

                    Expanded(child: SizedBox(child: ControllSystem())),
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
