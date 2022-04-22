import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constants/app_colors.dart';
import '../common/app_check_box.dart';

class SelectStartTime extends StatefulWidget {
  const SelectStartTime({Key? key}) : super(key: key);

  @override
  State<SelectStartTime> createState() => _SelectStartTimeState();
}

class _SelectStartTimeState extends State<SelectStartTime> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 25),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 20),
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("3. 시작시점", style: TextStyle(color: AppColors.veryLightGrey, fontWeight: FontWeight.w700, fontSize: 14.0)),
                Row(
                  children: [
                    Text("지금 바로 이용", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w400, fontSize: 14.0)),
                    SizedBox(width: 10),
                    IntrinsicWidth(
                      child: AppCheckBox(
                        onChange: () {},
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(color: Colors.white, border: Border.all(color: AppColors.white)),
            child: AspectRatio(
              aspectRatio: 398 / 234,
              child: CupertinoDatePicker(
                minimumYear: 1900,
                maximumYear: 2023,
                onDateTimeChanged: (value) {},
                initialDateTime: DateTime.now(),
                mode: CupertinoDatePickerMode.date,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
