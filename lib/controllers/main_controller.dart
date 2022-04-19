// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studycube/controllers/app_controller.dart';

import '../constants/app_api.dart';
import '../model/banner_model.dart';
import '../model/center_model.dart';
import '../model/filter_model.dart';
import '../util/network.dart';

class MainController extends GetConnect with Network {
  AppController appController = Get.find();

  final centers = <CenterModel>[].obs;
  final banners = <BannerModel>[].obs;
  final sorting = FilterModel().obs;

  @override
  void onInit() {
    super.onInit();
    _getBanner();
    getCenters();
  }

  _getBanner() {
    List.generate(
      4,
      (index) => banners.add(
        BannerModel("https://via.placeholder.com/500", Image(image: AssetImage('assets/images/box_main_event.png'), fit: BoxFit.fitWidth)),
      ),
    );
  }

  // 센터 갖고오기
  getCenters() async {
    final _data = {"listPerPage": 10, "pageNo": 1, "searchCenterTypeCd": "01", "orderBySort": "ASC", "orderBy": ""};

    final _result = await postRequest(AppApi.centerList, data: _data);
    centers.addAll(_result['result_list'].map<CenterModel>((_item) => CenterModel.fromJson(_item)).toList());
  }
}
