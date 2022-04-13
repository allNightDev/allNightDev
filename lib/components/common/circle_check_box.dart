import 'package:flutter/material.dart';

import '../../constants/app_colors.dart';

class CircleCheckBox extends StatefulWidget {
  const CircleCheckBox({Key? key, this.check = false}) : super(key: key);
  final bool check;

  @override
  _CircleCheckBoxState createState() => _CircleCheckBoxState();
}

class _CircleCheckBoxState extends State<CircleCheckBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 26,
      height: 26,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: AppColors.verylightpink,
        ),
      ),
      child: Center(
        child: widget.check
            ? Container(
                width: 14.0,
                height: 14.0,
                decoration: BoxDecoration(shape: BoxShape.circle, color: Theme.of(context).primaryColor),
              )
            : SizedBox(),
      ),
    );
  }
}
