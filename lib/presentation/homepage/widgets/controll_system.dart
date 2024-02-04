//MUSIC CONTROLL PLAY/PAUSE MORE CONTAINER;

import 'package:flutter/material.dart';
import 'package:uni_player_2/Refactory/widgets.dart';
import 'package:uni_player_2/app_Global_const/const.dart';

class ControllSystem extends StatelessWidget {
  const ControllSystem({super.key});
  final color = const Color.fromRGBO(112, 112, 112, 1);

  final offset = const Offset(3, 3);
  final blurstyle = BlurStyle.solid;

  @override
  Widget build(BuildContext context) {
    return MorphismContainer(
      ontap: () {},
      radius: 20,
      blurradius: 1,
      offset1: const Offset(-2, -2),
      offset2: const Offset(5, 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          MorphismContainer(
            width: 50,
            height: 50,
            radius: 10,
            offset1: const Offset(-2, -2),
            offset2: const Offset(2.5, 2.5),
            returnswitch: true,
            child: const Icon(
              Icons.skip_previous_rounded,
              color: ConstColor.buttoncolor,
              size: 40,
            ),
            ontap: () {
              null;
            },
          ),
          MorphismContainer(
            width: 65,
            height: 65,
            radius: 10,
            offset1: const Offset(-1, -1),
            offset2: const Offset(3, 3),
            child: const Icon(
              Icons.play_arrow_rounded,
              color: ConstColor.buttoncolor,
              size: 40,
            ),
            ontap: () {},
          ),
          MorphismContainer(
            width: 50,
            height: 50,
            radius: 10,
            offset1: const Offset(-3, -3),
            offset2: const Offset(3, 3),
            returnswitch: true,
            child: const Icon(
              Icons.skip_next_rounded,
              color: ConstColor.buttoncolor,
              size: 40,
            ),
            ontap: () {},
          ),
        ],
      ),
    );
  }
}
