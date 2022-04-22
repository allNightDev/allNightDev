import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/app_colors.dart';
import '../../controllers/center_controller.dart';
import '../../controllers/seat_book_controller.dart';
import '../common/circle_check_box.dart';

class SelectSeatType extends StatefulWidget {
  const SelectSeatType({Key? key}) : super(key: key);

  @override
  State<SelectSeatType> createState() => _SelectSeatTypeState();
}

class _SelectSeatTypeState extends State<SelectSeatType> {
  SeatBookController seatBookController = Get.find();
  CenterController centerController = Get.find();

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
                  Text("1. 좌석타입", style: TextStyle(color: AppColors.veryLightGrey, fontWeight: FontWeight.w700, fontSize: 14.0)),
                  Text(
                    centerController.centerInfo.value!.centerName,
                    style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700, fontSize: 14.0),
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.white,
              child: Table(
                border: TableBorder.all(color: AppColors.white, width: 1.0),
                children: seatBookController.types
                    .map(
                      (_item) => TableRow(
                        children: [
                          InkWell(
                            onTap: () => seatBookController.selectedSeatType.value = _item,
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 18),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(_item.seatTitle, style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700, fontSize: 20.0)),
                                  Row(
                                    children: [
                                      Text(
                                        "1석/100석",
                                        style: TextStyle(color: AppColors.browngrey, fontWeight: FontWeight.w400, fontSize: 12.0),
                                      ),
                                      SizedBox(width: 10),
                                      CircleCheckBox(check: seatBookController.selectedSeatType.value == _item),
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
            )
          ],
        ),
      ),
    );
  }
}
