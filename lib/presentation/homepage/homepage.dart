import 'package:flutter/material.dart';
import 'package:uni_player_2/Refactory/funtions.dart';

import 'package:uni_player_2/presentation/homepage/widgets/appbar.dart';
import 'package:uni_player_2/presentation/homepage/widgets/artwork_image.dart';
import 'package:uni_player_2/presentation/homepage/widgets/controll_system.dart';
import 'package:uni_player_2/presentation/homepage/widgets/duration_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // APPBAR CONTAINER;

      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(50), child: AppbarCustom()),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
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
                      padding: const EdgeInsets.only(left: 5, right: 5, top: 5),
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly  ,
                        children: [
                          // ARTWORK CONTAINER ;
                          ArtWorkWidget(),
                          //SPACER;
                          SizedBox(
                            height: 20,
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
    );
  }
}
