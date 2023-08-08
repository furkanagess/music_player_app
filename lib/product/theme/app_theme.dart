import 'package:flutter/material.dart';
import 'package:music_player_app/product/constants/assetConstants/color_constants.dart';

@immutable
final class AppTheme {
  ThemeData get theme {
    return ThemeData(
      brightness: Brightness.dark,
      appBarTheme: _appBarTheme,
      scaffoldBackgroundColor: _colorScheme.background,
      colorScheme: _colorScheme,
      iconTheme: _iconThemeData,
      drawerTheme: _drawerThemeData,
      dialogTheme: _dialogTheme,
      bottomSheetTheme: _bottomSheetThemeData,
    );
  }

  BottomSheetThemeData get _bottomSheetThemeData => const BottomSheetThemeData(
        elevation: 3,
        backgroundColor: AppColors.darkBlue,
      );

  DialogTheme get _dialogTheme => const DialogTheme(
        backgroundColor: AppColors.darkBlue,
      );

  DrawerThemeData get _drawerThemeData => DrawerThemeData(
        backgroundColor: _colorScheme.background,
      );

  IconThemeData get _iconThemeData => IconThemeData(
        color: _colorScheme.onPrimary,
        size: 25,
      );
  AppBarTheme get _appBarTheme => AppBarTheme(
        centerTitle: true,
        backgroundColor: _colorScheme.background,
        elevation: 0,
        iconTheme: IconThemeData(
          color: _colorScheme.onPrimary,
        ),
      );

  ColorScheme get _colorScheme => const ColorScheme(
        brightness: Brightness.dark,
        primary: Color(0xff1db954),
        onPrimary: AppColors.white, // used
        secondary: Color(0xff535353),
        onSecondary: Colors.blue,
        error: Color(0xFFF44336),
        onError: Colors.red,
        background: AppColors.background,
        onBackground: Color(0xff212121),
        surface: Color(0xffb3b3b3),
        onSurface: Color(0x00000000),
      );
}
