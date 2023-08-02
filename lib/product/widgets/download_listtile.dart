import 'package:flutter/material.dart';

import 'package:music_player_app/product/constants/assetConstants/color_constants.dart';
import 'package:music_player_app/product/extension/contex_extension.dart';

@immutable
final class DownloadListtie extends StatelessWidget {
  const DownloadListtie({
    super.key,
    this.title,
    this.subTitle,
    this.img,
    this.tapMusic,
    this.tapDownload,
  });
  final String? title;
  final String? subTitle;
  final String? img;
  final VoidCallback? tapMusic;
  final VoidCallback? tapDownload;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      dense: false,
      iconColor: AppColors.white,
      textColor: AppColors.white,
      title: Text(title!),
      subtitle: Text(subTitle!),
      trailing: InkWell(
        onTap: tapDownload,
        child: const CircleAvatar(
          backgroundColor: AppColors.purple,
          child: Icon(
            Icons.download,
          ),
        ),
      ),
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.network(
          img!,
          height: context.dynamicHeight(0.15),
          width: context.dynamicWidth(0.15),
        ),
      ),
      onTap: tapMusic,
    );
  }
}
