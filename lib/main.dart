import 'package:flutter/material.dart';
import 'package:music_player_app/feature/view/home/home_view.dart';
import 'package:music_player_app/product/constants/appConstants/app_strings.dart';
import 'package:music_player_app/product/navigation/routes.dart';
import 'package:music_player_app/product/theme/app_theme.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppStrings.appName,
      home: const HomeView(),
      routes: Routes.appRoutes,
      theme: AppTheme().theme,
    );
  }
}
