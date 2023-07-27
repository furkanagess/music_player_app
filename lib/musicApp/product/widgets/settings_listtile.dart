// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:music_player_app/musicApp/product/extension/contex_extension.dart';
import 'package:music_player_app/musicApp/product/constants/color_constants.dart';

class CustomSettingsListtile extends StatelessWidget {
  Function() onTap;
  Function()? onPressed;
  String title;
  String? subTitle;
  IconData? icon;
  CustomSettingsListtile({super.key, required this.onTap, required this.title, this.subTitle, this.icon, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      visualDensity: VisualDensity.adaptivePlatformDensity,
      onTap: onTap,
      title: Text(
        title,
        style: context.textTheme.bodyMedium?.copyWith(
          color: MusicAppColors().white,
        ),
      ),
      subtitle: Text(
        subTitle ?? "",
        style: context.textTheme.bodyMedium?.copyWith(
          color: MusicAppColors().lightWhite,
        ),
      ),
      trailing: IconButton(
        onPressed: onPressed ?? null,
        icon: Icon(
          icon,
          size: 34,
          color: MusicAppColors().white,
        ),
      ),
    );
  }
}
