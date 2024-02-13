import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:uni_player_2/Refactory/widgets.dart';
import 'package:uni_player_2/app_Global_const/const.dart';

import 'package:uni_player_2/application/SongListbloc/song_list_bloc.dart';

class Permissioncontainer extends StatelessWidget {
  const Permissioncontainer({
    super.key,
  });

  final String requisttext = 'please Allow to Access Permission';
  final String allowtext = 'Allow';
  final String settingtext = 'Open Settings';
  final String errortext = 'Permission Denied';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SongListBloc, SongListState>(
      builder: (context, state) {
        return SizedBox(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            CustomText(
              string: requisttext,
              color: Colors.white70,
              texttype: TextType.titleMedium,
              fontweight: FontWeight.bold,
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () async {
                context
                    .read<SongListBloc>()
                    .add(PermissionAccess(context: context));
              },
              child: CustomText(
                string: allowtext,
                paddingtop: 10,
                paddingbottom: 10,
                fontweight: FontWeight.bold,
                color: ConstColor.backgroundcolor,
              ),
            )
          ]),
        );
      },
    );
  }
}
