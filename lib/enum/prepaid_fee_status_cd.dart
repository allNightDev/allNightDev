enum PrepaidFeeStatusCd {
  able,
  disable,
  none,
}

extension PrepaidFeeStatusCdX on PrepaidFeeStatusCd {
  String get enumToString {
    switch (this) {
      case PrepaidFeeStatusCd.able:
        return "01";
      case PrepaidFeeStatusCd.disable:
        return "02";
      default:
        return "";
    }
  }
}

PrepaidFeeStatusCd prepaidFeeStatusCdToEnum(value) {
  switch (value) {
    case "01":
      return PrepaidFeeStatusCd.able;
    case "02":
      return PrepaidFeeStatusCd.disable;
    default:
      return PrepaidFeeStatusCd.none;
  }
}
