import 'package:flutter/material.dart';

import '../../constants/app_colors.dart';
import '../common/app_check_box.dart';

class SeatBookNavAgree extends StatefulWidget {
  final bool agree;
  final Function(bool) onChange;

  const SeatBookNavAgree({Key? key, required this.agree, required this.onChange}) : super(key: key);

  @override
  State<SeatBookNavAgree> createState() => _SeatBookNavAgreeState();
}

class _SeatBookNavAgreeState extends State<SeatBookNavAgree> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      padding: EdgeInsets.symmetric(horizontal: 11),
      decoration: BoxDecoration(border: Border(bottom: BorderSide(width: 1, color: AppColors.white))),
      child: Row(
        children: [
          Expanded(
            child: InkWell(
              onTap: () => widget.onChange(!widget.agree),
              child: Row(
                children: [
                  AppCheckBox(check: widget.agree, onChange: () => widget.onChange(!widget.agree)),
                  SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      "(필수)구매조건 확인 및 결제 진행에 동의합니다.",
                      style: TextStyle(color: AppColors.browngrey, fontWeight: FontWeight.w400, fontSize: 12.0),
                    ),
                  ),
                ],
              ),
            ),
          ),
          IntrinsicHeight(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 6),
              decoration: BoxDecoration(color: AppColors.veryLightGrey, borderRadius: BorderRadius.circular(15)),
              child: Center(child: Text("약관보기", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 10.0))),
            ),
          ),
        ],
      ),
    );
  }
}
