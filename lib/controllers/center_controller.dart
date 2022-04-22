import 'package:get/get.dart';

import '../constants/app_api.dart';
import '../enum/buy_type.dart';
import '../enum/seat_fee_type_cd.dart';
import '../enum/seat_type_cd.dart';
import '../model/center_model.dart';
import '../model/seat_fee_model.dart';
import '../util/network.dart';

class CenterController extends GetConnect with Network {
  final centerInfo = Rxn<CenterModel>();
  final centerFeeList = <SeatFeeModel>[].obs;
  final centerFeeLoading = false.obs;

  getCenter(uid) async {
    final _result = await postRequest(AppApi.centerInfo, data: {"uid": uid});
    _result['uid'] = uid;

    centerInfo.value = CenterModel.fromJson(_result);
  }

  // 요금 표
  getFeeTable() async {
    centerFeeLoading.value = true;
    centerFeeList.clear();

    // 기본 요금표
    await Future.wait([
      getTimeFeeTable(BuyType.standard),
      getDayFeeTable(BuyType.standard),
      getPackageFeeTable(BuyType.standard),
      getTimeFeeTable(BuyType.extension),
      getDayFeeTable(BuyType.extension),
      getPackageFeeTable(BuyType.extension),
    ]);

    centerFeeLoading.value = false;
  }

  // 자유석 요금제 갖고오기
  Future getTimeFeeTable(BuyType buyType) async {
    final _reulst = await postRequest(AppApi.selectOdSeatFeeAllListMo, data: {
      "od_center_uid": centerInfo.value!.uid,
      "buy_type": buyType.enumToCd,
      "seat_type_cd": SeatTypeCd.seat.enumToCd,
      "seat_fee_type_cd": SeatFeeTypeCd.time.enumToCd,
    });

    List<SeatFeeModel> _items = (_reulst['result_list'] ?? []).map<SeatFeeModel>((_item) => SeatFeeModel.fromJson(_item)).toList();
    centerFeeList.addAll(_items);
  }

  // 고정석 요금제 갖고오기
  Future getDayFeeTable(BuyType buyType) async {
    final _reulst = await postRequest(AppApi.selectOdSeatFeeAllListMo, data: {
      "od_center_uid": centerInfo.value!.uid,
      "buy_type": buyType.enumToCd,
      "seat_type_cd": SeatTypeCd.seat.enumToCd,
      "seat_fee_type_cd": SeatFeeTypeCd.day.enumToCd,
    });

    List<SeatFeeModel> _items = (_reulst['result_list'] ?? []).map<SeatFeeModel>((_item) => SeatFeeModel.fromJson(_item)).toList();
    centerFeeList.addAll(_items);
  }

  // 시간 패키지 갖고오기
  Future getPackageFeeTable(BuyType buyType) async {
    final _reulst = await postRequest(AppApi.selectOdSeatFeeAllListMo, data: {
      "od_center_uid": centerInfo.value!.uid,
      "buy_type": buyType.enumToCd,
      "seat_type_cd": SeatTypeCd.package.enumToCd,
      "seat_fee_type_cd": "",
    });

    List<SeatFeeModel> _items = (_reulst['result_list'] ?? []).map<SeatFeeModel>((_item) => SeatFeeModel.fromJson(_item)).toList();
    centerFeeList.addAll(_items);
  }
}
