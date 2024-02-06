import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uni_player_2/Refactory/widgets.dart';
import 'package:uni_player_2/app_Global_const/const.dart';

class AppbarCustom extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffkey;

  const AppbarCustom({Key? key, required this.scaffkey}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: ConstColor.backgroundcolor,
      automaticallyImplyLeading: false,
      centerTitle: true,
      leading: iconWidget(
        icon: Icons.menu_rounded,
        ontap: () => scaffkey.currentState?.openDrawer(),
      ),
      title: Text(
        'playing',
        style: Theme.of(context).textTheme.titleLarge!.copyWith(
            fontFamily: GoogleFonts.aboreto().fontFamily,
            fontWeight: FontWeight.bold),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 15),
          child: iconWidget(icon: Icons.menu_rounded),
        )
      ],
    );
  }
}
