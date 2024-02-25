import 'package:flutter/material.dart';

import 'package:uni_player_2/Refactory/funtions.dart';
import 'package:uni_player_2/Refactory/widgets.dart';

import 'package:uni_player_2/app_Global_const/const.dart';

class ArtWorkWidget extends StatelessWidget {
  final int artworkId;

  const ArtWorkWidget({super.key, required this.artworkId});

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
              child: artWorkContainer(
                isnullwidgetMusicnote: true,
              ),
            ),
          ),

          ConstSize.height25,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              iconWidget(
                  icon: Icons.photo_library_rounded, color: Colors.white),
              iconWidget(icon: Icons.favorite_outline, color: Colors.white)
            ],
          )
        ],
      ),
    );
  }
}
