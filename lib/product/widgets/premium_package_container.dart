import 'package:flutter/material.dart';
import 'package:music_player_app/product/constants/assetConstants/color_constants.dart';
import 'package:music_player_app/product/extension/contex_extension.dart';

@immutable
final class PremiumPackageContainer extends StatelessWidget {
  const PremiumPackageContainer({
    super.key,
    this.header,
    this.bodyText1,
    this.bodyText2,
    this.subText1,
    this.subText2,
    this.onTap,
    this.color1,
    this.color2,
    this.color3,
    this.color4,
    this.subColor,
  });
  final String? header;
  final String? bodyText1;
  final String? bodyText2;
  final String? subText1;
  final String? subText2;
  final Color? subColor;
  final Color? color1;
  final Color? color2;
  final Color? color3;
  final Color? color4;
  final VoidCallback? onTap;

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
        height: 198, // FIX ME
        width: 168, // FIX ME
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: subColor,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  width: 168, // FIX ME
                  height: 58, // FIX ME
                  child: Center(
                    child: Text(
                      header!,
                      style: context.textTheme.titleMedium?.copyWith(
                        color: AppColors.white,
                      ),
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
                    color: AppColors.white,
                  ),
                ),
                Text(
                  bodyText2!,
                  style: context.textTheme.bodyMedium?.copyWith(
                    color: AppColors.white,
                  ),
                ),
                SizedBox(
                  height: context.dynamicHeight(0.02),
                ),
                Text(
                  subText1!,
                  style: context.textTheme.titleLarge?.copyWith(
                    color: AppColors.white,
                  ),
                ),
                SizedBox(
                  height: context.dynamicHeight(0.01),
                ),
                Text(
                  subText2!,
                  style: context.textTheme.bodyMedium?.copyWith(
                    color: AppColors.white,
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
