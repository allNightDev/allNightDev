import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../components/common/app_bar_actions.dart';
import '../components/common/company_info.dart';
import '../components/common/custom_icons_icons.dart';
import '../controllers/app_controller.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  AppController appController = Get.find();

  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(CustomIcons.btn_x, size: 24),
        ),
        actions: const [AppBarActions()],
      ),
      body: LayoutBuilder(builder: (BuildContext context, BoxConstraints constraints) {
        return SingleChildScrollView(
          physics: ClampingScrollPhysics(),
          child: ConstrainedBox(
            constraints: constraints.copyWith(
              minHeight: constraints.maxHeight,
              maxHeight: double.infinity,
            ),
            child: IntrinsicHeight(
              child: Column(
                children: <Widget>[
                  Container(
                    height: 58,
                    padding: EdgeInsets.only(left: 16.0, right: 12.5),
                    decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Theme.of(context).dividerColor, width: 1.0))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("${appController.userInfo.value!.userId}님 ", style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20.0)),
                        Row(
                          children: [
                            Text(
                              "내 정보 관리",
                              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14.0),
                            ),
                            Container(width: 1, height: 12, color: Colors.black, margin: EdgeInsets.symmetric(horizontal: 12.0)),
                            InkWell(
                              onTap: () {},
                              child: Text(
                                "로그아웃",
                                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14.0),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: _WithIcon(
                      icon: Icon(CustomIcons.btn_menu_timepack),
                      label: "시간패키지",
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "2개 지점",
                            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 12.0, color: Theme.of(context).primaryColor),
                          ),
                          Container(width: 1, height: 12, color: Colors.black, margin: EdgeInsets.symmetric(horizontal: 12.0)),
                          Text(
                            "총 121시간 30분",
                            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 12.0, color: Theme.of(context).primaryColor),
                          )
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: _WithIcon(
                      icon: Icon(CustomIcons.btn_menu_period),
                      label: "기간권",
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "2개 지점",
                            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 12.0, color: Theme.of(context).primaryColor),
                          ),
                          Container(width: 1, height: 12, color: Colors.black, margin: EdgeInsets.symmetric(horizontal: 12.0)),
                          Text(
                            "총 51일",
                            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 12.0, color: Theme.of(context).primaryColor),
                          )
                        ],
                      ),
                    ),
                  ),
                  _WithIcon(icon: Icon(CustomIcons.btn_menu_point), label: "포인트"),
                  InkWell(
                    onTap: () {},
                    child: _WithIcon(icon: Icon(CustomIcons.btn_menu_seat_locker_copy), label: "좌석/사물함 이용내역"),
                  ),
                  InkWell(
                    onTap: () {},
                    child: _WithIcon(icon: Icon(CustomIcons.btn_menu_money), label: "구매내역"),
                  ),
                  InkWell(
                    child: _WithIcon(icon: Icon(CustomIcons.btn_menu_notice), label: "공지 및 이벤트"),
                  ),
                  InkWell(
                    child: _WithIcon(icon: Icon(CustomIcons.btn_menu_setting), label: "설정"),
                  ),
                  Spacer(),
                  CompanyInfo(),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}

class _WithIcon extends StatelessWidget {
  _WithIcon({Key? key, required this.icon, this.child, required this.label}) : super(key: key);

  final Icon icon;
  final Widget? child;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 58,
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Theme.of(context).dividerColor, width: 1.0))),
      child: Row(
        children: [
          Row(
            children: [
              icon,
              SizedBox(width: 14.0),
              Text(label, style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20.0)),
            ],
          ),
          Expanded(child: child ?? Container()),
          SizedBox(width: 14.0),
          Icon(CustomIcons.btn_search_copy_2),
        ],
      ),
    );
  }
}
