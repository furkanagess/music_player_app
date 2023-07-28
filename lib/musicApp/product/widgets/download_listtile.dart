import 'package:flutter/material.dart';

import 'package:music_player_app/musicApp/product/constants/color_constants.dart';

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
      iconColor: Colors.white,
      textColor: Colors.white,
      title: Text(title!),
      subtitle: Text(subTitle!),
      trailing: InkWell(
        onTap: tapDownload,
        child: CircleAvatar(
          backgroundColor: MusicAppColors().purple,
          child: const Icon(
            Icons.download,
          ),
        ),
      ),
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.network(
          img!,
          height: 64,
          width: 64,
        ),
      ),
      onTap: tapMusic,
    );
  }
}
