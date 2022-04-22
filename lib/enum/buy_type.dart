enum BuyType {
  standard,
  extension,
  none,
}

extension BuyTypeX on BuyType {
  String get enumToCd {
    switch (this) {
      case BuyType.standard:
        return "01";
      case BuyType.extension:
        return "02";
      default:
        return "";
    }
  }
}

BuyType buyTypeToEnum(value) {
  switch (value) {
    case "01":
      return BuyType.standard;
    case "02":
      return BuyType.extension;
    default:
      return BuyType.standard;
  }
}
