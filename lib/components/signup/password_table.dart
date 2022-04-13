import 'package:flutter/material.dart';
import 'package:studycube/components/signup/signup_style.dart';

import '../../constants/app_colors.dart';
import '../common/custom_icons_icons.dart';

class PasswordTable extends StatefulWidget {
  const PasswordTable({Key? key}) : super(key: key);

  @override
  State<PasswordTable> createState() => _PasswordTableState();
}

class _PasswordTableState extends State<PasswordTable> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Table(
        columnWidths: const {
          0: IntrinsicColumnWidth(),
          1: FlexColumnWidth(),
        },
        border: TableBorder.all(color: AppColors.colorBackground, width: 1.0),
        children: [
          TableRow(
            children: [
              TableCell(
                verticalAlignment: TableCellVerticalAlignment.middle,
                child: Container(
                  width: 117,
                  padding: EdgeInsets.only(left: 15),
                  child: Text(
                    "* 비밀번호",
                    style: SignupStyle.labelStyle,
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
              TableCell(
                verticalAlignment: TableCellVerticalAlignment.middle,
                child: Container(
                  height: 58,
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: SizedBox(
                          child: TextFormField(
                            obscureText: true,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.all(0),
                              hintText: "숫자 6자리 입력",
                              hintStyle: SignupStyle.hintStyle,
                              counterText: "",
                            ),
                            keyboardType: TextInputType.number,
                            style: SignupStyle.inputStyle,
                            maxLength: 6,
                            onChanged: (val) {},
                          ),
                        ),
                      ),
                      Icon(CustomIcons.btn_checkbox_check, color: AppColors.point3, size: 21),
                    ],
                  ),
                ),
              ),
            ],
          ),
          TableRow(
            children: [
              TableCell(
                verticalAlignment: TableCellVerticalAlignment.middle,
                child: Container(
                  width: SignupStyle.labelWidth,
                  padding: EdgeInsets.only(left: 15),
                  child: Text(
                    "* 비밀번호 확인",
                    style: SignupStyle.labelStyle,
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
              TableCell(
                verticalAlignment: TableCellVerticalAlignment.middle,
                child: Container(
                  height: 58,
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: SizedBox(
                          child: TextFormField(
                            obscureText: true,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.all(0),
                              hintText: "숫자 6자리 입력",
                              hintStyle: SignupStyle.hintStyle,
                              counterText: "",
                            ),
                            keyboardType: TextInputType.number,
                            maxLength: 6,
                            style: SignupStyle.inputStyle,
                            onChanged: (val) {},
                          ),
                        ),
                      ),
                      Icon(CustomIcons.btn_checkbox_check, color: AppColors.point3, size: 21)
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
