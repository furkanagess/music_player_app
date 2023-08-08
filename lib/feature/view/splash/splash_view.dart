import 'package:flutter/material.dart';
import 'package:music_player_app/product/constants/assetConstants/color_constants.dart';
import 'package:music_player_app/product/constants/assetConstants/png_constants.dart';
import 'package:music_player_app/product/extension/contex_extension.dart';

class MusicAppMusicAppSplashView extends StatelessWidget {
  const MusicAppMusicAppSplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
            colors: [
              AppColors.purple,
              AppColors.pink,
              AppColors.orange,
              AppColors.yellow,
            ],
          ),
        ),
        child: Center(
          child: SizedBox(
            width: context.dynamicWidth(0.3),
            child: Image.asset(PNGConstants.fioLogo),
          ),
        ),
      ),
    );
  }
}
