import 'package:flutter/material.dart';

import '../../constants/app_colors.dart';

class SignupStyle {
  // style
  static double labelWidth = 117.0;
  static TextStyle labelStyle = TextStyle(
    color: AppColors.point3,
    fontWeight: FontWeight.w700,
    fontFamily: "NotoSansCJKkr",
    fontStyle: FontStyle.normal,
    fontSize: 14.0,
  );

  static TextStyle inputStyle = TextStyle(
    fontWeight: FontWeight.w700,
    fontFamily: "NotoSansCJKkr",
    fontSize: 14.0,
  );

  static TextStyle hintStyle = TextStyle(
    color: AppColors.veryLightGrey,
    fontWeight: FontWeight.w700,
    fontFamily: "NotoSansCJKkr",
    fontStyle: FontStyle.normal,
    fontSize: 14.0,
  );

  static TableBorder tableBorder = TableBorder(
    top: BorderSide(color: AppColors.colorBackground, width: 1.0),
    bottom: BorderSide(color: AppColors.colorBackground, width: 1.0),
    left: BorderSide(color: AppColors.colorBackground, width: 1.0),
    right: BorderSide(color: AppColors.colorBackground, width: 1.0),
    horizontalInside: BorderSide(color: AppColors.colorBackground, width: 1.0),
    verticalInside: BorderSide(color: AppColors.colorBackground, width: 1.0),
  );
}
