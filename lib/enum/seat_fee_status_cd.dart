enum SeatFeeStatusCd {
  able,
  disable,
  none,
}

extension SeatFeeStatusCdX on SeatFeeStatusCd {
  String get enumToString {
    switch (this) {
      case SeatFeeStatusCd.able:
        return "01";
      case SeatFeeStatusCd.disable:
        return "02";
      default:
        return "";
    }
  }
}

SeatFeeStatusCd seatFeeStatusCdToEnum(value) {
  switch (value) {
    case "01":
      return SeatFeeStatusCd.able;
    case "02":
      return SeatFeeStatusCd.disable;
    default:
      return SeatFeeStatusCd.none;
  }
}
