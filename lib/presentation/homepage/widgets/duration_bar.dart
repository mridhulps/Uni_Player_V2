import 'package:flutter/material.dart';
import 'package:uni_player_2/Refactory/widgets.dart';
import 'package:uni_player_2/app_Global_const/const.dart';

class DurationBar extends StatelessWidget {
  const DurationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      radius: 15,
      child: Column(
        children: [
          //DURATION TIME;
          const Padding(
            padding: EdgeInsets.only(
              top: 10,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                    string: '0.00',
                    paddingleft: 20,
                    fontweight: FontWeight.bold),
                CustomText(
                    string: '2.24',
                    paddingright: 20,
                    fontweight: FontWeight.bold)
              ],
            ),
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
            padding: const EdgeInsets.only(bottom: 10, top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                materialButton(
                  child: CustomContainer(
                    radius: 10,
                    width: 40,
                    child: iconWidget(
                      icon: Icons.shuffle_rounded,
                      color: ConstColor.buttoncolor,
                      size: 25,
                    ),
                  ),
                ),
                materialButton(
                  child: CustomContainer(
                    radius: 10,
                    width: 40,
                    child: iconWidget(
                      icon: Icons.library_add_outlined,
                      color: ConstColor.buttoncolor,
                      size: 25,
                    ),
                  ),
                ),
                materialButton(
                  child: CustomContainer(
                    radius: 4,
                    width: 40,
                    child: iconWidget(
                      icon: Icons.volume_down_rounded,
                      color: ConstColor.buttoncolor,
                      size: 25,
                    ),
                  ),
                ),
                materialButton(
                  child: CustomContainer(
                    radius: 4,
                    width: 40,
                    child: iconWidget(
                      icon: Icons.menu_rounded,
                      color: ConstColor.buttoncolor,
                      size: 25,
                    ),
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
