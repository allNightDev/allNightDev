// ignore_for_file: prefer_conditional_assignment, unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

import '../constants/app_constants.dart';
import '../main.dart';
import '../types/build_type.dart';
import '../util/injection.dart';

class Env {
  static Env? _instance;
  static Env get instance => _instance!;
  final BuildType _buildType;
  static BuildType get buildType => instance._buildType;
  const Env._internal(this._buildType);

  factory Env.newInstance(BuildType buildType) {
    assert(buildType != null);

    if (_instance == null) _instance = Env._internal(buildType);

    return _instance!;
  }

  // 환경변수별 값
  bool get isDebuggle => buildType == BuildType.development;
  static String get baseUrl => buildType == BuildType.development ? AppConstants.devBaseUrl : AppConstants.baseUrl;

  // 앱 실행
  Future<void> run() async {
    WidgetsFlutterBinding.ensureInitialized();
    await GetStorage.init();
    await configureDependencies();
    runApp(MyApp());
  }
}
