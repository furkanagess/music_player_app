import 'package:flutter/material.dart';
import 'package:music_player_app/musicApp/product/constants/color_constants.dart';
import 'package:music_player_app/musicApp/product/extension/contex_extension.dart';
import 'package:music_player_app/musicApp/product/widgets/gradient_button.dart';
import 'package:music_player_app/musicApp/product/widgets/premium_package_container.dart';

class PremiumPageView extends StatelessWidget {
  const PremiumPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MusicAppColors().background,
      appBar: buildAppbar(context),
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: Center(
          child: Column(
            children: [
              headerImage(),
              SizedBox(height: context.dynamicHeight(0.01)),
              bodyText(context),
              SizedBox(height: context.dynamicHeight(0.05)),
              packageTypesRow(context),
              SizedBox(height: context.dynamicHeight(0.05)),
              continueButton(),
              SizedBox(height: context.dynamicHeight(0.02)),
              footerText(context),
            ],
          ),
        ),
      ),
    );
  }

  AppBar buildAppbar(BuildContext context) {
    return AppBar(
      backgroundColor: MusicAppColors().background,
      elevation: 0,
      leading: IconButton(
        onPressed: () {
          Navigator.pushNamed(context, 'home');
        },
        icon: const Icon(
          Icons.keyboard_arrow_down,
        ),
      ),
      centerTitle: true,
      title: const Text('Premium'),
    );
  }

  GradientElevatedButton continueButton() {
    return GradientElevatedButton(
      text: 'Devam et',
      onTap: () {},
    );
  }

  Text footerText(BuildContext context) {
    return Text(
      'Tüm reklamları kaldır. Tüm özelliklere erişim sağla ve özgürce dinle. \n Tüm reklamları kaldır. Tüm özelliklere erişim sağla ve özgürce dinle. ',
      style: context.textTheme.bodySmall?.copyWith(
        color: MusicAppColors().white,
      ),
    );
  }

  Row packageTypesRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        PremiumPackageContainer(
          header: '1 Ay',
          bodyText1: 'Sıradan Üyelik',
          bodyText2: '',
          color1: MusicAppColors().transparentWhite,
          color2: MusicAppColors().transparentWhite,
          color3: MusicAppColors().transparentWhite,
          color4: MusicAppColors().transparentWhite,
          subColor: MusicAppColors().transparentWhite,
          subText1: '19.99₺',
          subText2: 'Aylık',
          onTap: () {},
        ),
        SizedBox(width: context.dynamicWidth(0.05)),
        PremiumPackageContainer(
          header: '1 Yıl',
          bodyText1: '%50 Kazanç',
          bodyText2: '119.99₺',
          color1: MusicAppColors().purple,
          color2: MusicAppColors().pink,
          color3: MusicAppColors().orange,
          color4: MusicAppColors().yellow,
          subColor: MusicAppColors().transparentWhite,
          subText1: '9.99₺',
          subText2: 'Aylık',
          onTap: () {},
        ),
      ],
    );
  }

  Text bodyText(BuildContext context) {
    return Text(
      'Tüm reklamları kaldır. Tüm özelliklere \n erişim sağla ve özgürce dinle.',
      style: context.textTheme.bodyMedium?.copyWith(
        color: MusicAppColors().white,
      ),
    );
  }

  Container headerImage() {
    return Container(
      height: 176,
      width: 176,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        image: DecorationImage(
          image: AssetImage(
            'assets/img/headphone.png',
          ),
        ),
      ),
    );
  }
}
