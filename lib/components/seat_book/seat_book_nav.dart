import 'package:flutter/material.dart';
import 'package:studycube/components/seat_book/seat_book_nav_agree.dart';

import '../../constants/app_colors.dart';
import '../common/custom_icons_icons.dart';

class SeatBookNav extends StatefulWidget {
  const SeatBookNav({Key? key}) : super(key: key);

  @override
  State<SeatBookNav> createState() => _SeatBookNavState();
}

class _SeatBookNavState extends State<SeatBookNav> {
  bool payAgree = false;

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(top: BorderSide(color: AppColors.point3, width: 1.0)),
          boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.5), spreadRadius: 5, blurRadius: 7, offset: Offset(0, 3))],
        ),
        child: Column(
          children: [
            Container(
              height: 45,
              decoration: BoxDecoration(border: Border(bottom: BorderSide(width: 1, color: AppColors.white))),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    width: 45,
                    decoration: BoxDecoration(border: Border(right: BorderSide(width: 1, color: AppColors.white))),
                    child: Icon(CustomIcons.btn_my_fixseat, color: Theme.of(context).primaryColor),
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 11),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "좌석타입 / 좌석번호",
                          style: TextStyle(color: AppColors.veryLightGrey, fontWeight: FontWeight.w700, fontSize: 14.0),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 45,
                    decoration: BoxDecoration(
                      border: Border(right: BorderSide(width: 1, color: AppColors.white), left: BorderSide(width: 1, color: AppColors.white)),
                    ),
                    child: Icon(CustomIcons.btn_my_time, color: Theme.of(context).primaryColor),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Center(
                      child: Text("사용시간", style: TextStyle(color: AppColors.veryLightGrey, fontWeight: FontWeight.w700, fontSize: 14.0)),
                    ),
                  )
                ],
              ),
            ),
            Container(
              height: 45,
              decoration: BoxDecoration(border: Border(bottom: BorderSide(width: 1, color: AppColors.white))),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    width: 45,
                    decoration: BoxDecoration(border: Border(right: BorderSide(width: 1, color: AppColors.white))),
                    child: Center(child: ImageIcon(AssetImage("assets/icon/btn_my_timeseat.png"), size: 24, color: AppColors.point3)),
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 11),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "이용기간",
                          style: TextStyle(color: AppColors.veryLightGrey, fontWeight: FontWeight.w700, fontSize: 14.0),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 45,
              decoration: BoxDecoration(border: Border(bottom: BorderSide(width: 1, color: AppColors.white))),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    width: 45,
                    decoration: BoxDecoration(border: Border(right: BorderSide(width: 1, color: AppColors.white))),
                    child: Center(child: ImageIcon(AssetImage("assets/icon/icon_only_cash_copy_2.png"), size: 24, color: AppColors.point3)),
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 11),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("총 결제 금액 :", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w400, fontSize: 14.0)),
                          Text("0원", style: TextStyle(color: AppColors.veryLightGrey, fontWeight: FontWeight.w700, fontSize: 20.0))
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SeatBookNavAgree(agree: payAgree, onChange: (value) => setState(() => payAgree = value)),
            Container(
              padding: EdgeInsets.symmetric(vertical: 33),
              color: AppColors.point1,
              child: Center(
                child: Text(
                  "결제하기",
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 14.0),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
