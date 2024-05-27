import 'package:flutter/material.dart';

import 'package:uni_player_2/Refactory/widgets.dart';
import 'package:uni_player_2/app_Global_const/const.dart';

import 'package:uni_player_2/global/Entity/positionStream.dart';

import 'package:uni_player_2/global/domain/instances/instance.dart';
import 'package:uni_player_2/global/domain/streams/streams.dart';
import 'package:uni_player_2/presentation/homepage/widgets/playlist_bottomsheet.dart';

import 'package:uni_player_2/presentation/homepage/widgets/songLIst_bottomsheet.dart';

class DurationBar extends StatelessWidget {
  DurationBar({super.key});

  final player = Instances.audioplayer;

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      radius: 15,
      child: Column(
        children: [
          //DURATION TIME;
          Padding(
            padding: const EdgeInsets.only(
              top: 10,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                StreamBuilder<PositionDataStream>(
                    stream: positionDataStream(),
                    builder: (context, state) {
                      return CustomText(
                          string: state.data == null || state.hasError
                              ? '0.00'
                              : (state.data!.positionsstream
                                          .toString()
                                          .substring(0, 1) ==
                                      '0')
                                  ? state.data!.positionsstream
                                      .toString()
                                      .substring(2)
                                      .split('.')
                                      .first
                                  : state.data!.positionsstream
                                      .toString()
                                      .split('.')
                                      .first,
                          paddingleft: 20,
                          color: ConstColor.backgroundcolor,
                          fontweight: FontWeight.bold);
                    }),
                StreamBuilder<PositionDataStream?>(
                    stream: positionDataStream(),
                    builder: (context, state) {
                      return CustomText(
                        string: (state.data == null || state.hasError)
                            ? '0.00'
                            : (state.data!.durationstream
                                        .toString()
                                        .substring(0, 1) ==
                                    '0')
                                ? state.data!.durationstream
                                    .toString()
                                    .substring(2)
                                    .split('.')
                                    .first
                                : state.data!.durationstream
                                    .toString()
                                    .split('.')
                                    .first,
                        paddingright: 20,
                        fontweight: FontWeight.bold,
                        color: ConstColor.backgroundcolor,
                      );
                    }),
              ],
            ),
          ),
          //DURATION BAR;
          StreamBuilder<PositionDataStream>(
              stream: positionDataStream(),
              builder: (context, state) {
                final data = (state.data == null || state.hasError)
                    ? PositionDataStream(
                        positionsstream: Duration.zero,
                        durationstream: Duration.zero,
                      )
                    : state.data!;

                return Slider(
                    value: data.positionsstream.inSeconds.toDouble(),
                    min: 0.0,
                    max: data.durationstream.inSeconds.toDouble(),
                    inactiveColor: Colors.transparent,
                    activeColor: ConstColor.buttoncolor,
                    thumbColor: ConstColor.buttoncolor,
                    onChanged: (value) {
                      player.seek(Duration(seconds: value.toInt()));
                    });
              }),

          Padding(
            padding: const EdgeInsets.only(bottom: 10, top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                materialButton(
                  child: CustomContainer(
                    radius: 10,
                    width: 40,
                    child: iconWidget(
                      icon: Icons.shuffle_rounded,
                      color: ConstColor.buttoncolor,
                      size: 25,
                    ),
                  ),
                ),
                materialButton(
                  child: CustomContainer(
                    radius: 10,
                    width: 40,
                    child: iconWidget(
                      icon: Icons.library_add_outlined,
                      color: ConstColor.buttoncolor,
                      size: 25,
                    ),
                    onpress: () {
                      playListBottomSheet(context);
                    },
                  ),
                ),
                materialButton(
                  child: CustomContainer(
                    radius: 4,
                    width: 40,
                    child: iconWidget(
                      icon: Icons.volume_down_rounded,
                      color: ConstColor.buttoncolor,
                      size: 25,
                    ),
                    onpress: () {},
                  ),
                ),
                materialButton(
                  child: CustomContainer(
                    onpress: () {
                      songListBottomSheet(context);
                    },
                    radius: 4,
                    width: 40,
                    child: iconWidget(
                      icon: Icons.menu_rounded,
                      color: ConstColor.buttoncolor,
                      size: 25,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
