enum PrepaidFeeSeatFeeTypeCd {
  hour,
  minute,
  none,
}

extension PrepaidFeeSeatFeeTypeCdX on PrepaidFeeSeatFeeTypeCd {
  String get enumToString {
    switch (this) {
      case PrepaidFeeSeatFeeTypeCd.hour:
        return "01";
      case PrepaidFeeSeatFeeTypeCd.minute:
        return "04";
      default:
        return "";
    }
  }
}

PrepaidFeeSeatFeeTypeCd prepaidFeeSeatFeeTypeCdToEnum(value) {
  switch (value) {
    case "01":
      return PrepaidFeeSeatFeeTypeCd.hour;
    case "04":
      return PrepaidFeeSeatFeeTypeCd.minute;
    default:
      return PrepaidFeeSeatFeeTypeCd.none;
  }
}
