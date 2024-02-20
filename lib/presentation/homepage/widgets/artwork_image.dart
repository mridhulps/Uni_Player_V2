import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:uni_player_2/Refactory/funtions.dart';
import 'package:uni_player_2/Refactory/widgets.dart';

import 'package:uni_player_2/app_Global_const/const.dart';

class ArtWorkWidget extends StatelessWidget {
  final int artworkId;

  const ArtWorkWidget({super.key, required this.artworkId});

  final String imageurl = 'https://wallpapercave.com/wp/wp5121792.jpg';

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
              child: QueryArtworkWidget(
                id: artworkId,
                type: ArtworkType.AUDIO,
                artworkQuality: FilterQuality.high,
                artworkFit: BoxFit.fill,
                quality: 100,
                artworkBorder: BorderRadius.circular(20),
                nullArtworkWidget: CircleAvatar(
                  backgroundColor: Colors.transparent,
                  child: iconWidget(
                      icon: Icons.music_note_rounded,
                      color: ConstColor.backgroundcolor,
                      size: 100),
                ),
                errorBuilder: (p0, p1, p2) {
                  log('artworkErrorbuilder called, object(${p1.toString()}),stacktrace(${p2.toString()})');
                  return CircleAvatar(
                    backgroundColor: Colors.transparent,
                    child: iconWidget(
                        icon: Icons.music_note_rounded,
                        color: ConstColor.backgroundcolor,
                        size: 100),
                  );
                },
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
