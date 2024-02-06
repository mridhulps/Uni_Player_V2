import 'package:flutter/material.dart';
import 'package:uni_player_2/Refactory/funtions.dart';
import 'package:uni_player_2/Refactory/widgets.dart';

import 'package:uni_player_2/app_Global_const/const.dart';

class ArtWorkWidget extends StatelessWidget {
  const ArtWorkWidget({super.key});

  final String imageurl = 'https://wallpapercave.com/wp/wp5121792.jpg';
  final String error = '';

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
            // radius: 20,
            borderEnable: true,
            borderwidth: 2,
            child: Container(
              margin: const EdgeInsets.all(0),
              width: screnRatio(context: context).width,
              height: 300,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image(
                  image: NetworkImage(imageurl),
                  fit: BoxFit.fill,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      child: iconWidget(
                          icon: Icons.music_note_rounded,
                          color: ConstColor.backgroundcolorblack,
                          size: screnRatio(context: context).width / 3.1),
                    );
                  },
                ),
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
