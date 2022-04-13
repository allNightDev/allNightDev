import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../components/common/custom_icons_icons.dart';
import '../components/dialog/check_button_dialog.dart';
import '../components/signup/agree_table.dart';
import '../components/signup/mobile_auth.dart';
import '../components/signup/password_table.dart';
import '../components/signup/user_info_table.dart';
import '../constants/app_colors.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () => Get.back(), icon: Icon(CustomIcons.btn_back_arrow_bold), color: Colors.black),
        title: Text("회원가입", style: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.w700)),
        centerTitle: true,
        elevation: 0.5,
        backgroundColor: Colors.white,
      ),
      bottomNavigationBar: InkWell(
        onTap: () {
          Get.dialog(CheckButtonDialog(text: "인증번호가 일치하지 않습니다.\n인증번호를 재전송하시겠습니까?"), barrierDismissible: false);
        },
        child: Container(
          height: 80,
          color: AppColors.pointblue,
          child: Center(
            child: Text(
              "가입",
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontFamily: "NotoSansCJKkr", fontSize: 14.0),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: ClampingScrollPhysics(),
          child: IntrinsicHeight(
            child: Container(
              padding: EdgeInsets.fromLTRB(6, 8, 6, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: const [
                  Text("* 필수사항", style: TextStyle(fontWeight: FontWeight.w400, fontSize: 12.0), textAlign: TextAlign.right),
                  MobileAuth(),
                  SizedBox(height: 1.0),
                  PasswordTable(),
                  SizedBox(height: 1.0),
                  UserInfoTable(),
                  SizedBox(height: 1.0),
                  AgreeTable(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
