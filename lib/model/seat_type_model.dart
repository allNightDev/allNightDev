import '../enum/seat_type_cd.dart';

class SeatTypeModel {
  String uid = "";
  String odSeatTypeUid = "";
  String seatTitle = "";
  SeatTypeCd seatTypeCd = SeatTypeCd.none;

  SeatTypeModel.fromJson(Map<String, dynamic> json)
      : uid = json['uid'] ?? "",
        odSeatTypeUid = json['od_seat_type_uid'] ?? "",
        seatTitle = json['seat_title'] ?? "",
        seatTypeCd = seatTypeCdToEnum(json['seat_type_cd']);
}
