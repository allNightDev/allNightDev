import 'package:get/get.dart';

import '../constants/app_api.dart';
import '../model/center_model.dart';
import '../util/network.dart';

class CenterController extends GetConnect with Network {
  final centerInfo = Rxn<CenterModel>();

  getCenter(uid) async {
    final _result = await postRequest(AppApi.centerInfo, data: {"uid": uid});
    centerInfo.value = CenterModel.fromJson(_result);
  }
}
