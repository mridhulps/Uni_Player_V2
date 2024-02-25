import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:uni_player_2/Refactory/widgets.dart';
import 'package:uni_player_2/application/HomePagebloc/homepage_bloc.dart';
import 'package:uni_player_2/presentation/homepage/homepage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // context.read<HomepageBloc>().add(GenerateAudioListEvent());
    Timer(const Duration(milliseconds: 1000), () {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (ctx) => const HomePage()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Container(
        child: const Center(
          child: CustomText(
            string: 'Splash Screen',
            texttype: TextType.titleLarge,
          ),
        ),
      )),
    );
  }

  initial() async {
    if (await Permission.storage.status.isGranted) {
      log('permi granded');
      // ignore: use_build_context_synchronously
    }
  }
}
