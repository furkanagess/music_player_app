import 'package:flutter/material.dart';
import 'package:music_player_app/musicApp/product/extension/contex_extension.dart';
import 'package:music_player_app/musicApp/product/constants/color_constants.dart';

class MusicAppMusicAppSplashView extends StatelessWidget {
  const MusicAppMusicAppSplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
            colors: [
              AppColors().purple,
              AppColors().pink,
              AppColors().orange,
              AppColors().yellow,
            ],
          ),
        ),
        child: Center(
          child: Container(
            width: context.dynamicWidth(0.3),
            child: Image.asset("assets/img/fio_logo.png"),
          ),
        ),
      ),
    );
  }
}
