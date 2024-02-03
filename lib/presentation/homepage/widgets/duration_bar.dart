import 'package:flutter/material.dart';
import 'package:uni_player_2/Refactory/widgets.dart';

class DurationBar extends StatelessWidget {
  const DurationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return MorphismContainer(
      ontap: () => null,
      disablebutton: true,
      offset1: const Offset(-2, -2),
      offset2: const Offset(2, 2),
      blurradius: 5,
      radius: 15,
      child: Slider(
          value: 5,
          min: 0.0,
          max: 20,
          inactiveColor: Colors.transparent,
          activeColor: Colors.grey,
          thumbColor: Colors.grey,
          overlayColor: const MaterialStatePropertyAll(Colors.amber),
          onChanged: (value) {}),
    );
  }
}
