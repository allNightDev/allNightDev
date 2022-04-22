import 'package:flutter/material.dart';

import 'custom_icons_icons.dart';

class AppCheckBox extends StatelessWidget {
  const AppCheckBox({Key? key, this.child, this.check = false, required this.onChange}) : super(key: key);

  final Widget? child;
  final bool check;
  final Function() onChange;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: onChange,
          child: Container(
            width: 18.0,
            height: 18.0,
            margin: EdgeInsets.only(right: (child == null) ? 0 : 6),
            decoration: BoxDecoration(
              border: Border.all(width: 1.0, color: Theme.of(context).dividerColor),
            ),
            child: Center(
              child: check
                  ? Icon(
                      CustomIcons.btn_checkbox_check,
                      color: Theme.of(context).primaryColor,
                      size: 17.0,
                    )
                  : SizedBox(),
            ),
          ),
        ),
        if (child != null) Expanded(child: child!),
      ],
    );
  }
}
