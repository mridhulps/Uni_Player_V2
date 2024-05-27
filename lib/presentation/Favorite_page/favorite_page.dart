import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uni_player_2/Refactory/widgets.dart';
import 'package:uni_player_2/app_Global_const/const.dart';
import 'package:uni_player_2/application/PlayListBloc/play_list_bloc_bloc.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ConstColor.backgroundcolor,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
          title: const CustomText(string: 'Favorite'),
          centerTitle: true,
        ),
        body: SafeArea(child:
            SizedBox(child: BlocBuilder<PlayListBlocBloc, PlayListBlocState>(
          builder: (context, state) {
            final favlist = state.favoriteList;
            return ListView.separated(
                itemBuilder: (context, index) {
                  if (favlist.isEmpty) {
                    return const Center(
                      child: CustomText(
                        string: 'No Song Found',
                        color: Colors.white,
                      ),
                    );
                  } else {
                    final model = favlist[index];

                    return ListTile(
                      title: CustomText(
                        string: model.title.toString(),
                        color: Colors.white,
                      ),
                      subtitle: CustomText(string: model.artist),
                    );
                  }
                },
                separatorBuilder: (context, index) {
                  return const SizedBox();
                },
                itemCount: favlist.length);
          },
        ))),
        floatingActionButton: FloatingActionButton.extended(
          backgroundColor: Colors.white,
          onPressed: () {},
          label: iconWidget(icon: Icons.music_note, color: Colors.black),
        ));
  }
}
