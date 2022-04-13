// ignore_for_file: avoid_print, duplicate_ignore, avoid_init_to_null

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:encrypt/encrypt.dart';
import 'package:intl/intl.dart';
import 'dart:io' show Platform;

import '../constants/app_constants.dart';
import '../env/env.dart';

class Network {
  final Dio _dio = Dio(BaseOptions(baseUrl: Env.baseUrl));

  // 로그인 후
  Key? loginKey;

  // 기본 iv
  IV iv = IV.fromUtf8("1234567802070106");

  // 기본 데이터
  final Map<String, dynamic> _initData = {
    "at": "",
    "pUid": "",
    "ver": "2.0.0.1",
    "mUid": "",
    "type": (Platform.isAndroid) ? "21" : "22",
    "from": "M",
  };

  // 요청
  postRequest(url, {Map<String, dynamic>? data, akey = null}) async {
    // 기본정보
    Map<String, dynamic> _requestData = Map.from(_initData);

    // 날짜
    _requestData["timeStamp"] = DateFormat('yyyyMMddHHmmss').format(DateTime.now());

    // 암호화
    Encrypter encrypter = Encrypter(AES(Key.fromUtf8(akey ?? AppConstants.akey), mode: AESMode.cbc, padding: 'PKCS7'));

    // 요청전 데이터 만들기
    if (data != null) data.forEach((key, value) => _requestData[key] = value);

    // 요청데이터 암호화
    Encrypted encrypted = encrypter.encrypt(jsonEncode(_requestData).toString(), iv: iv);

    // 요청
    Response response = await _dio.post(url, queryParameters: {"data": encrypted.base64, "cid": "LOCAL"});

    if (response.statusCode == 200) {
      final resData = jsonDecode(response.data)['data'];

      // 응담데이터 복호화
      final decrypted = encrypter.decrypt64(resData, iv: iv);

      return jsonDecode(decrypted);
    } else {
      print(response.statusCode);
      print(response.statusMessage);
      return null;
    }
  }
}
