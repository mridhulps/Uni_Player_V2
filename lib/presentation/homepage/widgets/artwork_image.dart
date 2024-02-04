import 'package:flutter/material.dart';
import 'package:uni_player_2/Refactory/funtions.dart';
import 'package:uni_player_2/Refactory/widgets.dart';

import 'package:uni_player_2/app_Global_const/const.dart';

class ArtWorkWidget extends StatelessWidget {
  const ArtWorkWidget({super.key});

  final String imageurl = 'https://wallpapercave.com/wp/wp5121792.jpg';

  @override
  Widget build(BuildContext context) {
    //ROOT CONTAINER;
    return Column(
      children: [
        //ARTWORK CONTAINER;

        MorphismContainer(
          disablebutton: false,
          width: screnRatio(context: context).width,
          height: screnRatio(context: context).width / 1.3,
          radius: 20,
          blurradius: 0,
          offset1: const Offset(-4, -4),
          offset2: const Offset(5, 5),
          ontap: () => null,
          child: Container(
            margin: const EdgeInsets.all(2),
            decoration: BoxDecoration(
                //  color: Colors.amber,
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                    fit: BoxFit.fill, image: NetworkImage(imageurl))),
            width: screnRatio(context: context).width,
            height: 300,
          ),
        ),

        ConstSize.height25,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            iconWidget(
              icon: Icons.photo_library_rounded,
            ),
            iconWidget(
              icon: Icons.favorite_outline,
            )
          ],
        )
      ],
    );
  }
}
