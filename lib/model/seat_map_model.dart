import 'package:studycube/model/seat_model.dart';

class SeatMapModel {
  String img = "";
  int imgWidth = 0;
  int imgHeight = 0;
  int timeStamp = 0;
  List<SeatModel> seats = [];

  SeatMapModel.fromJson(Map<String, dynamic> json)
      : img = json['img'] ?? "",
        imgWidth = int.parse(json['imgWidth'] ?? '0'),
        imgHeight = int.parse(json['imgHeight'] ?? '0'),
        timeStamp = int.parse(json['timeStamp'] ?? '0'),
        seats = (json['result_list'] ?? []).map<SeatModel>((_item) => SeatModel.fromJson(_item)).toList();
}
