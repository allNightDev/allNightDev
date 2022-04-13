// ignore_for_file: avoid_print

import 'package:get/get.dart';

import '../constants/app_api.dart';
import '../screen/login_screen.dart';
import '../util/network.dart';

class AppController extends GetConnect with Network {
  String? akey;

  autoLogin() {
    Get.offAll(LoginScreen(), duration: Duration.zero);
  }

  // 로그인
  login(tel, password) async {
    final _result = await postRequest(AppApi.login, data: {"userid": tel, "password": password, "app_install_uid": ""});

    if (_result['result_yne'] == 'Y') {
      akey = _result['akey'];
      userInfo();
    }
  }

  // 유저정보 갖고오기
  userInfo() async {
    final _result = await postRequest(AppApi.userInfo, akey: akey);
    print(_result);
  }
}
