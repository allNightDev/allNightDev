import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

enum SeatStatus {
  enable,
  book,
  disable,
  end,
  other,
}

extension SeatStatusX on SeatStatus {
  String get enumToString {
    switch (this) {
      case SeatStatus.enable:
        return "이용가능";
      case SeatStatus.book:
        return "예약석";
      case SeatStatus.disable:
        return "이용불가";
      case SeatStatus.end:
        return "종료예정";
      case SeatStatus.other:
        return "다른타입좌석";
      default:
        return "";
    }
  }

  Widget get enumToWidget {
    switch (this) {
      case SeatStatus.enable:
        return Container(width: 15, height: 15, decoration: BoxDecoration(border: Border.all(width: 2, color: AppColors.point1)));
      case SeatStatus.book:
        return Container(width: 15, height: 15, decoration: BoxDecoration(border: Border.all(width: 2, color: Colors.black)));
      case SeatStatus.disable:
        return Container(width: 15, height: 15, decoration: BoxDecoration(border: Border.all(width: 2, color: Colors.black), color: Colors.black));
      case SeatStatus.end:
        return Container(
            width: 15, height: 15, decoration: BoxDecoration(border: Border.all(width: 2, color: AppColors.point3), color: AppColors.point3));
      case SeatStatus.other:
        return Container(
            width: 15,
            height: 15,
            decoration: BoxDecoration(border: Border.all(width: 2, color: AppColors.veryLightGrey), color: AppColors.veryLightGrey));
      default:
        return SizedBox();
    }
  }
}

SeatStatus seatStatusToEnum(value) {
  switch (value) {
    case "31":
      return SeatStatus.enable;
    case "32":
      return SeatStatus.book;
    case "33":
      return SeatStatus.disable;
    case "34":
      return SeatStatus.end;
    default:
      return SeatStatus.other;
  }
}
