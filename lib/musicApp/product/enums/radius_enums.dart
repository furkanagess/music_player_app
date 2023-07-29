enum RadiusEnum {
  low,
  high,
}

extension RadiusExtension on RadiusEnum {
  double? get name {
    switch (this) {
      case RadiusEnum.low:
        return 10;
      case RadiusEnum.high:
        return 20;
    }
  }
}
