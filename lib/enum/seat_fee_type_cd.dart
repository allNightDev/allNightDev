enum SeatFeeTypeCd {
  time,
  day,
  etc,
  none,
}

extension SeatFeeTypeCdX on SeatFeeTypeCd {
  String get enumToCd {
    switch (this) {
      case SeatFeeTypeCd.time:
        return "01";
      case SeatFeeTypeCd.day:
        return "02";
      case SeatFeeTypeCd.etc:
        return "03";
      default:
        return "";
    }
  }
}

SeatFeeTypeCd seatFeeTypeCdToEnum(value) {
  switch (value) {
    case "01":
      return SeatFeeTypeCd.time;
    case "02":
      return SeatFeeTypeCd.day;
    case "03":
      return SeatFeeTypeCd.etc;
    default:
      return SeatFeeTypeCd.none;
  }
}
