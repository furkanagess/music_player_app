import 'package:flutter/material.dart';
import 'package:music_player_app/feature/view/home/home_view.dart';
import 'package:music_player_app/product/constants/appConstants/app_constants.dart';
import 'package:music_player_app/product/constants/appConstants/app_strings.dart';
import 'package:music_player_app/product/constants/appConstants/navigation_constants.dart';
import 'package:music_player_app/product/constants/assetConstants/color_constants.dart';
import 'package:music_player_app/product/constants/assetConstants/png_constants.dart';
import 'package:music_player_app/product/extension/contex_extension.dart';
import 'package:music_player_app/product/widgets/gradient_button.dart';

final class HomeBottomSheet extends ChangeNotifier {
  Future<dynamic> musicControllBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          context.normalRadius,
        ),
      ),
      backgroundColor: AppColors.darkBlue,
      context: context,
      builder: (context) => Column(
        children: [
          ListTile(
            contentPadding: context.paddingLow,
            dense: false,
            iconColor: AppColors.white,
            textColor: AppColors.white,
            title: const Text(
              AppStrings.musicTitle,
            ),
            subtitle: const Text(
              AppStrings.musicSubTitle,
            ),
            trailing: Wrap(
              spacing: 8,
              children: [
                skipPrevButton(),
                pauseButton(),
                skipNextButton(),
              ],
            ),
            leading: ClipRRect(
              borderRadius: BorderRadius.all(context.lowRadius),
              child: Image.network(
                AppConstants.imgSource,
                height: context.dynamicHeight(0.15),
                width: context.dynamicWidth(0.15),
              ),
            ),
            onTap: () {},
          ),
          SizedBox(
            height: context.dynamicHeight(0.01),
          ),
          Container(
            decoration: BoxDecoration(
              color: AppColors.transparentWhite,
              borderRadius: BorderRadius.all(context.normalRadius),
            ),
            width: context.dynamicWidth(0.9),
            height: context.dynamicHeight(0.4),
            child: Padding(
              padding: context.paddingLow,
              child: Column(
                children: [
                  playNextButton(),
                  addMusicButton(),
                  addListButton(),
                  repeatButton(),
                  sleepTimerButton(),
                  deleteButton(),
                  reportButton(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  IconButton skipNextButton() {
    return IconButton(
      onPressed: () {},
      icon: const Icon(Icons.skip_next),
    );
  }

  IconButton pauseButton() {
    return IconButton(
      onPressed: () {},
      icon: const Icon(Icons.pause),
    );
  }

  IconButton skipPrevButton() {
    return IconButton(
      onPressed: () {},
      icon: const Icon(Icons.skip_previous),
    );
  }

  Future<dynamic> downloadBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: context.normalRadius,
          topRight: context.normalRadius,
        ),
      ),
      backgroundColor: AppColors.darkBlue,
      context: context,
      builder: (context) => Column(
        children: [
          ListTile(
            contentPadding: context.paddingLow,
            dense: false,
            iconColor: AppColors.white,
            textColor: AppColors.white,
            title: const Text(
              AppStrings.musicTitle,
            ),
            subtitle: const Text(
              AppStrings.musicSubTitle,
            ),
            trailing: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: const CircleAvatar(
                backgroundColor: AppColors.purple,
                child: Icon(
                  Icons.close,
                ),
              ),
            ),
            leading: ClipRRect(
              borderRadius: BorderRadius.all(context.lowRadius),
              child: Image.network(
                AppConstants.imgSource,
                height: context.dynamicHeight(0.15),
                width: context.dynamicWidth(0.15),
              ),
            ),
            onTap: () {},
          ),
          SizedBox(
            height: context.dynamicHeight(0.01),
          ),
          Padding(
            padding: context.paddingLow,
            child: InkWell(
              onTap: () {},
              child: Container(
                height: context.dynamicHeight(0.1),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(context.normalRadius),
                  color: AppColors.transparentWhite,
                ),
                child: Center(
                  child: Text(
                    AppStrings.ads,
                    style: context.textTheme.headlineLarge?.copyWith(
                      color: AppColors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<dynamic> adShowDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: BeveledRectangleBorder(
            borderRadius: BorderRadius.all(context.lowRadius),
          ),
          elevation: 3,
          backgroundColor: AppColors.darkBlue,
          title: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: SizedBox(
                      width: context.dynamicWidth(0.1),
                      height: context.dynamicHeight(0.05),
                      child: const Icon(
                        Icons.close,
                        color: AppColors.white,
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                width: context.dynamicWidth(0.7),
                height: context.dynamicHeight(0.2),
                child: Image.asset(
                  PNGConstants.instance.fioLogo,
                ),
              ),
              SizedBox(
                height: context.dynamicHeight(0.05),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppStrings.closeAd,
                    style: context.textTheme.bodyLarge?.copyWith(
                      color: AppColors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    AppStrings.monthly,
                    style: context.textTheme.bodyLarge?.copyWith(
                      color: AppColors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: context.dynamicHeight(0.03),
              ),
              Row(
                children: [
                  Text(
                    AppStrings.reachProperties,
                    style: context.textTheme.bodyMedium?.copyWith(
                      color: AppColors.white,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: context.dynamicHeight(0.03),
              ),
              GradientElevatedButton(
                text: AppStrings.getPremium,
                onTap: () {
                  Navigator.pushNamed(context, NavigationConstants.premium);
                },
              ),
              SizedBox(
                height: context.dynamicHeight(0.01),
              ),
              Row(
                children: [
                  Padding(
                    padding: context.paddingLow,
                    child: Text(
                      AppStrings.reachProperties2,
                      style: context.textTheme.bodySmall?.copyWith(
                        color: AppColors.white,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Future<dynamic> createPlaylistBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: context.normalRadius,
          topRight: context.normalRadius,
        ),
      ),
      backgroundColor: AppColors.darkBlue,
      context: context,
      builder: (context) => Padding(
        padding: context.paddingNormal,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                hintText: AppStrings.playlistName,
                hintStyle: context.textTheme.bodyMedium?.copyWith(
                  color: AppColors.lightWhite,
                ),
                hoverColor: AppColors.white,
                border: const UnderlineInputBorder(
                  borderSide: BorderSide(color: AppColors.orange),
                ),
                focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: AppColors.pink),
                ),
                enabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: AppColors.orange),
                ),
              ),
            ),
            GradientElevatedButton(
              text: AppStrings.giveName,
              onTap: () {},
            )
          ],
        ),
      ),
    );
  }
}
