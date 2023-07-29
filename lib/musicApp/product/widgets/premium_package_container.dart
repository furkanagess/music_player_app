// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:music_player_app/musicApp/product/extension/contex_extension.dart';
import 'package:music_player_app/musicApp/product/constants/color_constants.dart';

class PremiumPackageContainer extends StatelessWidget {
  String? header;
  String? bodyText1;
  String? bodyText2;
  String? subText1;
  String? subText2;
  Color? subColor;
  Color? color1;
  Color? color2;
  Color? color3;
  Color? color4;
  Function() onTap;
  PremiumPackageContainer({
    super.key,
    this.header,
    this.bodyText1,
    this.bodyText2,
    this.subText1,
    this.subText2,
    required this.onTap,
    this.color1,
    this.color2,
    this.color3,
    this.color4,
    this.subColor,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            begin: Alignment.bottomRight,
            end: Alignment.topLeft,
            colors: [
              color1!,
              color2!,
              color3!,
              color4!,
            ],
          ),
        ),
        height: 198,
        width: 168,
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: subColor!,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      )),
                  width: 168,
                  height: 58,
                  child: Center(
                    child: Text(
                      header!,
                      style: context.textTheme.titleMedium?.copyWith(color: ColorConstants().white),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: context.dynamicHeight(0.02),
            ),
            Column(
              children: [
                Text(
                  bodyText1!,
                  style: context.textTheme.bodyMedium?.copyWith(
                    color: ColorConstants().white,
                  ),
                ),
                Text(
                  bodyText2!,
                  style: context.textTheme.bodyMedium?.copyWith(
                    color: ColorConstants().white,
                  ),
                ),
                SizedBox(
                  height: context.dynamicHeight(0.02),
                ),
                Text(
                  subText1!,
                  style: context.textTheme.titleLarge?.copyWith(
                    color: ColorConstants().white,
                  ),
                ),
                SizedBox(
                  height: context.dynamicHeight(0.01),
                ),
                Text(
                  subText2!,
                  style: context.textTheme.bodyMedium?.copyWith(
                    color: ColorConstants().white,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
