import 'package:flutter/material.dart';
import 'package:music_player_app/feature/view/detail/music_detail_view.dart';
import 'package:music_player_app/feature/view/home/home_view.dart';
import 'package:music_player_app/feature/view/premium/premium_view.dart';
import 'package:music_player_app/feature/view/settings/settings_view.dart';
import 'package:music_player_app/product/constants/appConstants/navigation_constants.dart';

@immutable
final class Routes {
  const Routes._();
  static final appRoutes = <String, WidgetBuilder>{
    NavigationConstants.premium: (context) => const PremiumPageView(),
    NavigationConstants.settings: (context) => const SettingsPageView(),
    NavigationConstants.detail: (context) => const MusicDetailView(),
    NavigationConstants.home: (context) => const HomeView(),
  };
}
