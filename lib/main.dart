import 'package:flutter/material.dart';
import 'package:music_player_app/musicApp/view/detail/music_detail_view.dart';
import 'package:music_player_app/musicApp/view/home/home_view.dart';
import 'package:music_player_app/musicApp/view/premium/premium_view.dart';
import 'package:music_player_app/musicApp/view/settings/settings_view.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Music Player App',
      home: const MusicAppHomeView(),
      routes: {
        'premium': (context) => const PremiumPageView(),
        'settings': (context) => const SettingsPageView(),
        'detail': (context) => const MusicDetailView(),
        'home': (context) => const MusicAppHomeView(),
      },
    );
  }
}
