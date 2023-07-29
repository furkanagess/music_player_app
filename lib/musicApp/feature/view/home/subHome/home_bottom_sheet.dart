import 'package:flutter/material.dart';
import 'package:music_player_app/musicApp/feature/view/home/home_view.dart';
import 'package:music_player_app/musicApp/product/constants/app_constants.dart';
import 'package:music_player_app/musicApp/product/constants/app_strings.dart';
import 'package:music_player_app/musicApp/product/constants/color_constants.dart';
import 'package:music_player_app/musicApp/product/constants/navigation_constants.dart';
import 'package:music_player_app/musicApp/product/constants/png_constants.dart';
import 'package:music_player_app/musicApp/product/extension/contex_extension.dart';
import 'package:music_player_app/musicApp/product/widgets/gradient_button.dart';

final class HomeBottomSheet extends ChangeNotifier {
  Future<dynamic> musicControllBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      backgroundColor: ColorConstants().darkBlue,
      context: context,
      builder: (context) => Column(
        children: [
          ListTile(
            contentPadding: context.paddingLow,
            dense: false,
            iconColor: ColorConstants().white,
            textColor: ColorConstants().white,
            title: const Text(
              AppStrings.musicTitle,
            ),
            subtitle: const Text(
              AppStrings.musicSubTitle,
            ),
            trailing: Wrap(
              spacing: 8,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.skip_previous),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.pause),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.skip_next),
                ),
              ],
            ),
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(10),
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
              color: ColorConstants().transparentWhite,
              borderRadius: BorderRadius.circular(20),
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

  Future<dynamic> downloadBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      backgroundColor: ColorConstants().darkBlue,
      context: context,
      builder: (context) => Column(
        children: [
          ListTile(
            contentPadding: const EdgeInsets.all(8),
            dense: false,
            iconColor: ColorConstants().white,
            textColor: ColorConstants().white,
            title: const Text(
              AppStrings.musicTitle,
            ),
            subtitle: const Text(
              AppStrings.musicSubTitle,
            ),
            trailing: CircleAvatar(
              backgroundColor: ColorConstants().purple,
              child: const Icon(
                Icons.close,
              ),
            ),
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(10),
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
                  borderRadius: BorderRadius.circular(20),
                  color: ColorConstants().transparentWhite,
                ),
                child: Center(
                    child: Text(
                  AppStrings.ads,
                  style: context.textTheme.headlineLarge?.copyWith(
                    color: ColorConstants().white,
                  ),
                )),
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
            borderRadius: BorderRadius.circular(10),
          ),
          elevation: 3,
          backgroundColor: ColorConstants().darkBlue,
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
                      child: Icon(
                        Icons.close,
                        color: ColorConstants().white,
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
                      color: ColorConstants().white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    AppStrings.monthly,
                    style: context.textTheme.bodyLarge?.copyWith(
                      color: ColorConstants().white,
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
                      color: ColorConstants().white,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: context.dynamicHeight(0.03),
              ),
              GradientElevatedButton(
                text: AppStrings.next,
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
                        color: ColorConstants().white,
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
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      backgroundColor: ColorConstants().darkBlue,
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
                  color: ColorConstants().lightWhite,
                ),
                hoverColor: ColorConstants().white,
                border: UnderlineInputBorder(
                  borderSide: BorderSide(color: ColorConstants().orange),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: ColorConstants().pink),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: ColorConstants().orange),
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
