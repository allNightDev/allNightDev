import 'package:flutter/material.dart';

import '../../constants/app_colors.dart';
import '../common/custom_icons_icons.dart';

class AppCheckBox extends StatelessWidget {
  final Function()? onChange;
  final bool check;

  const AppCheckBox({Key? key, this.onChange, this.check = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onChange,
      child: Container(
        width: 18.0,
        height: 18.0,
        decoration: BoxDecoration(border: Border.all(width: 1.0, color: Theme.of(context).dividerColor)),
        child: check ? Center(child: Icon(CustomIcons.btn_checkbox_check, color: AppColors.point3, size: 17.0)) : SizedBox(),
      ),
    );
  }
}
