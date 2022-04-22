import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/app_colors.dart';
import '../../controllers/center_controller.dart';

class PriceTable extends StatefulWidget {
  const PriceTable({Key? key}) : super(key: key);

  @override
  _PriceTableState createState() => _PriceTableState();
}

class _PriceTableState extends State<PriceTable> {
  CenterController centerController = Get.find();

  @override
  void initState() {
    centerController.getFeeTable();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(border: Border.all(width: 1.0, color: AppColors.white)),
      child: Container(),
    );
  }
}
