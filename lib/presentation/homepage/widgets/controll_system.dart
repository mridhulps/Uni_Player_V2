//MUSIC CONTROLL PLAY/PAUSE MORE CONTAINER;

import 'package:flutter/material.dart';
import 'package:uni_player_2/Refactory/widgets.dart';
import 'package:uni_player_2/app_Global_const/const.dart';

class ControllSystem extends StatelessWidget {
  const ControllSystem({super.key});
  final color = Colors.white;

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
          Material(
            elevation: 3,
            borderOnForeground: false,
            type: MaterialType.circle,
            color: Colors.white,
            child: iconWidget(
              icon: Icons.play_arrow_rounded,
              color: ConstColor.buttoncolor,
              size: 60,
            ),
          ),
          materialButton(
            child: iconWidget(
              icon: Icons.skip_next_rounded,
              color: ConstColor.buttoncolor,
              size: 40,
            ),
          ),
        ],
      ),
    );
  }
}
