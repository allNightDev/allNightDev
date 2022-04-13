import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../components/common/company_info.dart';
import '../components/common/custom_icons_icons.dart';
import '../components/login/app_check_box.dart';
import '../components/login/input_box.dart';
import '../components/login/login_screen_button.dart';
import '../constants/app_colors.dart';
import '../controllers/app_controller.dart';
import 'signup_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  AppController appController = Get.find();

  bool _autoLogin = false;
  String _tel = "01082120146";
  String _password = "123456";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CompanyInfo(isLogo: false),
      body: SafeArea(
        maintainBottomViewPadding: true,
        child: SingleChildScrollView(
          physics: ClampingScrollPhysics(),
          child: IntrinsicHeight(
            child: Container(
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    height: 58,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(width: 192.5, height: 30.0, child: Image.asset('assets/images/logo.png', fit: BoxFit.fitWidth)),
                        Text("스터디큐브", style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14.0)),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.only(top: 72),
                      child: Column(
                        children: [
                          Column(
                            children: [
                              InputBox(
                                label: "휴대폰 번호",
                                onChange: (val) => _tel = val,
                                keyboardType: TextInputType.number,
                                value: _tel,
                              ),
                              SizedBox(height: 5.0),
                              InputBox(
                                label: "비밀번호",
                                onChange: (val) => _password = val,
                                obscureText: true,
                                keyboardType: TextInputType.number,
                                value: _password,
                              ),
                            ],
                          ),
                          SizedBox(height: 22.0),
                          // 자동 로그인
                          Container(
                            margin: EdgeInsets.only(bottom: 19),
                            padding: EdgeInsets.symmetric(horizontal: 18),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                  onTap: () => setState(() => _autoLogin = !_autoLogin),
                                  child: Row(
                                    children: [
                                      AppCheckBox(check: _autoLogin),
                                      SizedBox(width: 2.6),
                                      Text("자동로그인", style: TextStyle(fontWeight: FontWeight.w400, fontSize: 12.0))
                                    ],
                                  ),
                                ),
                                InkWell(
                                  onTap: () {},
                                  child: Text(
                                    "비밀번호 재설정",
                                    style: TextStyle(
                                      color: AppColors.point3,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12.0,
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          // 버튼
                          LoginScreenButton(
                            icon: Icon(CustomIcons.btn_menu_lock, color: Colors.white, size: 24),
                            label: "로그인",
                            bgColor: AppColors.pointblue,
                            onClick: () => appController.login(_tel, _password),
                          ),
                          SizedBox(height: 5),
                          LoginScreenButton(
                            icon: Icon(CustomIcons.btn_menu_sign_up, color: Colors.white, size: 26),
                            label: "스터디큐브 회원가입",
                            bgColor: AppColors.point3,
                            onClick: () => Get.to(SignupScreen()),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
