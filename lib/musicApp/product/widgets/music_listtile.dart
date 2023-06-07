// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class MusicListTile extends StatelessWidget {
  String title;
  String subTitle;
  String img;
  MusicListTile({super.key, required this.title, required this.subTitle, required this.img});

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
            onPressed: () {},
            icon: const Icon(Icons.more_vert),
          ),
          IconButton(
            onPressed: () {},
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
