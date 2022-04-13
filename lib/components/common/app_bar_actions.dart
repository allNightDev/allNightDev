import 'package:flutter/material.dart';
import 'custom_icons_icons.dart';

class AppBarActions extends StatefulWidget {
  const AppBarActions({Key? key}) : super(key: key);

  @override
  _AppBarActionsState createState() => _AppBarActionsState();
}

class _AppBarActionsState extends State<AppBarActions> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 17.0),
      child: Row(
        children: [
          InkWell(
            onTap: () {},
            child: ActionIcon(icon: Icon(CustomIcons.btn_ticket, size: 24), count: 25),
          ),
          InkWell(
            onTap: () {},
            child: ActionIcon(icon: Icon(CustomIcons.btn_notice, size: 24), count: 25),
          ),
        ],
      ),
    );
  }
}

class ActionIcon extends StatelessWidget {
  const ActionIcon({Key? key, required this.icon, required this.count}) : super(key: key);
  final Widget icon;
  final int count;

  String get stringCount => (count > 99) ? "99" : "$count";

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 38,
      height: 38,
      child: Stack(
        children: [
          Center(child: icon),
          Align(
            alignment: Alignment.topRight,
            child: Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(color: Theme.of(context).primaryColor, shape: BoxShape.circle),
              child: Center(child: Text(stringCount, style: TextStyle(fontWeight: FontWeight.w700, fontSize: 12.0), textAlign: TextAlign.center)),
            ),
          ),
        ],
      ),
    );
  }
}
