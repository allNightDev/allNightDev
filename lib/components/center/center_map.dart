import 'package:flutter/material.dart';

class CenterMap extends StatefulWidget {
  const CenterMap({Key? key}) : super(key: key);

  @override
  State<CenterMap> createState() => _CenterMapState();
}

class _CenterMapState extends State<CenterMap> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 7.0),
      child: AspectRatio(
        aspectRatio: 1 / 1,
        child: Container(),
      ),
    );
  }
}
