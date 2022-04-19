import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/app_colors.dart';
import '../../controllers/center_controller.dart';
import '../common/custom_icons_icons.dart';

class CenterBasicInfo extends StatefulWidget {
  const CenterBasicInfo({Key? key}) : super(key: key);

  @override
  State<CenterBasicInfo> createState() => _CenterBasicInfoState();
}

class _CenterBasicInfoState extends State<CenterBasicInfo> {
  CenterController centerController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(border: Border.all(width: 1, color: AppColors.white)),
      child: Column(
        children: [
          SizedBox(
            height: 46,
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: 13),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(CustomIcons.icon_adress, size: 24, color: AppColors.point1),
                        Expanded(
                          child: Text(
                            centerController.centerInfo.value?.centerAddr ?? "",
                            style: TextStyle(color: AppColors.browngrey, fontWeight: FontWeight.w400, fontSize: 11.0),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(width: 1, color: AppColors.white),
                SizedBox(
                  width: 92,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(child: Icon(CustomIcons.btn_copy, color: Theme.of(context).primaryColor)),
                      Container(width: 1, color: AppColors.white),
                      Expanded(child: Icon(CustomIcons.btn_share, color: Theme.of(context).primaryColor)),
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(height: 1, color: AppColors.white),
          SizedBox(
            height: 46,
            child: Row(
              children: [
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 9.7),
                        child: Row(
                          children: [
                            Icon(CustomIcons.icon_tel, size: 24, color: AppColors.point1),
                            Text(
                              centerController.centerInfo.value?.centerPhone ?? "",
                              style: TextStyle(color: AppColors.browngrey, fontWeight: FontWeight.w400, fontSize: 11.0),
                            )
                          ],
                        ),
                      ),
                      Container(width: 1, color: AppColors.white),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(CustomIcons.icon_open_close_time, size: 24, color: AppColors.point1),
                            Text(
                              centerController.centerInfo.value?.timeRange ?? "",
                              style: TextStyle(color: AppColors.browngrey, fontWeight: FontWeight.w400, fontSize: 11.0),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(width: 1, color: AppColors.white),
                SizedBox(
                  width: 92,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(CustomIcons.icon_fee, size: 24, color: AppColors.point1),
                      Text(
                        "요금안내",
                        style: TextStyle(color: AppColors.browngrey, fontWeight: FontWeight.w400, fontSize: 11.0),
                      )
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
