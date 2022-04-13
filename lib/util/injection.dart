import 'package:get/get.dart';

import '../controllers/app_controller.dart';
import '../controllers/main_controller.dart';

Future<void> configureDependencies() async {
  Get.lazyPut(() => AppController());
  Get.lazyPut(() => MainController());
}
