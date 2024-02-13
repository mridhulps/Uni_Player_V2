import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uni_player_2/app_Global_const/theme_const.dart';
import 'package:uni_player_2/application/HomePagebloc/homepage_bloc.dart';
import 'package:uni_player_2/application/SongListbloc/song_list_bloc.dart';
import 'package:uni_player_2/global/Locator/locator.dart';
import 'package:uni_player_2/global/domain/instances/instance.dart';
import 'package:uni_player_2/presentation/homepage/homepage.dart';

void main(List<String> args) {
  runApp(const NewApp());
  getItconfigure();

  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
}

class NewApp extends StatelessWidget {
  const NewApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: ((context) => HomepageBloc())),
        BlocProvider(create: ((context) => SongListBloc())),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.theme(),
        home: const HomePage(),
      ),
    );
  }
}
