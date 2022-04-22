import 'package:flutter/material.dart';

import '../../constants/app_colors.dart';
import '../common/app_check_box.dart';
import '../common/custom_icons_icons.dart';

class AgreeTable extends StatefulWidget {
  const AgreeTable({Key? key}) : super(key: key);

  @override
  State<AgreeTable> createState() => _AgreeTableState();
}

class _AgreeTableState extends State<AgreeTable> {
  final TextStyle _labelStyle = TextStyle(color: AppColors.browngrey, fontWeight: FontWeight.w400, fontSize: 12.0);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(border: Border.all(width: 1.0, color: AppColors.colorBackground), color: Colors.white),
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 18.0),
      child: Column(children: [
        AppCheckBox(
          child: Text(
            "전체동의",
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 12.0),
          ),
          onChange: () {},
          check: true,
        ),
        Divider(height: 17.0),
        AppCheckBox(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("서비스 이용약관 동의 (필수)", style: _labelStyle),
              _TermsView(onClick: () {}),
            ],
          ),
          onChange: () {},
          check: true,
        ),
        SizedBox(height: 8.0),
        AppCheckBox(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("개인정보 수집 및 이용약관 동의 (필수)", style: _labelStyle),
              _TermsView(onClick: () {}),
            ],
          ),
          onChange: () {},
          check: true,
        ),
        SizedBox(height: 8.0),
        AppCheckBox(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("마케팅 정보수신 동의 (선택)", style: _labelStyle),
            ],
          ),
          onChange: () {},
          check: true,
        ),
      ]),
    );
  }
}

class _TermsView extends StatefulWidget {
  const _TermsView({Key? key, required this.onClick}) : super(key: key);
  final Function() onClick;

  @override
  __TermsViewState createState() => __TermsViewState();
}

class __TermsViewState extends State<_TermsView> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        width: 64,
        height: 24,
        decoration: BoxDecoration(
          color: AppColors.verylightpink,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Center(
          child: Text(
            "약관보기",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 10.0),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
