//MUSIC CONTROLL PLAY/PAUSE MORE CONTAINER;

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_audio/just_audio.dart';

import 'package:uni_player_2/Refactory/widgets.dart';
import 'package:uni_player_2/app_Global_const/const.dart';

import 'package:uni_player_2/application/SongsAndPlayBloc/song_and_play_bloc.dart';

import 'package:uni_player_2/global/domain/instances/instance.dart';

class ControllSystem extends StatelessWidget {
  ControllSystem({super.key});
  final color = Colors.white;

  final player = Instances.audioplayer;

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      radius: 20,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          InkWell(
            onTap: () {
              context.read<SongAndPlayBloc>().add(PlayPreviousEvent());
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
                    context.read<SongAndPlayBloc>().add(PlayAndPauseEvent());
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
          InkWell(
            onTap: () {
              context.read<SongAndPlayBloc>().add(PlayNextEvent());
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
