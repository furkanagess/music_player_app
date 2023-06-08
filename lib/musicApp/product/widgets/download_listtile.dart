// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import 'package:music_player_app/musicApp/product/constants/color_constants.dart';

class DownloadListtie extends StatelessWidget {
  String title;
  String subTitle;
  String img;
  Function() tapMusic;
  Function() tapDownload;
  DownloadListtie({
    super.key,
    required this.title,
    required this.subTitle,
    required this.img,
    required this.tapMusic,
    required this.tapDownload,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      dense: false,
      iconColor: Colors.white,
      textColor: Colors.white,
      title: Text(title),
      subtitle: Text(subTitle),
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
          img,
          height: 64,
          width: 64,
        ),
      ),
      onTap: tapMusic,
    );
  }
}
