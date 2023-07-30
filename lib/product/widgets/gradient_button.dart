import 'package:flutter/material.dart';
import 'package:music_player_app/product/constants/color_constants.dart';
import 'package:music_player_app/product/extension/contex_extension.dart';

@immutable
final class GradientElevatedButton extends StatelessWidget {
  const GradientElevatedButton({
    super.key,
    this.text,
    this.onTap,
  });
  final String? text;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: context.dynamicWidth(0.7),
        height: context.dynamicHeight(0.06),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient(
            colors: [
              AppColors().purple,
              AppColors().pink,
              AppColors().orange,
              AppColors().yellow,
            ],
          ),
        ),
        child: Center(
          child: Text(
            text!,
            style: context.textTheme.bodyLarge?.copyWith(
              color: AppColors().white,
            ),
          ),
        ),
      ),
    );
  }
}
