import 'package:dotted_decoration/dotted_decoration.dart';
import 'package:flutter/material.dart';

import '../../constants/app_colors.dart';
import '../common/circle_check_box.dart';
import '../common/custom_icons_icons.dart';

class MaxTime extends StatefulWidget {
  const MaxTime({Key? key}) : super(key: key);

  @override
  State<MaxTime> createState() => _MaxTimeState();
}

class _MaxTimeState extends State<MaxTime> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          left: BorderSide(width: 1, color: AppColors.white),
          right: BorderSide(width: 1, color: AppColors.white),
          bottom: BorderSide(width: 1, color: AppColors.white),
        ),
        color: Colors.white,
      ),
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("최대시간", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700, fontSize: 20.0)),
                Row(
                  children: [
                    Text("6시간 3분", style: TextStyle(color: AppColors.point3, fontWeight: FontWeight.w700, fontSize: 12.0)),
                    SizedBox(width: 10),
                    CircleCheckBox(check: true),
                  ],
                ),
              ],
            ),
          ),
          Container(height: 1, color: AppColors.white),
          Builder(builder: (context) {
            // 운영시간 text
            String _useTimeRange = """센터 운영시간  
05:00 ~ 23:00""";

            TextStyle _nonSelectStyle = TextStyle(color: AppColors.browngrey, fontWeight: FontWeight.w400, fontSize: 12.0);

            return Container(
              padding: EdgeInsets.fromLTRB(0, 16, 9, 10),
              decoration: DottedDecoration(
                shape: Shape.line,
                linePosition: LinePosition.bottom,
                color: Theme.of(context).dividerColor,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(_useTimeRange, style: TextStyle(color: AppColors.browngrey, fontWeight: FontWeight.w700, fontSize: 12.0)),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(CustomIcons.btn_checkbox_check_1, color: AppColors.veryLightGrey, size: 18),
                          Text("시간패키지 보유시간 : 103시간 27분", style: _nonSelectStyle)
                        ],
                      ),
                      Row(
                        children: [
                          Icon(CustomIcons.btn_checkbox_check_1, color: AppColors.veryLightGrey, size: 18),
                          Text("센터 지정 최대 시간 : 24시간", style: _nonSelectStyle)
                        ],
                      ),
                      Row(
                        children: [
                          Icon(CustomIcons.btn_checkbox_check_1, color: AppColors.point3, size: 18),
                          RichText(
                            text: TextSpan(
                              style: _nonSelectStyle,
                              children: [
                                TextSpan(text: "센터 종료까지 남은 시간 : ", style: TextStyle(fontWeight: FontWeight.w700)),
                                TextSpan(text: "6시간 3분", style: TextStyle(fontWeight: FontWeight.w700, color: AppColors.point3)),
                              ],
                            ),
                          )
                        ],
                      )
                    ],
                  )
                ],
              ),
            );
          }),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 9, 0, 14),
            child: Text(
              "최대시간은 이용가능 시간 중 최소 시간으로 적용되며, 예약석의 경우 최대시간보다 예약 시작 시간이 우선적으로 적용됩니다.",
              style: TextStyle(color: AppColors.browngrey, fontWeight: FontWeight.w400, fontSize: 12.0),
            ),
          ),
        ],
      ),
    );
  }
}
