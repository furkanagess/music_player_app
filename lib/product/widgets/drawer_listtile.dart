import 'package:flutter/material.dart';
import 'package:music_player_app/product/constants/assetConstants/color_constants.dart';
import 'package:music_player_app/product/extension/contex_extension.dart';

@immutable
final class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
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
    return ListTile(
      leading: Icon(
        icon,
        color: AppColors.white,
      ),
      title: Text(
        title!,
        style: context.textTheme.bodyMedium?.copyWith(
          color: AppColors.white,
        ),
      ),
      onTap: onTap,
    );
  }
}
