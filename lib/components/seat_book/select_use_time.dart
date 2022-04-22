import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studycube/components/seat_book/max_time.dart';

import '../../constants/app_colors.dart';
import '../../controllers/seat_book_controller.dart';
import '../common/app_check_box.dart';
import '../common/circle_check_box.dart';

class SelectUseTime extends StatefulWidget {
  const SelectUseTime({Key? key}) : super(key: key);

  @override
  State<SelectUseTime> createState() => _SelectUseTimeState();
}

class _SelectUseTimeState extends State<SelectUseTime> {
  SeatBookController seatBookController = Get.find();
  bool usePackage = false;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        margin: EdgeInsets.only(bottom: 25),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 20),
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("2. 사용시간", style: TextStyle(color: AppColors.veryLightGrey, fontWeight: FontWeight.w700, fontSize: 14.0)),
                  Row(
                    children: [
                      Text("시간패키지로 결제", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w400, fontSize: 14.0)),
                      SizedBox(width: 10),
                      IntrinsicWidth(
                        child: AppCheckBox(
                          check: usePackage,
                          onChange: () => setState(() => usePackage = !usePackage),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Container(
              color: Colors.white,
              child: Table(
                border: TableBorder.all(color: AppColors.white, width: 1.0),
                children: seatBookController.fees
                    .map(
                      (_item) => TableRow(
                        children: [
                          InkWell(
                            onTap: () => seatBookController.selectedSeatFee.value = _item,
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 18),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(_item.seatFeeName, style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700, fontSize: 20.0)),
                                  Row(
                                    children: [
                                      Text(
                                        _item.seatFee,
                                        style: TextStyle(color: AppColors.browngrey, fontWeight: FontWeight.w400, fontSize: 12.0),
                                      ),
                                      SizedBox(width: 10),
                                      CircleCheckBox(check: seatBookController.selectedSeatFee.value == _item),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                    .toList(),
              ),
            ),
            if (usePackage) MaxTime(),
          ],
        ),
      ),
    );
  }
}
