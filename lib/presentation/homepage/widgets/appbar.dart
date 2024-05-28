import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:google_fonts/google_fonts.dart';

import 'package:uni_player_2/Refactory/widgets.dart';

import 'package:uni_player_2/application/SongsAndPlayBloc/song_and_play_bloc.dart';
import 'package:uni_player_2/presentation/homepage/widgets/option_dropdown.dart';

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
        //ICONBUTTON,
        leading: BlocBuilder<SongAndPlayBloc, SongAndPlayState>(
          builder: (context, state) {
            return InkWell(
              onTap: () {
                Scaffold.of(context).openDrawer();
                context.read<SongAndPlayBloc>().add(GetSonglist());
              },
              child: iconWidget(
                icon: Icons.menu_rounded,
              ),
            );
          },
        ),
        title: Text('playing',
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontWeight: FontWeight.bold,
                fontFamily: GoogleFonts.aboreto().fontFamily)),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 0),
            child: OptionDropdownButton(),
          )
        ],
      ),
    );
  }
}
