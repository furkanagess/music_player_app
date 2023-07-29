import 'package:flutter/material.dart';

final class MusicListTile extends StatelessWidget {
  const MusicListTile({
    super.key,
    this.title,
    this.subTitle,
    this.img,
    this.tapVert,
    this.tapMenu,
    this.onTap,
  });
  final String? title;
  final String? subTitle;
  final String? img;
  final VoidCallback? tapVert;
  final VoidCallback? tapMenu;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: ListTile(
        dense: false,
        iconColor: Colors.white,
        textColor: Colors.white,
        title: Text(title!),
        subtitle: Text(subTitle!),
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
            img!,
            height: 64,
            width: 64,
          ),
        ),
        onTap: () {},
      ),
    );
  }
}
