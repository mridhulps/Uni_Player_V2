//MUSIC CONTROLL PLAY/PAUSE MORE CONTAINER;

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_audio/just_audio.dart';

import 'package:uni_player_2/Refactory/widgets.dart';
import 'package:uni_player_2/app_Global_const/const.dart';
import 'package:uni_player_2/application/HomePagebloc/homepage_bloc.dart';
import 'package:uni_player_2/global/Locator/locator.dart';
import 'package:uni_player_2/global/domain/instances/instance.dart';

class ControllSystem extends StatelessWidget {
  ControllSystem({super.key});
  final color = Colors.white;

  final player = locator.get<Instances>().audioplayer;

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      radius: 20,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          InkWell(
            onTap: () {
              context.read<HomepageBloc>().add(BackwardEvent());
            },
            child: materialButton(
              child: iconWidget(
                icon: Icons.skip_previous_rounded,
                color: ConstColor.buttoncolor,
                size: 40,
              ),
            ),
          ),

          StreamBuilder<PlayerState>(
            stream: player.playerStateStream,
            builder: (context, state) {
              if (state.data!.processingState == ProcessingState.completed) {
                log('complited');
              } else {
                log('bloc player  playing');
              }

              if (state.data == null || state.hasError) {
                log('plater state is null');
                return materialButton(
                    radius: 30,
                    child: iconWidget(
                      icon: Icons.play_arrow_rounded,
                      color: ConstColor.buttoncolor,
                      size: 45,
                    ));
              } else {
                final isplaying = state.data!.playing;

                return InkWell(
                  onTap: () {
                    context.read<HomepageBloc>().add(PlayAndPauseEvent());
                  },
                  child: materialButton(
                      radius: 30,
                      child: isplaying == true
                          ? iconWidget(
                              icon: Icons.pause_outlined,
                              color: ConstColor.buttoncolor,
                              size: 40,
                            )
                          : iconWidget(
                              icon: Icons.play_arrow_rounded,
                              color: ConstColor.buttoncolor,
                              size: 45,
                            )),
                );
              }
            },
          ),

          // InkWell(onTap: () {
          //   context.read<HomepageBloc>().add(PlayAndPauseEvent());
          // }, child: BlocBuilder<HomepageBloc, HomepageState>(
          //   builder: (context, state) {
          //     return materialButton(
          //         radius: 30,
          //         child: state.isplaying == true
          //             ? iconWidget(
          //                 icon: Icons.pause_outlined,
          //                 color: ConstColor.buttoncolor,
          //                 size: 40,
          //               )
          //             : iconWidget(
          //                 icon: Icons.play_arrow_rounded,
          //                 color: ConstColor.buttoncolor,
          //                 size: 45,
          //               ));
          //   },
          // )),
          InkWell(
            onTap: () {
              context.read<HomepageBloc>().add(ForwardEvent());
            },
            child: materialButton(
              child: iconWidget(
                icon: Icons.skip_next_rounded,
                color: ConstColor.buttoncolor,
                size: 40,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
