import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:uni_player_2/Refactory/widgets.dart';
import 'package:uni_player_2/application/HomePagebloc/homepage_bloc.dart';
import 'package:uni_player_2/global/Locator/locator.dart';

class TestingScreen extends StatelessWidget {
  TestingScreen({super.key});

  final String imageurl = 'https://wallpapercave.com/wp/wp5121792.jpg';

  final artworkid = locator.get<HomepageState>().artworkId;

  @override
  Widget build(BuildContext context) {
    log(artworkid.toString());
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Stack(children: [
        //   imageContainer2(
        //       child: const CustomText(string: 'test'),
        //       imagetype: ImageType.artworkId,
        //       artworkId: artworkid),
         ]),
      ),
    );
  }
}
