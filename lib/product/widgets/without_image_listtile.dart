import 'package:flutter/material.dart';
import 'package:music_player_app/product/constants/color_constants.dart';

@immutable
final class NoImageTwoIconListTile extends StatelessWidget {
  const NoImageTwoIconListTile({
    super.key,
    this.title,
    this.subTitle,
    this.iconOne,
    this.iconTwo,
    this.onTap,
  });
  final String? title;
  final String? subTitle;
  final Widget? iconOne;
  final Widget? iconTwo;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      iconColor: AppColors().white,
      textColor: AppColors().white,
      title: Text(
        title!,
      ),
      subtitle: Text(
        subTitle!,
      ),
      trailing: Wrap(
        spacing: 12,
        children: <Widget>[
          IconButton(
            onPressed: () {},
            icon: iconOne!,
          ),
          IconButton(
            onPressed: () {},
            icon: iconTwo!,
          ),
        ],
      ),
      onTap: onTap,
    );
  }
}
