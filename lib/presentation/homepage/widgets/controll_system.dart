//MUSIC CONTROLL PLAY/PAUSE MORE CONTAINER;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:uni_player_2/Refactory/widgets.dart';
import 'package:uni_player_2/app_Global_const/const.dart';
import 'package:uni_player_2/application/HomePagebloc/homepage_bloc.dart';
import 'package:uni_player_2/global/Locator/locator.dart';
import 'package:uni_player_2/global/domain/instances/instance.dart';

class ControllSystem extends StatelessWidget {
  ControllSystem({super.key});
  final color = Colors.white;

  final player = locator.get<Instances>().audioplayer;

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      radius: 20,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          materialButton(
            child: iconWidget(
              icon: Icons.skip_previous_rounded,
              color: ConstColor.buttoncolor,
              size: 40,
            ),
          ),
          InkWell(onTap: () {
            context
                .read<HomepageBloc>()
                .add(PlayAndPauseEvent(isplaying: false));
          }, child: BlocBuilder<HomepageBloc, HomepageState>(
            builder: (context, state) {

              
              return materialButton(
                child: iconWidget(
                  icon: Icons.play_arrow_rounded,
                  color: ConstColor.buttoncolor,
                  size: 65,
                ),
              );
            },
          )),
          InkWell(
            onTap: () {},
            child: materialButton(
              child: iconWidget(
                icon: Icons.skip_next_rounded,
                color: ConstColor.buttoncolor,
                size: 40,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
