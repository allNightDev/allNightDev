import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/app_colors.dart';
import '../../controllers/main_controller.dart';
import '../../model/center_model.dart';
import '../../screen/center_screen.dart';

class MainCard extends StatefulWidget {
  final CenterModel center;
  const MainCard({Key? key, required this.center}) : super(key: key);

  @override
  _MainCardState createState() => _MainCardState();
}

class _MainCardState extends State<MainCard> {
  MainController mainController = Get.find();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        InkWell(
          onTap: () => Get.to(CenterScreen(centerUid: widget.center.uid)),
          child: Container(
            color: Colors.white,
            padding: EdgeInsets.all(6.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // AspectRatio(
                //   aspectRatio: 3 / 1,
                //   child: Image.network(
                //     widget.center.centerImg1,
                //     fit: BoxFit.cover,
                //     errorBuilder: (context, exception, stackTrace) => SizedBox(),
                //   ),
                // ),
                Container(
                  padding: EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 11.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                ImageIcon(AssetImage("assets/icon/btn_hart_2_copy.png"), size: 24, color: Theme.of(context).primaryColor),
                                SizedBox(width: 8.0),
                                Text(
                                  widget.center.centerName,
                                  style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700, fontSize: 20.0),
                                )
                              ],
                            ),
                            if (widget.center.getDistance != null)
                              Container(
                                padding: EdgeInsets.symmetric(vertical: 7.0, horizontal: 13.0),
                                decoration: BoxDecoration(color: AppColors.point1, borderRadius: BorderRadius.all(Radius.circular(30.0))),
                                child: Text(
                                  widget.center.getDistance!,
                                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 12.0),
                                  textAlign: TextAlign.center,
                                ),
                              )
                          ],
                        ),
                      ),
                      Text(
                        widget.center.centerIntro,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14.0, color: AppColors.browngrey, height: 1),
                      ),
                      SizedBox(height: 7),
                      _InfoWithIcon(
                        icon: ImageIcon(AssetImage("assets/icon/combined_shape.png"), size: 15, color: AppColors.point1),
                        info: widget.center.centerAddr,
                      ),
                      SizedBox(height: 2.0),
                      _InfoWithIcon(
                        icon: ImageIcon(AssetImage("assets/icon/group.png"), size: 15, color: AppColors.point1),
                        info: widget.center.centerPhone,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Divider(),
      ],
    );
  }
}

class _InfoWithIcon extends StatelessWidget {
  final Widget? icon;
  final String? info;

  const _InfoWithIcon({Key? key, this.icon, this.info}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        if (icon != null) Container(margin: EdgeInsets.only(right: 6), child: icon),
        Expanded(
          child: Text(
            info ?? "",
            style: TextStyle(
              color: AppColors.browngrey,
              fontWeight: FontWeight.w400,
              fontSize: 14.0,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        )
      ],
    );
  }
}
