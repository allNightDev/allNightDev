enum SeatTypeCd {
  seat,
  locker,
  package,
  none,
}

extension SeatTypeCdX on SeatTypeCd {
  String get enumToCd {
    switch (this) {
      case SeatTypeCd.seat:
        return "01";
      case SeatTypeCd.locker:
        return "02";
      case SeatTypeCd.package:
        return "03";
      default:
        return "";
    }
  }
}

SeatTypeCd seatTypeCdToEnum(value) {
  switch (value) {
    case "01":
      return SeatTypeCd.seat;
    case "02":
      return SeatTypeCd.locker;
    case "03":
      return SeatTypeCd.package;
    default:
      return SeatTypeCd.none;
  }
}
