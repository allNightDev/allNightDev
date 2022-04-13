import 'package:flutter/material.dart';

import '../../constants/app_colors.dart';

class CompanyInfo extends StatelessWidget {
  CompanyInfo({Key? key, this.isLogo = true}) : super(key: key);

  final TextStyle _style1 = TextStyle(color: AppColors.veryLightGrey, fontWeight: FontWeight.w700, fontStyle: FontStyle.normal, fontSize: 12.0);
  final TextStyle _style2 = TextStyle(color: AppColors.veryLightGrey, fontWeight: FontWeight.w400, fontStyle: FontStyle.normal, fontSize: 12.0);
  final bool isLogo;

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          if (isLogo)
            Container(
              padding: EdgeInsets.only(left: 16.0, right: 12.0),
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(color: Theme.of(context).dividerColor, width: 1.0),
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(16.0),
                      child: Image.asset(
                        'assets/images/logo.png',
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "스터디큐브 Ver.2.1.5",
                          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 12.0),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 10.0),
                          padding: EdgeInsets.symmetric(horizontal: 7.0, vertical: 7.0),
                          decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(15.5)), color: Theme.of(context).primaryColor),
                          child: Center(
                            child: Text(
                              "UPDATE",
                              style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 12.0),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          Container(height: 1.0, color: Theme.of(context).dividerColor),
          Row(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    border: Border(
                      right: BorderSide(color: Theme.of(context).dividerColor, width: 1.0),
                    ),
                  ),
                  padding: EdgeInsets.all(16.0),
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(style: _style1, text: "(주)투비스마트 / 대표 : "),
                        TextSpan(style: _style2, text: "김광\n"),
                        TextSpan(style: _style1, text: "통신판매업 신고번호 : "),
                        TextSpan(style: _style2, text: "제2016-대전유성-0914호\n"),
                        TextSpan(style: _style1, text: "주소 : "),
                        TextSpan(style: _style2, text: "경기도 성남시 분당구 수내동 16-3 코포모빌딩 402호\n"),
                        TextSpan(style: _style1, text: "Tel : "),
                        TextSpan(style: _style2, text: "1577-3119 / "),
                        TextSpan(style: _style1, text: "Fax : "),
                        TextSpan(style: _style2, text: "031-701-4119\n"),
                        TextSpan(style: _style1, text: "Email : "),
                        TextSpan(style: _style2, text: "info@tobesmart.co.kr\n이용약관 | 개인정보처리방침\n"),
                        TextSpan(style: _style1, text: "Copyright Tobesmart., Ltd. All right reserved."),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 18.4),
                child: Image.asset(
                  'assets/images/tobesmart_ci_b_2_w.png',
                  width: 52,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
