// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:music_player_app/musicApp/base/extension/contex_extension.dart';

class DrawerListTile extends StatelessWidget {
  Function() onTap;
  String title;
  IconData icon;
  DrawerListTile({super.key, required this.onTap, required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        color: Colors.white,
      ),
      title: Text(
        title,
        style: context.textTheme.bodyMedium?.copyWith(color: Colors.white),
      ),
      onTap: onTap,
    );
  }
}
