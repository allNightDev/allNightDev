import 'package:studycube/controllers/center_controller.dart';

import '../constants/app_api.dart';
import '../enum/seat_type_cd.dart';
import '../model/seat_fee_model.dart';
import '../model/seat_map_model.dart';
import '../model/seat_type_model.dart';
import '../util/network.dart';
import 'package:get/get.dart';

class SeatBookController extends GetConnect with Network {
  final seatMap = Rxn<SeatMapModel>();
  final types = <SeatTypeModel>[].obs;
  final fees = <SeatFeeModel>[].obs;

  final selectedSeatType = Rxn<SeatTypeModel>();
  final selectedSeatFee = Rxn<SeatFeeModel>();

  @override
  void onInit() {
    selectedSeatType.listen((value) {
      if (value != null) getSeatFee();
    });
    super.onInit();
  }

  // 타입 불러오기
  getSeatTypes() async {
    CenterController centerController = Get.find();

    final _result = await postRequest(
      AppApi.selectOdSeatTypeUseListMo,
      data: {"od_center_uid": centerController.centerInfo.value!.uid, "seat_type_cd": "01", "pageNo": 100, "listPerPage": 0},
    );

    types.value = _result['result_list'].map<SeatTypeModel>((_item) => SeatTypeModel.fromJson(_item)).toList();
  }

  // 요금 조회
  getSeatFee() async {
    CenterController centerController = Get.find();
    final _result = await postRequest(
      AppApi.selectOdSeatFeeAllListMo,
      data: {
        "od_center_uid": centerController.centerInfo.value!.uid,
        "seat_type_cd": selectedSeatType.value!.seatTypeCd.enumToCd,
        "seat_fee_type_cd": "",
        "buy_type": "01",
      },
    );

    fees.value = _result['result_list'].map<SeatFeeModel>((_item) => SeatFeeModel.fromJson(_item)).toList();
  }

  getSeatList() async {
    final _result = await postRequest(
      AppApi.selectOdSeatStatMo,
      data: {
        "od_center_uid": "OCE_210226174405979_1294",
        "use_date": "202204211200",
        "use_end_date": "202204211400",
        "seat_time": "2",
        "od_seat_type_uid": "OSP_210226174423897_4690",
      },
    );

    seatMap.value = SeatMapModel.fromJson(_result);
  }
}
