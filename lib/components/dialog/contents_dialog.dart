import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/app_colors.dart';
import '../common/custom_icons_icons.dart';

class ContentsDialog extends StatefulWidget {
  final Widget child;
  final String title;
  const ContentsDialog({Key? key, required this.child, this.title = ""}) : super(key: key);

  @override
  State<ContentsDialog> createState() => _ContentsDialogState();
}

class _ContentsDialogState extends State<ContentsDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.all(14),
      backgroundColor: Colors.white.withOpacity(0.6),
      child: Container(
        margin: EdgeInsets.all(7),
        color: AppColors.colorBackground,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              color: Colors.white,
              margin: EdgeInsets.only(bottom: 3),
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.title,
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14.0),
                  ),
                  InkWell(
                    onTap: () => Get.back(),
                    child: Icon(CustomIcons.btn_x, color: Colors.black, size: 24),
                  )
                ],
              ),
            ),
            Flexible(
              child: SingleChildScrollView(
                physics: ClampingScrollPhysics(),
                child: widget.child,
              ),
            ),
            InkWell(
              onTap: () => Get.back(),
              child: Container(
                margin: EdgeInsets.only(top: 6),
                height: 45,
                color: AppColors.pointblue,
                child: Center(
                  child: Text("확인", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 14.0)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
