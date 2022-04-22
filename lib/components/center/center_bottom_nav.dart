import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../screen/seat_book_screen.dart';
import '../common/custom_icons_icons.dart';

class CenterBottomNav extends StatefulWidget {
  const CenterBottomNav({Key? key}) : super(key: key);

  @override
  _CenterBottomNavState createState() => _CenterBottomNavState();
}

class _CenterBottomNavState extends State<CenterBottomNav> {
  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 16.0),
        color: Colors.white,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: InkWell(onTap: () => Get.to(SeatBookScreen()), child: _Item(icon: Icon(CustomIcons.btn_my_fixseat, size: 24), label: "좌석")),
            ),
            VerticalDivider(width: 1.0),
            Expanded(child: _Item(icon: Icon(CustomIcons.btn_my_locker, size: 24), label: "사물함")),
            VerticalDivider(width: 1.0),
            Expanded(child: _Item(icon: Icon(CustomIcons.btn_my_timepack_charge, size: 24), label: "시간패키지")),
            VerticalDivider(width: 1.0),
            Expanded(child: _Item(icon: Icon(CustomIcons.btn_my_period_charge, size: 24), label: "기간권")),
            VerticalDivider(width: 1.0),
            Expanded(
              child: InkWell(
                onTap: () {},
                child: _Item(
                  icon: Icon(CustomIcons.btn_my_shop, size: 24),
                  label: "스토어",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Item extends StatelessWidget {
  const _Item({Key? key, required this.icon, required this.label}) : super(key: key);
  final Icon icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            icon,
            Text(
              label,
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 12.0),
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
