import 'package:flutter/material.dart';
import 'package:music_player_app/musicApp/base/extension/contex_extension.dart';
import 'package:music_player_app/musicApp/product/constants/color_constants.dart';
import 'package:music_player_app/musicApp/product/widgets/gradient_button.dart';
import 'package:music_player_app/musicApp/product/widgets/premium_package_container.dart';
import 'package:music_player_app/musicApp/view/home/home_view.dart';

class PremiumPageView extends StatelessWidget {
  const PremiumPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MusicAppColors().background,
      appBar: BuildAppbar(context),
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: Center(
          child: Column(
            children: [
              HeaderImage(),
              SizedBox(height: context.dynamicHeight(0.01)),
              BodyText(context),
              SizedBox(height: context.dynamicHeight(0.05)),
              PackageTypesRow(context),
              SizedBox(height: context.dynamicHeight(0.05)),
              Button(),
              SizedBox(height: context.dynamicHeight(0.02)),
              FooterText(context),
            ],
          ),
        ),
      ),
    );
  }

  AppBar BuildAppbar(BuildContext context) {
    return AppBar(
      backgroundColor: MusicAppColors().background,
      elevation: 0,
      leading: IconButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => MusicAppHomeView(),
            ),
          );
        },
        icon: const Icon(
          Icons.keyboard_arrow_down,
        ),
      ),
      centerTitle: true,
      title: const Text("Premium"),
    );
  }

  GradientElevatedButton Button() {
    return GradientElevatedButton(
      text: "Devam et",
      onTap: () {},
    );
  }

  Text FooterText(BuildContext context) {
    return Text(
      "Tüm reklamları kaldır. Tüm özelliklere erişim sağla ve özgürce dinle. \n Tüm reklamları kaldır. Tüm özelliklere erişim sağla ve özgürce dinle. ",
      style: context.textTheme.bodySmall?.copyWith(
        color: MusicAppColors().white,
      ),
    );
  }

  Row PackageTypesRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        PremiumPackageContainer(
          header: "1 Ay",
          bodyText1: "Sıradan Üyelik",
          bodyText2: "",
          color1: MusicAppColors().transparentWhite,
          color2: MusicAppColors().transparentWhite,
          color3: MusicAppColors().transparentWhite,
          color4: MusicAppColors().transparentWhite,
          subColor: MusicAppColors().transparentWhite,
          subText1: "19.99₺",
          subText2: "Aylık",
          onTap: () {},
        ),
        SizedBox(width: context.dynamicWidth(0.05)),
        PremiumPackageContainer(
          header: "1 Yıl",
          bodyText1: "%50 Kazanç",
          bodyText2: "119.99₺",
          color1: MusicAppColors().purple,
          color2: MusicAppColors().pink,
          color3: MusicAppColors().orange,
          color4: MusicAppColors().yellow,
          subColor: MusicAppColors().transparentWhite,
          subText1: "9.99₺",
          subText2: "Aylık",
          onTap: () {},
        ),
      ],
    );
  }

  Text BodyText(BuildContext context) {
    return Text(
      "Tüm reklamları kaldır. Tüm özelliklere \n erişim sağla ve özgürce dinle.",
      style: context.textTheme.bodyMedium?.copyWith(
        color: MusicAppColors().white,
      ),
    );
  }

  Container HeaderImage() {
    return Container(
      height: 176,
      width: 176,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        image: DecorationImage(
          image: AssetImage(
            "assets/img/headphone.png",
          ),
        ),
      ),
    );
  }
}
