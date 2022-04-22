import '../enum/seat_fee_type_cd.dart';
import '../enum/seat_status.dart';

class SeatModel {
  String uid = "";
  String seatName = "";
  int? x;
  int? y;
  int width = 0;
  int height = 0;
  SeatStatus status = SeatStatus.other;
  int seatUseRemainMin = 0;
  SeatFeeTypeCd seatFeeTypeCd = SeatFeeTypeCd.none;

  SeatModel.fromJson(Map<String, dynamic> json)
      : uid = json['uid'] ?? "",
        seatName = json['seat_name'] ?? "",
        x = (json['x'] == null) ? null : int.parse(json['x']),
        y = (json['y'] == null) ? null : int.parse(json['y']),
        width = int.parse(json['width'] ?? '0'),
        height = int.parse(json['width'] ?? '0'),
        status = seatStatusToEnum(json['status']),
        seatUseRemainMin = int.parse(json['seat_use_remain_min'] ?? '0'),
        seatFeeTypeCd = seatFeeTypeCdToEnum(json['seat_fee_type_cd']);
}
