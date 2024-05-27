//SCREEN SIZE METHODE;

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:uni_player_2/app_Global_const/const.dart';

// GET SIZE REFACTOR FUNCTION;

Size screnRatio({required BuildContext context}) {
  return MediaQuery.of(context).size;
}

customToast(String message) {
  Fluttertoast.cancel();
  Fluttertoast.showToast(
      msg: message,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.white,
      textColor: ConstColor.backgroundcolor);
}
