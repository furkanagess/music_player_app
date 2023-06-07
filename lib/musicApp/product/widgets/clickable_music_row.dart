// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:music_player_app/musicApp/base/extension/contex_extension.dart';

class ClickableMusicRow extends StatelessWidget {
  Function() onTap;
  String title;
  IconData icon;
  ClickableMusicRow({super.key, required this.onTap, required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(top: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: context.textTheme.bodyMedium?.copyWith(color: Colors.white),
            ),
            Icon(
              icon,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
