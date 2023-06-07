// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:music_player_app/musicApp/base/extension/contex_extension.dart';
import 'package:music_player_app/musicApp/product/constants/color_constants.dart';

class GradientElevatedButton extends StatelessWidget {
  String text;
  Function() onTap;
  GradientElevatedButton({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: context.dynamicWidth(0.7),
        height: context.dynamicHeight(0.06),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: LinearGradient(colors: [
              MusicAppColors().purple,
              MusicAppColors().pink,
              MusicAppColors().orange,
              MusicAppColors().yellow,
            ])),
        child: Center(
          child: Text(
            text,
            style: context.textTheme.bodyLarge?.copyWith(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
