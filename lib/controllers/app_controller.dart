// ignore_for_file: avoid_print, non_constant_identifier_names, import_of_legacy_library_into_null_safe

import 'dart:io';

import 'package:flutter_latlong/flutter_latlong.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:location/location.dart';
import 'package:uuid/uuid.dart';

import '../constants/app_api.dart';
import '../screen/login_screen.dart';
import '../screen/main_screen.dart';
import '../util/network.dart';

class AppController extends GetConnect with Network {
  Uuid uuid = Uuid();
  Location location = Location();

  // 박스
  final GetStorage _box = GetStorage();

  // 앱 개인 정보
  String? akey;

  // 앱에서 사용하는 정보
  LatLng? appLocation;

  // 앱 시작
  appStart() async {
    // 설치
    await postRequest(AppApi.appInstall, data: {"app_install_uid": "", "push_yn": "Y", "device_type": (Platform.isAndroid) ? "02" : "03"});

    // 실행
    await postRequest(AppApi.appStart, data: {"appUid": uuid.v1(), "app_install_uid": "", "device_type": (Platform.isAndroid) ? "02" : "03"});

    // 푸시
    await postRequest(AppApi.appInstallPush, data: {"app_install_uid": uuid.v1(), "push_yn": "Y"});

    await autoLogin();
  }

  autoLogin() async {
    String? _at_fix = _box.read("at_fix");
    String? _at_mod = _box.read("at_mod");
    String? _userid = _box.read("userid");

    await postRequest(AppApi.login, data: {"userid": _userid, "password": "", "app_install_uid": "", "at_fix": _at_fix, "at_mod": _at_mod});

    // 로그인 실패
    Get.offAll(LoginScreen(), duration: Duration.zero);
  }

  // 로그인
  login(tel, password, isAuto) async {
    final _result = await postRequest(AppApi.login, data: {"userid": tel, "password": password, "app_install_uid": ""});

    if (_result['result_yne'] == 'Y') {
      // 자동 로그인
      if (isAuto) {
        _box.write("userid", tel);
        _box.write("at_fix", _result['at_fix']);
        _box.write("at_mod", _result['at_mod']);
      }

      akey = _result['akey'];
      userInfo();
    }
  }

  // 유저정보 갖고오기
  userInfo() async {
    await postRequest(AppApi.userInfo, akey: akey);
    Get.to(MainScreen());
  }

  // 위치 갖고오기
  getLocation() async {
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    LocationData _locationData;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.DENIED) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.GRANTED) {
        return;
      }
    }

    _locationData = await location.getLocation();
    appLocation = LatLng(_locationData.latitude, _locationData.longitude);
  }
}
