import 'package:flutter/material.dart';
import 'package:music_player_app/product/constants/assetConstants/color_constants.dart';
import 'package:music_player_app/product/extension/contex_extension.dart';

@immutable
final class ClickableMusicRow extends StatelessWidget {
  const ClickableMusicRow({
    super.key,
    this.onTap,
    this.title,
    this.icon,
  });
  final VoidCallback? onTap;
  final String? title;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(top: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title!,
              style: context.textTheme.bodyMedium?.copyWith(
                color: AppColors().white,
              ),
            ),
            Icon(
              icon,
              color: AppColors().white,
            ),
          ],
        ),
      ),
    );
  }
}
