import 'package:flutter/material.dart';
import 'package:music_player_app/product/constants/appConstants/app_strings.dart';
import 'package:music_player_app/product/constants/appConstants/navigation_constants.dart';
import 'package:music_player_app/product/constants/assetConstants/color_constants.dart';
import 'package:music_player_app/product/extension/contex_extension.dart';
import 'package:music_player_app/product/widgets/settings_listtile.dart';

class SettingsPageView extends StatelessWidget {
  const SettingsPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors().background,
      appBar: buildAppbar(context),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: context.paddingNormal,
            child: Column(
              children: [
                generalSettingsText(context),
                const GeneralSettingsArea(),
                SizedBox(height: context.dynamicHeight(0.05)),
                helpSettingsText(context),
                const HelpSettingsArea(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  AppBar buildAppbar(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors().background,
      elevation: 0,
      leading: IconButton(
        onPressed: () {
          Navigator.pushNamed(context, NavigationConstants.home);
        },
        icon: const Icon(
          Icons.arrow_back_ios_new,
        ),
      ),
      centerTitle: true,
      title: const Text(AppStrings.premium),
    );
  }

  Row helpSettingsText(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: context.paddingLow,
          child: Text(
            AppStrings.help,
            style: context.textTheme.bodyLarge?.copyWith(
              color: AppColors().white,
            ),
          ),
        ),
      ],
    );
  }

  Row generalSettingsText(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: context.paddingLow,
          child: Text(
            AppStrings.general,
            style: context.textTheme.bodyLarge?.copyWith(
              color: AppColors().white,
            ),
          ),
        ),
      ],
    );
  }
}

class GeneralSettingsArea extends StatelessWidget {
  const GeneralSettingsArea({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors().darkBlue,
        borderRadius: BorderRadius.all(context.normalRadius),
      ),
      height: context.dynamicHeight(0.4),
      child: Padding(
        padding: context.paddingLow,
        child: Column(
          children: [
            Expanded(
              child: premiumListtile(),
            ),
            Expanded(
              child: lockScreenListtile(),
            ),
            Expanded(
              child: languageListtile(),
            ),
          ],
        ),
      ),
    );
  }

  CustomSettingsListtile languageListtile() {
    return CustomSettingsListtile(
      onTap: () {},
      title: AppStrings.language,
      subTitle: AppStrings.languageDesc,
    );
  }

  CustomSettingsListtile lockScreenListtile() {
    return CustomSettingsListtile(
      onTap: () {},
      title: AppStrings.lockScreen,
      subTitle: AppStrings.lockScreenDesc,
      icon: Icons.toggle_on,
      onPressed: () {},
    );
  }

  CustomSettingsListtile premiumListtile() {
    return CustomSettingsListtile(
      onTap: () {},
      title: AppStrings.getPremium,
      icon: Icons.diamond,
    );
  }
}

class HelpSettingsArea extends StatelessWidget {
  const HelpSettingsArea({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors().darkBlue,
        borderRadius: BorderRadius.all(context.normalRadius),
      ),
      height: context.dynamicHeight(0.4),
      child: Padding(
        padding: context.paddingLow,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: feedbackListtile(),
            ),
            Expanded(
              child: rateListtile(),
            ),
            Expanded(
              child: termsListtile(),
            ),
            Expanded(
              child: versionListtile(),
            ),
          ],
        ),
      ),
    );
  }

  CustomSettingsListtile versionListtile() {
    return CustomSettingsListtile(
      onTap: () {},
      title: AppStrings.version,
      subTitle: AppStrings.versionDesc,
    );
  }

  CustomSettingsListtile termsListtile() {
    return CustomSettingsListtile(
      onTap: () {},
      title: AppStrings.terms,
    );
  }

  CustomSettingsListtile rateListtile() {
    return CustomSettingsListtile(
      onTap: () {},
      title: AppStrings.rate,
      subTitle: AppStrings.rateDesc,
    );
  }

  CustomSettingsListtile feedbackListtile() {
    return CustomSettingsListtile(
      onTap: () {},
      title: AppStrings.feedback,
      subTitle: AppStrings.feedbackDesc,
    );
  }
}
