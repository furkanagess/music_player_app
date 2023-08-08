import 'package:flutter/material.dart';

@immutable
final class PNGConstants {
  const PNGConstants._init();

  static final String adGroup2 = 'ad_group'.toPng;
  static final String asset = 'asset'.toPng;
  static final String fioLogo = 'fio_logo'.toPng;
  static final String headphone = 'headphone'.toPng;
}

extension on String {
  String get toPng => 'assets/png/$this.png';
}
