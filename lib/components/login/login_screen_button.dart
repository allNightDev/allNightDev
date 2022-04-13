import 'package:flutter/material.dart';

class LoginScreenButton extends StatelessWidget {
  const LoginScreenButton({Key? key, required this.icon, this.bgColor = Colors.transparent, this.label = "", required this.onClick})
      : super(key: key);
  final Widget icon;
  final Color bgColor;
  final String label;
  final Function() onClick;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Container(
        height: 58,
        padding: EdgeInsets.symmetric(horizontal: 21),
        color: bgColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            icon,
            Text(label, style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 20.0), textAlign: TextAlign.right)
          ],
        ),
      ),
    );
  }
}
