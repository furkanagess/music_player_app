import 'package:flutter/material.dart';
import 'package:music_player_app/feature/view/detail/music_detail_view.dart';
import 'package:music_player_app/feature/view/home/home_view.dart';
import 'package:music_player_app/feature/view/premium/premium_view.dart';
import 'package:music_player_app/feature/view/settings/settings_view.dart';
import 'package:music_player_app/product/constants/app_strings.dart';
import 'package:music_player_app/product/constants/navigation_constants.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppStrings.appName,
      home: const HomeView(),
      routes: {
        NavigationConstants.premium: (context) => const PremiumPageView(),
        NavigationConstants.settings: (context) => const SettingsPageView(),
        NavigationConstants.detail: (context) => const MusicDetailView(),
        NavigationConstants.home: (context) => const HomeView(),
      },
    );
  }
}
