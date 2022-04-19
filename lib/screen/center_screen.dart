import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../components/center/center_banner.dart';
import '../components/center/center_basic_info.dart';
import '../components/center/center_intro.dart';
import '../components/center/center_map.dart';
import '../components/center/center_name.dart';
import '../components/common/app_bar_actions.dart';
import '../components/common/custom_icons_icons.dart';
import '../controllers/center_controller.dart';

class CenterScreen extends StatefulWidget {
  final String centerUid;
  const CenterScreen({Key? key, required this.centerUid}) : super(key: key);

  @override
  State<CenterScreen> createState() => _CenterScreenState();
}

class _CenterScreenState extends State<CenterScreen> {
  CenterController centerController = Get.put(CenterController());

  @override
  void initState() {
    centerController.getCenter(widget.centerUid);
    super.initState();
  }

  @override
  void dispose() {
    centerController.onClose();
    super.dispose();
  }

  bool isMore = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () => Get.back(), icon: Icon(CustomIcons.btn_back_arrow_bold)),
        actions: const [AppBarActions()],
        centerTitle: false,
      ),
      body: Obx(
        () => SafeArea(
          child: centerController.centerInfo.value == null
              ? Center(child: CircularProgressIndicator())
              : SingleChildScrollView(
                  physics: ClampingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                        margin: EdgeInsets.all(7),
                        color: Colors.white,
                        child: Column(
                          children: [
                            CenterBanner(),
                            CenterName(),
                            CenterBasicInfo(),
                            CenterIntro(),
                          ],
                        ),
                      ),
                      CenterMap(),
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
