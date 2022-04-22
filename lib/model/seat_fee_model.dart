import '../enum/buy_type.dart';
import '../enum/prepaid_fee_seat_fee_type_cd.dart';
import '../enum/prepaid_fee_status_cd.dart';
import '../enum/seat_fee_status_cd.dart';
import '../enum/seat_fee_type_cd.dart';
import '../enum/seat_type_cd.dart';

class SeatFeeModel {
  String odSeatFeeUid = "";
  SeatTypeCd? seatTypeCd;
  SeatFeeTypeCd? seatFeeTypeCd;
  String seatTitle = "";
  int seatTime = 0;
  String seatName = "";
  String seatFee = "";
  String seatFeeName = "";
  String limitTime = "";
  SeatFeeStatusCd? seatFeeStatusCd;
  String prepaidFee = "";
  PrepaidFeeSeatFeeTypeCd? prepaidFeeSeatFeeTypeCd;
  PrepaidFeeStatusCd? prepaidFeeStatusCd;
  int discountRate = 0;
  int discountFee = 0;
  BuyType? buyType;

  SeatFeeModel();

  SeatFeeModel.fromJson(Map<String, dynamic> json)
      : odSeatFeeUid = json['od_seat_fee_uid'],
        seatTypeCd = seatTypeCdToEnum(json['seat_type_cd'] ?? ""),
        seatFeeTypeCd = seatFeeTypeCdToEnum(json['seat_fee_type_cd'] ?? ""),
        seatTitle = json['seat_title'],
        seatTime = int.parse(json['seat_time']),
        seatName = json['seat_name'],
        seatFee = json['seat_fee'],
        seatFeeName = json['seat_fee_name'],
        limitTime = json['Limit_time'],
        seatFeeStatusCd = seatFeeStatusCdToEnum(json['seat_fee_status_cd']),
        prepaidFee = json['prepaidFee'],
        prepaidFeeSeatFeeTypeCd = prepaidFeeSeatFeeTypeCdToEnum(json['prepaid_fee_seat_fee_type_cd']),
        prepaidFeeStatusCd = prepaidFeeStatusCdToEnum(json['prepaid_fee_status_cd']),
        discountRate = json['discountRate'],
        discountFee = json['discountFee'],
        buyType = buyTypeToEnum(json['buyType']);
}
