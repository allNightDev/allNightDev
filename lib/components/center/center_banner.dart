import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/app_colors.dart';
import '../../controllers/center_controller.dart';

class CenterBanner extends StatefulWidget {
  const CenterBanner({Key? key}) : super(key: key);

  @override
  State<CenterBanner> createState() => _CenterBannerState();
}

class _CenterBannerState extends State<CenterBanner> {
  CenterController centerController = Get.find();
  int currentPage = 0;

  final BoxDecoration _selectDeco = BoxDecoration(
    borderRadius: BorderRadius.all(Radius.circular(4)),
    boxShadow: const [BoxShadow(color: Color(0x33000000), offset: Offset(1, 1), blurRadius: 1, spreadRadius: 0)],
    color: AppColors.point3,
  );

  final BoxDecoration _nonSelectDeco = BoxDecoration(
    borderRadius: BorderRadius.all(Radius.circular(4)),
    boxShadow: const [BoxShadow(color: Color(0x33000000), offset: Offset(1, 1), blurRadius: 1, spreadRadius: 0)],
    color: const Color(0xffffffff),
  );

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 480 / 257,
      child: Stack(
        fit: StackFit.expand,
        children: [
          CarouselSlider(
            items: (centerController.centerInfo.value?.imgList ?? [])
                .map((_img) => Container(decoration: BoxDecoration(image: DecorationImage(image: NetworkImage(_img), fit: BoxFit.cover))))
                .toList(),
            options: CarouselOptions(
              autoPlay: false,
              viewportFraction: 1,
              aspectRatio: 1,
              enableInfiniteScroll: false,
              onPageChanged: (page, reason) => setState(() => currentPage = page),
            ),
          ),
          Positioned(
            bottom: 10,
            left: 10,
            child: Wrap(
              spacing: 6,
              children: List.generate(
                (centerController.centerInfo.value?.imgList ?? []).length,
                (index) => AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  height: 8,
                  width: currentPage == index ? 40 : 8,
                  decoration: currentPage == index ? _selectDeco : _nonSelectDeco,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
