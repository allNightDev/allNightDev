import 'package:flutter/material.dart';

import '../../constants/app_colors.dart';
import '../../enum/seat_status.dart';

class SelectSeat extends StatefulWidget {
  const SelectSeat({Key? key}) : super(key: key);

  @override
  State<SelectSeat> createState() => _SelectSeatState();
}

class _SelectSeatState extends State<SelectSeat> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 25),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 22),
            margin: EdgeInsets.only(bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("4. 좌석선택", style: TextStyle(color: AppColors.veryLightGrey, fontWeight: FontWeight.w700, fontSize: 14.0)),
                Text(
                  "우선 종료 좌석 보기",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: 12.0,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ],
            ),
          ),
          _SeatTypeKind(),
        ],
      ),
    );
  }
}

class _SeatTypeKind extends StatelessWidget {
  const _SeatTypeKind({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10),
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                SeatStatus.enable.enumToWidget,
                SizedBox(width: 3),
                Text(SeatStatus.enable.enumToString, style: TextStyle(fontWeight: FontWeight.w400, fontSize: 12.0)),
              ],
            ),
            Container(width: 1, color: AppColors.white),
            Row(
              children: [
                SeatStatus.book.enumToWidget,
                SizedBox(width: 3),
                Text(SeatStatus.book.enumToString, style: TextStyle(fontWeight: FontWeight.w400, fontSize: 12.0)),
              ],
            ),
            Container(width: 1, color: AppColors.white),
            Row(
              children: [
                SeatStatus.disable.enumToWidget,
                SizedBox(width: 3),
                Text(SeatStatus.disable.enumToString, style: TextStyle(fontWeight: FontWeight.w400, fontSize: 12.0)),
              ],
            ),
            Container(width: 1, color: AppColors.white),
            Row(
              children: [
                SeatStatus.end.enumToWidget,
                SizedBox(width: 3),
                Text(SeatStatus.end.enumToString, style: TextStyle(fontWeight: FontWeight.w400, fontSize: 12.0)),
              ],
            ),
            Container(width: 1, color: AppColors.white),
            Row(
              children: [
                SeatStatus.other.enumToWidget,
                SizedBox(width: 3),
                Text(SeatStatus.other.enumToString, style: TextStyle(fontWeight: FontWeight.w400, fontSize: 12.0)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
