final class PNGConstants {
  PNGConstants._init();
  static PNGConstants? _instace;

  static PNGConstants get instance => _instace ??= PNGConstants._init();

  String toPNG(String name) => 'assets/png/$name.png';

  String get adGroup => toPNG('ad_group');
  String get asset => toPNG('asset');
  String get fioLogo => toPNG('fio_logo');
  String get headphone => toPNG('headphone');
}
