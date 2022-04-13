import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/app_colors.dart';
import '../common/custom_icons_icons.dart';

class PopupDialog extends StatefulWidget {
  const PopupDialog({Key? key, this.child}) : super(key: key);
  final Widget? child;

  @override
  _PopupDialogState createState() => _PopupDialogState();
}

class _PopupDialogState extends State<PopupDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.all(10),
      backgroundColor: Colors.white.withOpacity(0.6),
      child: SingleChildScrollView(
        physics: ClampingScrollPhysics(),
        child: IntrinsicHeight(
          child: Container(
            padding: EdgeInsets.all(5.0),
            child: Container(
              color: AppColors.browngrey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    padding: EdgeInsets.all(11.0),
                    margin: EdgeInsets.only(bottom: 3),
                    color: Colors.white,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "서비스 이용약관",
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontFamily: "NotoSansCJKkr",
                            fontSize: 14.0,
                          ),
                        ),
                        InkWell(
                          onTap: () => Get.back(),
                          child: Icon(CustomIcons.btn_x, color: Colors.black, size: 24),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 6),
                    child: widget.child,
                  ),
                  InkWell(
                    onTap: () => Get.back(),
                    child: Container(
                      height: 45,
                      color: AppColors.pointblue,
                      child: Center(
                        child: Text(
                          "확인",
                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 14.0),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
