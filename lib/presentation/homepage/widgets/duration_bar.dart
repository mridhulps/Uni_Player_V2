import 'package:flutter/material.dart';
import 'package:uni_player_2/Refactory/widgets.dart';
import 'package:uni_player_2/app_Global_const/const.dart';

class DurationBar extends StatelessWidget {
  const DurationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return MorphismContainer(
      ontap: () => null,
      disablebutton: false,
      offset1: const Offset(-2, -2),
      offset2: const Offset(5, 5),
      blurradius: 1,
      radius: 15,
      child: Column(
        children: [
          //DURATION TIME;
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              textwidget(
                  string: '0.00', paddingleft: 20, fontweight: FontWeight.bold),
              textwidget(
                  string: '2.24', paddingright: 20, fontweight: FontWeight.bold)
            ],
          ),
          //DURATION BAR;
          Slider(
              value: 5,
              min: 0.0,
              max: 10,
              inactiveColor: Colors.transparent,
              activeColor: ConstColor.buttoncolor,
              thumbColor: ConstColor.buttoncolor,
              overlayColor: const MaterialStatePropertyAll(Colors.amber),
              onChanged: (value) {}),

          Padding(
            padding: const EdgeInsets.only(bottom: 10, top: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                MorphismContainer(
                  radius: 4,
                  width: 40,
                  height: 40,
                  disablebutton: false,
                  ontap: () {},
                  child: iconWidget(
                    icon: Icons.shuffle_rounded,
                    size: 25,
                  ),
                ),
                MorphismContainer(
                  radius: 4,
                  width: 40,
                  height: 40,
                  disablebutton: false,
                  ontap: () {},
                  child: iconWidget(
                    icon: Icons.library_add_outlined,
                    size: 25,
                  ),
                ),
                MorphismContainer(
                  radius: 4,
                  width: 40,
                  height: 40,
                  disablebutton: false,
                  ontap: () {},
                  child: iconWidget(
                    icon: Icons.volume_down_rounded,
                    size: 25,
                  ),
                ),
                MorphismContainer(
                  radius: 4,
                  width: 40,
                  height: 40,
                  disablebutton: false,
                  ontap: () {},
                  child: iconWidget(
                    icon: Icons.menu_rounded,
                    size: 25,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
