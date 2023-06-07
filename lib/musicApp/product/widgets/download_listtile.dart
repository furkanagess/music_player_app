// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:music_player_app/musicApp/base/extension/contex_extension.dart';
import 'package:music_player_app/musicApp/product/constants/app_strings.dart';
import 'package:music_player_app/musicApp/product/constants/color_constants.dart';

class DownloadListtie extends StatelessWidget {
  String title;
  String subTitle;
  String img;
  DownloadListtie({super.key, required this.title, required this.subTitle, required this.img});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      dense: false,
      iconColor: Colors.white,
      textColor: Colors.white,
      title: Text(title),
      subtitle: Text(subTitle),
      trailing: InkWell(
        onTap: () {
          showModalBottomSheet(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            backgroundColor: MusicAppColors().darkBlue,
            context: context,
            builder: (context) => Column(
              children: [
                ListTile(
                  contentPadding: const EdgeInsets.all(8),
                  dense: false,
                  iconColor: MusicAppColors().white,
                  textColor: MusicAppColors().white,
                  title: Text(
                    MusicAppStrings().musicTitle,
                  ),
                  subtitle: Text(
                    MusicAppStrings().musicSubTitle,
                  ),
                  trailing: CircleAvatar(
                    backgroundColor: MusicAppColors().purple,
                    child: const Icon(
                      Icons.close,
                    ),
                  ),
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      "https://picsum.photos/200",
                      height: 64,
                      width: 64,
                    ),
                  ),
                  onTap: () {},
                ),
                SizedBox(
                  height: context.dynamicHeight(0.01),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16, top: 16),
                  child: InkWell(
                    onTap: () {},
                    child: Container(
                      height: context.dynamicHeight(0.1),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: MusicAppColors().transparentWhite,
                      ),
                      child: Center(
                          child: Text(
                        "ADS",
                        style: context.textTheme.headlineLarge?.copyWith(
                          color: MusicAppColors().white,
                        ),
                      )),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
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
      onTap: () {},
    );
  }
}
