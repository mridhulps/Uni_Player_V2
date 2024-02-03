import 'package:flutter/material.dart';
import 'package:uni_player_2/Refactory/funtions.dart';
import 'package:uni_player_2/Refactory/widgets.dart';

import 'package:uni_player_2/presentation/homepage/widgets/appbar.dart';
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
              Expanded(
                  flex: 5,
                  child: Container(
                      // color: Colors.lightBlue,
                      padding:
                          const EdgeInsets.only(left: 10, right: 10, top: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // ARTWORK CONTAINER ;
                          MorphismContainer(
                            disablebutton: true,
                            width: screnRatio(context: context).width,
                            height: screnRatio(context: context).width,
                            radius: 20,
                            blurradius: 5,
                            offset1: const Offset(-4, -4),
                            offset2: const Offset(4, 4),
                            ontap: () => null,
                            child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(),
                                  const Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(),
                                      Icon(
                                        Icons.favorite,
                                        color: Colors.red,
                                      )
                                    ],
                                  )
                                ]),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          const DurationBar()
                        ],
                      ))),

              // SONG INFO CONTAINER;

              const Expanded(
                  child: SizedBox(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [ControllSystem()]),
              )),
            ],
          ),
        ),
      ),
    );
  }
}
