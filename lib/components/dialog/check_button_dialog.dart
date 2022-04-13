import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/app_colors.dart';

class CheckButtonDialog extends StatefulWidget {
  const CheckButtonDialog({Key? key, this.text = "", this.onClick, this.isCancel = true, this.isCheck = true}) : super(key: key);
  final String text;
  final Function()? onClick;
  final bool isCancel;
  final bool isCheck;

  @override
  _CheckButtonDialogState createState() => _CheckButtonDialogState();
}

class _CheckButtonDialogState extends State<CheckButtonDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white.withOpacity(0.6),
      child: IntrinsicHeight(
        child: Container(
          padding: EdgeInsets.all(5.0),
          child: Container(
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  padding: EdgeInsets.all(20.0),
                  child: Text(
                    widget.text,
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16.0, height: 1.0),
                  ),
                ),
                Row(
                  children: [
                    if (widget.isCancel)
                      Expanded(
                        child: InkWell(
                          onTap: () => Get.back(),
                          child: Container(
                            height: 45,
                            color: AppColors.browngrey,
                            child: Center(
                              child: Text(
                                "취소",
                                style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 14.0),
                              ),
                            ),
                          ),
                        ),
                      ),
                    if (widget.isCheck)
                      Expanded(
                        child: InkWell(
                          onTap: widget.onClick ?? () => Get.back(),
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
                      ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
