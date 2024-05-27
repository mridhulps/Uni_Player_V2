import 'package:flutter/material.dart';
import 'package:uni_player_2/Refactory/widgets.dart';
import 'package:uni_player_2/presentation/Favorite_page/favorite_page.dart';
import 'package:uni_player_2/presentation/playList_page/playlistpage.dart';
import 'package:uni_player_2/presentation/songlist_page/widgets/sorting_button.dart';

class OptionDropdownButton extends StatelessWidget {
  const OptionDropdownButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomDropDownButton(
        icon: iconWidget(icon: Icons.menu_rounded, paddingright: 15),
        backgroundcolor: Colors.black,
        customitem: [
          customItem(
              text: 'Favorite',
              onpress: () => customNavigator(context, const FavoritePage())),
          customItem(
              text: 'PlayList',
              onpress: () => customNavigator(context, const PlayListScreen())),
          customItem(text: 'DownLoads'),
          customItem(text: 'YouTube DownLoader'),
          customItem(
            text: 'Settings',
          ),
        ]);
  }
}
