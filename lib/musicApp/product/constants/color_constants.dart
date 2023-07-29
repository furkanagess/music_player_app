import 'package:flutter/material.dart';

@immutable
final class AppColors {
  Color get purple => const Color(0xff6e4bf5);
  Color get pink => const Color(0xffea489f);
  Color get orange => const Color(0xfff5735f);
  Color get yellow => const Color(0xfffdd776);
  Color get white => Colors.white;
  Color get background => const Color(0xff0e0e14);
  Color get transparentWhite => const Color.fromARGB(20, 255, 255, 255);
  Color get lightWhite => const Color.fromARGB(50, 255, 255, 255);
  Color get darkBlue => const Color.fromARGB(255, 34, 34, 49);
}
