// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:music_player_app/musicApp/product/constants/color_constants.dart';

class NoImageTwoIconListTile extends StatelessWidget {
  String title;
  String subTitle;
  Widget iconOne;
  Widget iconTwo;
  Function() onTap;

  NoImageTwoIconListTile({
    super.key,
    required this.title,
    required this.subTitle,
    required this.iconOne,
    required this.iconTwo,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      iconColor: MusicAppColors().white,
      textColor: MusicAppColors().white,
      title: Text(
        title,
      ),
      subtitle: Text(
        subTitle,
      ),
      trailing: Wrap(
        spacing: 12,
        children: <Widget>[
          IconButton(
            onPressed: () {},
            icon: iconOne,
          ),
          IconButton(
            onPressed: () {},
            icon: iconTwo,
          ),
        ],
      ),
      onTap: onTap,
    );
  }
}
