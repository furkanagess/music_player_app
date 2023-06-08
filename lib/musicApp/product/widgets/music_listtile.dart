// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class MusicListTile extends StatelessWidget {
  String title;
  String subTitle;
  String img;
  Function() tapVert;
  Function() tapMenu;
  MusicListTile({
    super.key,
    required this.title,
    required this.subTitle,
    required this.img,
    required this.tapVert,
    required this.tapMenu,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      dense: false,
      iconColor: Colors.white,
      textColor: Colors.white,
      title: Text(title),
      subtitle: Text(subTitle),
      trailing: Wrap(
        spacing: 12,
        children: [
          IconButton(
            onPressed: tapVert,
            icon: const Icon(Icons.more_vert),
          ),
          IconButton(
            onPressed: tapMenu,
            icon: const Icon(Icons.menu),
          ),
        ],
      ),
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.network(
          img,
          height: 64,
          width: 64,
        ),
      ),
      onTap: () {},
    );
  }
}
