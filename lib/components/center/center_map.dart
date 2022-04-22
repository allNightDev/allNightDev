// ignore_for_file: unnecessary_cast

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../controllers/center_controller.dart';

class CenterMap extends StatefulWidget {
  const CenterMap({Key? key}) : super(key: key);

  @override
  State<CenterMap> createState() => _CenterMapState();
}

class _CenterMapState extends State<CenterMap> {
  CenterController centerController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 7.0),
      child: AspectRatio(
        aspectRatio: 1 / 1,
        child: GoogleMap(
          initialCameraPosition: CameraPosition(
            target: LatLng(
              centerController.centerInfo.value!.centerLantLng!.latitude as double,
              centerController.centerInfo.value!.centerLantLng!.longitude as double,
            ),
            zoom: 14.0,
          ),
          myLocationButtonEnabled: false,
        ),
      ),
    );
  }
}
