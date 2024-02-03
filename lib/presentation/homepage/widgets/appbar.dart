import 'package:flutter/material.dart';
import 'package:uni_player_2/Refactory/widgets.dart';
import 'package:uni_player_2/app_Global_const/const.dart';

class AppbarCustom extends StatelessWidget {
  const AppbarCustom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: ConstColor.backgroundcolor,
      automaticallyImplyLeading: false,
      centerTitle: true,
      leading: const Icon(Icons.menu_rounded),
      title: textwidget(string: 'Songs'),
      actions: const [
        Padding(
          padding: EdgeInsets.only(right: 15),
          child: Icon(Icons.menu_rounded),
        )
      ],
    );
  }
}
