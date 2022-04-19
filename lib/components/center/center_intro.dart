import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/app_colors.dart';
import '../../controllers/center_controller.dart';
import '../common/custom_icons_icons.dart';

class CenterIntro extends StatefulWidget {
  const CenterIntro({Key? key}) : super(key: key);

  @override
  State<CenterIntro> createState() => _CenterIntroState();
}

class _CenterIntroState extends State<CenterIntro> {
  CenterController centerController = Get.find();
  bool isMore = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          left: BorderSide(width: 1, color: AppColors.white),
          right: BorderSide(width: 1, color: AppColors.white),
          bottom: BorderSide(width: 1, color: AppColors.white),
        ),
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Text(
              centerController.centerInfo.value?.centerIntro ?? "",
              maxLines: isMore ? null : 5,
              style: TextStyle(color: AppColors.browngrey, fontWeight: FontWeight.w400, fontSize: 14.0),
            ),
          ),
          Container(height: 1, color: AppColors.white),
          InkWell(
            onTap: () => setState(() => isMore = !isMore),
            child: Container(
              padding: EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    isMore ? "접기" : "더보기",
                    style: TextStyle(color: AppColors.browngrey, fontWeight: FontWeight.w700, fontSize: 12.0),
                  ),
                  RotatedBox(
                    quarterTurns: isMore ? 2 : 0,
                    child: Icon(
                      CustomIcons.btn_arrow_down,
                      color: AppColors.browngrey,
                      size: 16,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
