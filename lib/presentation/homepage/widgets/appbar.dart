import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:uni_player_2/Refactory/widgets.dart';
import 'package:uni_player_2/application/SongListbloc/song_list_bloc.dart';

class AppbarCustom extends StatelessWidget {
  final double? paddingbottom;
  const AppbarCustom({Key? key, this.paddingbottom}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: paddingbottom ?? 0),
      child: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        centerTitle: true,
        leading: iconWidget(
            icon: Icons.menu_rounded,
            ontap: () {
              context.read<SongListBloc>().add(GetSonglist(context: context));
              Scaffold.of(context).openDrawer();
            }),
        title: Text('playing',
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontWeight: FontWeight.bold,
                fontFamily: GoogleFonts.aboreto().fontFamily)),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: iconWidget(
              icon: Icons.menu_rounded,
            ),
          )
        ],
      ),
    );
  }
}
