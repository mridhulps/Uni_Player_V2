import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permission_handler/permission_handler.dart';

import 'package:uni_player_2/Refactory/widgets.dart';
import 'package:uni_player_2/app_Global_const/const.dart';

import 'package:uni_player_2/application/SongListbloc/song_list_bloc.dart';
import 'package:uni_player_2/core/permission_acess.dart';
import 'package:uni_player_2/global/Locator/locator.dart';

class Permissioncontainer extends StatelessWidget {
  const Permissioncontainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SongListBloc, SongListState>(
      builder: (context, state) {
        return SizedBox(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            CustomText(
              string: state.permissionstat == PermissionType.denied
                  ? 'Permission Denied'
                  : 'Please Allow to Access Permission',
              color: Colors.white70,
              texttype: TextType.titleMedium,
              fontweight: FontWeight.bold,
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () async {
                locator
                    .get<BetterPermission>()
                    .status(Permission.storage, context);
              },
              child: CustomText(
                string: state.permissionstat == PermissionType.denied
                    ? "oppenSettings"
                    : "allow  ",
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
