import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:uni_player_2/Refactory/funtions.dart';
import 'package:uni_player_2/Refactory/widgets.dart';

import 'package:uni_player_2/app_Global_const/const.dart';
import 'package:uni_player_2/application/PlayListBloc/play_list_bloc_bloc.dart';

class ArtworkBox extends StatelessWidget {
  final Widget child;
  const ArtworkBox({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    //ROOT CONTAINER;
    return SizedBox(
      child: Column(
        children: [
          //ARTWORK CONTAINER;

          CustomContainer(
            width: screnRatio(context: context).width,
            height: screnRatio(context: context).width / 1.3,
            radius: 20,
            borderEnable: true,
            borderwidth: 0,
            child: Container(
                width: screnRatio(context: context).width,
                height: screnRatio(context: context).width / 1.3,
                padding: const EdgeInsets.all(2),
                child: child),
          ),

          ConstSize.height25,

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              iconWidget(
                  icon: Icons.photo_library_rounded, color: Colors.white),
              const FavoriteButton()
            ],
          )
        ],
      ),
    );
  }
}

class FavoriteButton extends StatelessWidget {
  const FavoriteButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlayListBlocBloc, PlayListBlocState>(
      builder: (context, state) {
        if (state.currentSonglist.isEmpty) {
          return iconWidget(icon: Icons.favorite);
        }
        final currentsong = state.currentSonglist[state.currentIndex];

        for (var id in state.favoriteList) {
          if (currentsong.artworkid == id.artworkid) {
            return iconWidget(icon: Icons.favorite, color: Colors.red);
          }
          break;
        }
        return InkWell(
            onTap: () => context
                .read<PlayListBlocBloc>()
                .add(AddFavoriteEvent(favsong: currentsong)),
            child:
                iconWidget(icon: Icons.favorite_outline, color: Colors.white));
      },
    );
  }
}
