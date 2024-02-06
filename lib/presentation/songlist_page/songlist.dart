import 'package:flutter/material.dart';
import 'package:uni_player_2/Refactory/widgets.dart';
import 'package:uni_player_2/app_Global_const/const.dart';

class MusicListScreen extends StatelessWidget {
  const MusicListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ConstColor.backgroundcolor.withOpacity(0.8),
      appBar: AppBar(
        title: textwidget(string: 'Songs'),
        centerTitle: true,

        //flexibleSpace: SizedBox(height: 500),
      ),
      body: SafeArea(
          child: SizedBox(
        child: ListView.separated(
            itemBuilder: (context, index) {
              return ListTile(
                leading: iconWidget(icon: Icons.music_note),
                title: textwidget(
                    string: 'Eradaze not like that',
                    color: ConstColor.whitecolor),
              );
            },
            separatorBuilder: (context, index) {
              return const SizedBox();
            },
            itemCount: 20),
      )),
    );
  }
}
