import 'package:flutter/material.dart';
import 'package:music_player_app/musicApp/base/extension/contex_extension.dart';
import 'package:music_player_app/musicApp/product/constants/color_constants.dart';
import 'package:music_player_app/musicApp/product/widgets/settings_listtile.dart';
import 'package:music_player_app/musicApp/view/home/home_view.dart';

class SettingsPageView extends StatelessWidget {
  const SettingsPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MusicAppColors().background,
      appBar: buildAppbar(context),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              GeneralSettingsText(context),
              GeneralSettingsContainer(),
              SizedBox(height: context.dynamicHeight(0.05)),
              HelpSettingsText(context),
              HelpSettingsContainer(),
            ],
          ),
        ),
      ),
    );
  }

  Container HelpSettingsContainer() {
    return Container(
      decoration: BoxDecoration(
        color: MusicAppColors().darkBlue,
        borderRadius: BorderRadius.circular(20),
      ),
      height: 358,
      width: 358,
      child: Padding(
        padding: EdgeInsets.only(left: 16, right: 16, top: 8),
        child: Column(
          children: [
            CustomSettingsListtile(
              onTap: () {},
              title: "Geri bildirim",
              subTitle: "Hataları bildirin ve bize nelerin iyileştirilmesi gerektiğini söyleyin",
            ),
            CustomSettingsListtile(
              onTap: () {},
              title: "Bize oy ver",
              subTitle: "Bu uygulayı beğendiniz mi? Lütfen bize puan verin.",
            ),
            CustomSettingsListtile(
              onTap: () {},
              title: "Kilit ekranında oynatma",
              subTitle: "Kilit ekranında şimdi çalanı göster",
            ),
            CustomSettingsListtile(
              onTap: () {},
              title: "Kullanım koşulları",
            ),
            CustomSettingsListtile(
              onTap: () {},
              title: "Versiyon",
              subTitle: "2.13.1.113",
            ),
          ],
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
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => MusicAppHomeView(),
            ),
          );
        },
        icon: const Icon(
          Icons.arrow_back_ios_new,
        ),
      ),
      centerTitle: true,
      title: const Text("Premium"),
    );
  }

  Row HelpSettingsText(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 30, bottom: 8),
          child: Text(
            "Yardım",
            style: context.textTheme.bodyLarge?.copyWith(
              color: MusicAppColors().white,
            ),
          ),
        ),
      ],
    );
  }

  Row GeneralSettingsText(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 30, bottom: 8),
          child: Text(
            "Genel",
            style: context.textTheme.bodyLarge?.copyWith(
              color: MusicAppColors().white,
            ),
          ),
        ),
      ],
    );
  }

  Container GeneralSettingsContainer() {
    return Container(
      decoration: BoxDecoration(
        color: MusicAppColors().darkBlue,
        borderRadius: BorderRadius.circular(20),
      ),
      height: 358,
      width: 358,
      child: Padding(
        padding: EdgeInsets.only(left: 16, right: 16, top: 8),
        child: Column(
          children: [
            CustomSettingsListtile(
              onTap: () {},
              title: "Premiuma Geçin",
              icon: Icons.diamond,
            ),
            CustomSettingsListtile(
              onTap: () {},
              title: "Müzik Tara",
            ),
            CustomSettingsListtile(
              onTap: () {},
              title: "Kilit ekranında oynatma",
              subTitle: "Kilit ekranında şimdi çalanı göster",
              icon: Icons.toggle_on,
              onPressed: () {},
            ),
            CustomSettingsListtile(
              onTap: () {},
              title: "Çıkarıldığında duraksat",
              subTitle: "Kulaklık çıkarıldığında kayıttan yürütmeyi duraksatmak için açın",
              icon: Icons.toggle_on,
              onPressed: () {},
            ),
            CustomSettingsListtile(
              onTap: () {},
              title: "Dil",
              subTitle: "Sistem varsayılan",
            ),
          ],
        ),
      ),
    );
  }
}
