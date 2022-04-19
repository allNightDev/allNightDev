import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/app_colors.dart';
import '../../controllers/center_controller.dart';
import '../common/custom_icons_icons.dart';

class CenterName extends StatelessWidget {
  CenterName({Key? key}) : super(key: key);

  final CenterController centerController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          left: BorderSide(width: 1, color: AppColors.white),
          right: BorderSide(width: 1, color: AppColors.white),
        ),
      ),
      height: 70,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 70,
            child: Icon(CustomIcons.btn_hart_2_copy, size: 24, color: Theme.of(context).primaryColor),
          ),
          Container(color: AppColors.white, width: 1),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 11),
              child: Text(
                centerController.centerInfo.value?.centerName ?? "",
                style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 20.0),
                textAlign: TextAlign.right,
              ),
            ),
          )
        ],
      ),
    );
  }
}
