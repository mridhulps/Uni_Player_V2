import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:uni_player_2/Refactory/widgets.dart';
import 'package:uni_player_2/application/PlayListBloc/play_list_bloc_bloc.dart';
import 'package:uni_player_2/global/Entity/playlist_model.dart';

Future<void> addPlayListBottomSheet(
  BuildContext context,
) {
  final TextEditingController controller = TextEditingController();

  return showModalBottomSheet(
      backgroundColor: Colors.black,
      context: context,
      isScrollControlled: true,
      isDismissible: true,
      builder: (ctx) {
        //ROOT CONTAINER;
        return SingleChildScrollView(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: SizedBox(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomTextField(
                  hintname: 'Add PlayList ',
                  controller: controller,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    //CANCEL BUTTON;

                    customButton(
                      name: 'Cancel',
                      ontap: () => Navigator.of(context).pop(),
                    ),
                    customButton(
                      name: 'Enter',
                      ontap: () => validation(controller, context),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      });
}

//ADD PLAYLIST VALIDATION FUNTION;

validation(TextEditingController controller, BuildContext context) {
  final text = controller.text;

  if (text.isEmpty) {
    Navigator.of(context).pop();
  } else {
    final model = CustomPlayListModel(songList: [], playistName: text);

    context
        .read<PlayListBlocBloc>()
        .add(AddPlayListEvent(playlistmodel: model));

    controller.clear();
    Navigator.of(context).pop();
  }
}
