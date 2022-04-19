// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_latlong/flutter_latlong.dart';
import 'package:get/get.dart';
import 'package:studycube/controllers/app_controller.dart';

import '../enum/prepaid_use_type.dart';

class CenterModel {
  String uid = "";
  String centerName = "";
  String centerType = "";
  String centerPhone = "";
  String centerHp = "";
  String centerSi = "";
  String centerAddr = "";
  String centerAddrDetail = "";
  String statusCd = "";
  String centerIntro = "";
  String centerIntroHtmlYn = "";
  String centerImg1 = "";
  String centerImg2 = "";
  String centerAddrPos = "";
  String centerStartTimeYn = "";
  String centerStartTime = "";
  String centerEndTime = "";
  String kioskColor = "";
  String seatOutLimitTime = "";
  PrepaidUseType prepaidUseType = PrepaidUseType.none;
  String prepaidUseDupYn = "";
  String centerFixseatEndTime = "";
  String seatDayEndTime = "";

  CenterModel();

  CenterModel.fromJson(Map<String, dynamic> json)
      : uid = json['uid'],
        centerName = json['centerName'],
        centerType = json['centerType'],
        centerPhone = json['centerPhone'],
        centerHp = json['centerHp'],
        centerSi = json['centerSi'],
        centerAddr = json['centerAddr'],
        centerAddrDetail = json['centerAddrDetail'],
        statusCd = json['statusCd'],
        centerIntro = json['centerIntro'],
        centerIntroHtmlYn = json['centerIntroHtmlYn'],
        centerImg1 = json['centerImg1'] ?? "",
        centerImg2 = json['centerImg2'] ?? "",
        centerAddrPos = json['centerAddrPos'],
        centerStartTimeYn = json['centerStartTimeYn'],
        centerStartTime = json['centerStartTime'],
        centerEndTime = json['centerEndTime'],
        kioskColor = json['kiosk_color'] ?? "",
        seatOutLimitTime = json['seat_out_limit_time'],
        prepaidUseType = prepaidUseTypeStringToEnum(json['prepaid_use_type']),
        prepaidUseDupYn = json['prepaid_use_dup_yn'],
        centerFixseatEndTime = json['centerFixseatEndTime'] ?? "",
        seatDayEndTime = json['seatDayEndTime'] ?? "";

  String? get getDistance {
    if (centerAddrPos.isEmpty) return null;

    AppController appController = Get.find();
    Distance distance = Distance();

    num? meter;
    try {
      meter = distance(LatLng(double.parse(centerAddrPos.split("|")[0]), double.parse(centerAddrPos.split("|")[1])), appController.appLocation!);
    } catch (e) {
      return null;
    }

    if (meter == null) return "";
    if (meter < 1000) return "$meter M";
    return "${meter / 1000} Km";
  }

  List<String> get imgList {
    List<String> _reulst = [];

    if (centerImg1.isNotEmpty) _reulst.add(centerImg1);
    if (centerImg2.isNotEmpty) _reulst.add(centerImg2);

    return _reulst;
  }

  String get timeRange {
    if (centerStartTimeYn != 'Y') return "";

    String _startTimeHour = centerStartTime.substring(0, 2);
    String _startTimeMinute = centerStartTime.substring(2, 4);
    String _endTimeHour = centerEndTime.substring(0, 2);
    String _endTimeMinute = centerEndTime.substring(2, 4);

    TimeOfDay _startTime = TimeOfDay(hour: int.parse(_startTimeHour), minute: int.parse(_startTimeMinute));
    TimeOfDay _endTime =
        TimeOfDay(hour: (int.parse(_endTimeHour) > 24) ? int.parse(_endTimeHour) - 24 : int.parse(_endTimeHour), minute: int.parse(_endTimeMinute));

    String _result = (_startTime.periodOffset == 0) ? "AM ${_startTime.hour}".padLeft(2, '0') : "PM ${_startTime.hour - 12}".padLeft(2, '0');

    _result = "$_result:$_startTimeMinute";

    _result = (_endTime.periodOffset == 0) ? "$_result ~ AM ${_endTime.hour}".padLeft(2, '0') : "$_result ~ PM ${_endTime.hour - 12}".padLeft(2, '0');

    _result = "$_result:$_endTimeMinute";

    return _result;
  }
}
