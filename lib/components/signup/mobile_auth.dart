import 'package:flutter/material.dart';

import '../../constants/app_colors.dart';

class MobileAuth extends StatefulWidget {
  const MobileAuth({Key? key}) : super(key: key);

  @override
  State<MobileAuth> createState() => _MobileAuthState();
}

class _MobileAuthState extends State<MobileAuth> {
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
                    "* 휴대폰 번호",
                    style: TextStyle(color: AppColors.point3, fontWeight: FontWeight.w700, fontSize: 14.0),
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
                            decoration: InputDecoration(border: InputBorder.none, contentPadding: EdgeInsets.all(0)),
                            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14.0),
                            keyboardType: TextInputType.number,
                            onChanged: (val) {},
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Text(
                          "인증번호 전송",
                          style:
                              TextStyle(color: AppColors.point1, fontWeight: FontWeight.w400, fontSize: 14.0, decoration: TextDecoration.underline),
                          textAlign: TextAlign.right,
                        ),
                      ),
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
                  width: 117,
                  padding: EdgeInsets.only(left: 15),
                  child: Text(
                    "* 인증번호",
                    style: TextStyle(color: AppColors.point3, fontWeight: FontWeight.w700, fontSize: 14.0),
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
                              hintText: "인증번호 입력",
                              hintStyle: TextStyle(color: AppColors.veryLightGrey, fontWeight: FontWeight.w700, fontSize: 14.0),
                            ),
                            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14.0),
                            keyboardType: TextInputType.number,
                            onChanged: (val) {},
                          ),
                        ),
                      ),
                      Text(
                        "2:59",
                        style: TextStyle(color: AppColors.point3, fontWeight: FontWeight.w400, fontSize: 14.0),
                        textAlign: TextAlign.right,
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
