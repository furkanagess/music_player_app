import 'package:flutter/material.dart';
import 'package:music_player_app/product/constants/appConstants/app_strings.dart';
import 'package:music_player_app/product/constants/appConstants/navigation_constants.dart';
import 'package:music_player_app/product/constants/assetConstants/color_constants.dart';
import 'package:music_player_app/product/constants/assetConstants/png_constants.dart';
import 'package:music_player_app/product/extension/contex_extension.dart';
import 'package:music_player_app/product/widgets/gradient_button.dart';
import 'package:music_player_app/product/widgets/premium_package_container.dart';

class PremiumPageView extends StatelessWidget {
  const PremiumPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: buildAppbar(context),
      body: Padding(
        padding: context.paddingLowHorizontal,
        child: Center(
          child: Column(
            children: [
              Expanded(
                flex: 5,
                child: headerImage(context),
              ),
              Expanded(
                flex: 6,
                child: packageTypesRow(context),
              ),
              Expanded(
                child: continueButton(),
              ),
              Expanded(
                child: footerText(context),
              ),
            ],
          ),
        ),
      ),
    );
  }

  AppBar buildAppbar(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.background,
      elevation: 0,
      leading: IconButton(
        onPressed: () {
          Navigator.pushNamed(context, NavigationConstants.home);
        },
        icon: const Icon(
          Icons.keyboard_arrow_down,
        ),
      ),
      centerTitle: true,
      title: const Text(AppStrings.premium),
    );
  }

  GradientElevatedButton continueButton() {
    return GradientElevatedButton(
      text: AppStrings.getPremium,
      onTap: () {},
    );
  }

  Padding footerText(BuildContext context) {
    return Padding(
      padding: context.paddingLow,
      child: Text(
        AppStrings.removeAds,
        style: context.textTheme.bodySmall?.copyWith(
          color: AppColors.white,
        ),
      ),
    );
  }

  Row packageTypesRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        PremiumPackageContainer(
          header: AppStrings.oneMonth,
          bodyText1: AppStrings.standartPackage,
          bodyText2: AppStrings.empty,
          color1: AppColors.transparentWhite,
          color2: AppColors.transparentWhite,
          color3: AppColors.transparentWhite,
          color4: AppColors.transparentWhite,
          subColor: AppColors.transparentWhite,
          subText1: AppStrings.standartPrice,
          subText2: AppStrings.monthly,
          onTap: () {},
        ),
        SizedBox(width: context.dynamicWidth(0.05)),
        PremiumPackageContainer(
          header: AppStrings.oneYear,
          bodyText1: AppStrings.premiumProfit,
          bodyText2: AppStrings.premiumPrice,
          color1: AppColors.purple,
          color2: AppColors.pink,
          color3: AppColors.orange,
          color4: AppColors.yellow,
          subColor: AppColors.transparentWhite,
          subText1: AppStrings.monthlyPremium,
          subText2: AppStrings.monthly,
          onTap: () {},
        ),
      ],
    );
  }

  Text bodyText(BuildContext context) {
    return Text(
      AppStrings.removeAds,
      style: context.textTheme.bodyMedium?.copyWith(
        color: AppColors.white,
      ),
    );
  }

  Container headerImage(BuildContext context) {
    return Container(
      height: context.dynamicHeight(0.3),
      width: context.dynamicHeight(0.7),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(context.normalRadius),
        image: DecorationImage(
          image: AssetImage(
            PNGConstants.instance.headphone,
          ),
        ),
      ),
    );
  }
}
