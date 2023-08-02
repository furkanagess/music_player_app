import 'package:flutter/material.dart';
import 'package:music_player_app/product/constants/assetConstants/color_constants.dart';
import 'package:music_player_app/product/extension/contex_extension.dart';

@immutable
final class CustomSettingsListtile extends StatelessWidget {
  const CustomSettingsListtile({
    super.key,
    this.onTap,
    this.title,
    this.subTitle,
    this.icon,
    this.onPressed,
  });
  final VoidCallback? onTap;
  final VoidCallback? onPressed;
  final String? title;
  final String? subTitle;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      visualDensity: VisualDensity.adaptivePlatformDensity,
      onTap: onTap,
      title: Text(
        title!,
        style: context.textTheme.bodyMedium?.copyWith(
          color: AppColors.white,
        ),
      ),
      subtitle: Text(
        subTitle ?? '',
        style: context.textTheme.bodyMedium?.copyWith(
          color: AppColors.lightWhite,
        ),
      ),
      trailing: IconButton(
        onPressed: onPressed,
        icon: Icon(
          icon,
          size: 40,
          color: AppColors.white,
        ),
      ),
    );
  }
}
