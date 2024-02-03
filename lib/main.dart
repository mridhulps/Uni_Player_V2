import 'package:flutter/material.dart';
import 'package:uni_player_2/app_Global_const/theme_const.dart';
import 'package:uni_player_2/presentation/homepage/homepage.dart';

void main(List<String> args) {
  runApp(const NewApp());
}

class NewApp extends StatelessWidget {
  const NewApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.theme(),
      home: const HomePage(),
    );
  }
}
