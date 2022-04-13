import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/app_colors.dart';
import '../../controllers/main_controller.dart';

class MainCard extends StatefulWidget {
  const MainCard({Key? key}) : super(key: key);

  @override
  _MainCardState createState() => _MainCardState();
}

class _MainCardState extends State<MainCard> {
  MainController mainController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        InkWell(
          onTap: () {},
          child: Container(
            color: Colors.white,
            padding: EdgeInsets.all(6.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                AspectRatio(
                  aspectRatio: 3 / 1,
                  child: Image.asset("assets/images/box_01_copy_2.png", fit: BoxFit.cover),
                ),
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
                                  "투비스마트 큐브 리스트 1",
                                  style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700, fontSize: 20.0),
                                )
                              ],
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(vertical: 7.0, horizontal: 13.0),
                              decoration: BoxDecoration(color: AppColors.point1, borderRadius: BorderRadius.all(Radius.circular(30.0))),
                              child: Text(
                                "450m",
                                style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 12.0),
                                textAlign: TextAlign.center,
                              ),
                            )
                          ],
                        ),
                      ),
                      Text(
                        "차별화된 서비스의 조화로 기존에 체험하지 못했던 최적의 자기주도 학습 환경을 제공합니다. 우리지역 최고의 배움터전 투비스마트 스터차별화된 서비스의 조화로 기존에 체험하지 못했던 최적의 자기주도 학습 환경을 제공합니다. 우리지역 최고의 배움터전 투비스마트 스터차별화된 서비스의 조화로 기존에 체험하지 못했던 최적의 자기주도 학습 환경을 제공합니다. 우리지역 최고의 배움터전 투비스마트 스터",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14.0, color: AppColors.browngrey, height: 1),
                      ),
                      SizedBox(height: 7),
                      _InfoWithIcon(
                        icon: ImageIcon(AssetImage("assets/icon/combined_shape.png"), size: 15, color: AppColors.point1),
                        info: "서울시 강남구 테헤란로 1길 1 1층",
                      ),
                      SizedBox(height: 2.0),
                      _InfoWithIcon(
                        icon: ImageIcon(AssetImage("assets/icon/group.png"), size: 15, color: AppColors.point1),
                        info: "010-1234-5678",
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
        Text(
          info ?? "",
          style: TextStyle(
            color: AppColors.browngrey,
            fontWeight: FontWeight.w400,
            fontSize: 14.0,
          ),
        )
      ],
    );
  }
}
