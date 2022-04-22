import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../components/common/custom_icons_icons.dart';
import '../components/seat_book/seat_book_nav.dart';
import '../components/seat_book/select_seat.dart';
import '../components/seat_book/select_seat_type.dart';
import '../components/seat_book/select_start_time.dart';
import '../components/seat_book/select_use_time.dart';
import '../controllers/center_controller.dart';
import '../controllers/seat_book_controller.dart';

class SeatBookScreen extends StatefulWidget {
  const SeatBookScreen({Key? key}) : super(key: key);

  @override
  State<SeatBookScreen> createState() => _SeatBookScreenState();
}

class _SeatBookScreenState extends State<SeatBookScreen> {
  CenterController centerController = Get.find();
  SeatBookController seatBookController = Get.put(SeatBookController());

  @override
  void initState() {
    seatBookController.getSeatTypes();
    super.initState();
  }

  @override
  void dispose() {
    seatBookController.onClose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () => Get.back(), icon: Icon(CustomIcons.btn_back_arrow_bold)),
        actions: [
          Container(
            padding: EdgeInsets.only(right: 17.0),
            child: InkWell(onTap: () {}, child: Icon(CustomIcons.btn_refresh, size: 24)),
          ),
        ],
        title: Text("좌석 예약", style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14.0, color: Colors.black)),
        centerTitle: true,
      ),
      body: Obx(
        () => SafeArea(
          child: SingleChildScrollView(
            physics: ClampingScrollPhysics(),
            child: IntrinsicHeight(
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(6, 20, 6, 0),
                    child: Column(
                      children: [
                        SelectSeatType(),
                        if (seatBookController.selectedSeatType.value != null) SelectUseTime(),
                        if (seatBookController.selectedSeatFee.value != null) SelectStartTime(),
                      ],
                    ),
                  ),
                  SelectSeat(),
                  Spacer(),
                  SeatBookNav(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
