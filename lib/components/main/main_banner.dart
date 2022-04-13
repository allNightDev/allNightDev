import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/app_colors.dart';
import '../../controllers/main_controller.dart';

class MainBanner extends StatefulWidget {
  const MainBanner({Key? key}) : super(key: key);

  @override
  _MainBannerState createState() => _MainBannerState();
}

class _MainBannerState extends State<MainBanner> {
  CarouselController buttonCarouselController = CarouselController();
  MainController mainController = Get.find();
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
    return Container(
      padding: EdgeInsets.all(7.0),
      child: AspectRatio(
        aspectRatio: 1 / 1,
        child: Stack(
          children: [
            CarouselSlider(
              items: mainController.banners.map((_banner) => _banner.image).toList(),
              options: CarouselOptions(
                autoPlay: false,
                viewportFraction: 1,
                aspectRatio: 1,
                enableInfiniteScroll: false,
                initialPage: currentPage,
                onPageChanged: (page, reason) => setState(() => currentPage = page),
              ),
            ),
            Positioned(
              bottom: 10,
              left: 10,
              child: Wrap(
                spacing: 6,
                children: List.generate(
                  mainController.banners.length,
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
      ),
    );
  }
}
