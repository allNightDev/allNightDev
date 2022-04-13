import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../components/common/app_bar_actions.dart';
import '../components/common/custom_icons_icons.dart';
import '../components/main/main_banner.dart';
import '../components/main/main_card.dart';
import '../components/main/main_filter.dart';
import '../controllers/main_controller.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final ScrollController _controller = ScrollController();
  bool bottomShow = false;

  @override
  void initState() {
    super.initState();

    Get.lazyPut(() => MainController());

    _controller.addListener(() {
      setState(() => bottomShow = _controller.offset > 10.0);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () {}, icon: Icon(CustomIcons.btn_menu)),
        actions: const [AppBarActions()],
        title: Image.asset('assets/images/logo.png', width: 154, height: 24),
        centerTitle: false,
      ),
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              physics: ClampingScrollPhysics(),
              controller: _controller,
              child: Column(
                children: [
                  MainBanner(),
                  MainFilter(),
                  Column(children: List.generate(10, (index) => MainCard())),
                ],
              ),
            ),
            if (bottomShow)
              Positioned(
                left: 0,
                right: 0,
                bottom: 6.0,
                child: _BottomFunc(onTap: () => _controller.animateTo(0.0, duration: Duration(milliseconds: 300), curve: Curves.easeInOut)),
              ),
          ],
        ),
      ),
    );
  }
}

class _BottomFunc extends StatelessWidget {
  final Function onTap;
  const _BottomFunc({Key? key, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5.0),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 60,
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(40)),
                color: Color(0xcc000000),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "처음오셨나요?  모바일앱 이용가이드 보기 ",
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 14.0),
                  ),
                  Icon(Icons.arrow_forward_ios, color: Colors.white, size: 14)
                ],
              ),
            ),
          ),
          SizedBox(width: 5.0),
          Container(
            height: 60.0,
            width: 60.0,
            decoration: BoxDecoration(shape: BoxShape.circle, color: Theme.of(context).primaryColor),
            child: Center(
              child: IconButton(
                onPressed: () => onTap(),
                icon: Icon(Icons.arrow_upward_sharp, color: Colors.white, size: 22),
              ),
            ),
          )
        ],
      ),
    );
  }
}
