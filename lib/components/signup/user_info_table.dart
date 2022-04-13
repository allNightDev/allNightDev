import 'package:flutter/material.dart';
import 'package:studycube/components/signup/signup_style.dart';

import '../../constants/app_colors.dart';
import '../common/circle_check_box.dart';

class UserInfoTable extends StatefulWidget {
  const UserInfoTable({Key? key}) : super(key: key);

  @override
  State<UserInfoTable> createState() => _UserInfoTableState();
}

class _UserInfoTableState extends State<UserInfoTable> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Table(
        columnWidths: const {
          0: IntrinsicColumnWidth(),
          1: FlexColumnWidth(),
        },
        border: SignupStyle.tableBorder,
        children: [
          TableRow(children: [
            TableCell(
              verticalAlignment: TableCellVerticalAlignment.middle,
              child: Container(
                width: SignupStyle.labelWidth,
                padding: EdgeInsets.only(left: 15),
                child: Text(
                  "사용자 이름",
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
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.all(0),
                              hintText: "홍길동",
                              hintStyle: SignupStyle.hintStyle,
                            ),
                            style: SignupStyle.inputStyle,
                            onChanged: (val) {},
                          ),
                        ),
                      )
                    ],
                  ),
                )),
          ]),
          TableRow(
            children: [
              TableCell(
                verticalAlignment: TableCellVerticalAlignment.middle,
                child: Container(
                  width: SignupStyle.labelWidth,
                  padding: EdgeInsets.only(left: 15),
                  child: Text(
                    "생년월일",
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
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.all(0),
                              hintText: "YYYYMMDD",
                              hintStyle: SignupStyle.hintStyle,
                              counterText: "",
                            ),
                            keyboardType: TextInputType.number,
                            maxLength: 8,
                            style: SignupStyle.inputStyle,
                            onChanged: (val) {},
                          ),
                        ),
                      )
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
                    "성별",
                    style: SignupStyle.labelStyle,
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
              TableCell(
                verticalAlignment: TableCellVerticalAlignment.middle,
                child: Container(
                  height: 58,
                  padding: EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () {},
                          child: _CheckBox(
                            label: "남성",
                            check: true,
                          ),
                        ),
                      ),
                      Container(width: 1.0, color: AppColors.colorBackground, margin: EdgeInsets.symmetric(horizontal: 15)),
                      Expanded(
                        child: InkWell(
                          onTap: () {},
                          child: _CheckBox(
                            label: "여성",
                            check: true,
                          ),
                        ),
                      ),
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

class _CheckBox extends StatefulWidget {
  const _CheckBox({Key? key, this.label = "", this.check = false}) : super(key: key);
  final String label;
  final bool check;

  @override
  __CheckBoxState createState() => __CheckBoxState();
}

class __CheckBoxState extends State<_CheckBox> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          widget.label,
          style: TextStyle(
            color: widget.check ? AppColors.point3 : AppColors.veryLightGrey,
            fontWeight: FontWeight.w700,
            fontFamily: "NotoSansCJKkr",
            fontSize: 14.0,
          ),
        ),
        CircleCheckBox(check: widget.check),
      ],
    );
  }
}
