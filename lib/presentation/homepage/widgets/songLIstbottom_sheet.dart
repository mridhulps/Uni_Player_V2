// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uni_player_2/Refactory/funtions.dart';
import 'package:uni_player_2/application/HomePagebloc/homepage_bloc.dart';
import 'package:uni_player_2/presentation/songlist_page/widgets/songlist_widgets.dart';

songlistBottomSheet(BuildContext context) {
  return showModalBottomSheet(
      context: context,
      builder: (ctx) {
        return Container(
          height: screnRatio(context: context).height / 2,
          color: Colors.black,
          child: BlocBuilder<HomepageBloc, HomepageState>(
            builder: (context, state) {
              if (state.modelList.isEmpty) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: Colors.white,
                  ),
                );
              }
              return SongLIstWidget(songlist: state.modelList);
            },
          ),
        );
      });
}
