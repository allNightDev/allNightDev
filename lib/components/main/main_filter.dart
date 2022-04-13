import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/main_controller.dart';
import '../../model/filter_model.dart';

class MainFilter extends StatefulWidget {
  const MainFilter({Key? key}) : super(key: key);

  @override
  State<MainFilter> createState() => _MainFilterState();
}

class _MainFilterState extends State<MainFilter> {
  MainController mainController = Get.find();

  final TextStyle _textStyle = TextStyle(
    fontWeight: FontWeight.w700,
    fontFamily: "NotoSansCJKkr",
    fontStyle: FontStyle.normal,
    fontSize: 14.0,
  );

  final List<FilterModel> _sortings = [FilterModel(sortingType: SortingType.newer), FilterModel(sortingType: SortingType.near)];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 58,
      margin: EdgeInsets.only(bottom: 11.0),
      color: Colors.white,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              decoration: BoxDecoration(border: Border(right: BorderSide(width: 1.0, color: Color(0xfff4f4f4)))),
              child: Row(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        ImageIcon(AssetImage("assets/icon/btn_hart_2_copy.png"), size: 24, color: Theme.of(context).primaryColor),
                        SizedBox(width: 8.0),
                        Text("내 이용지점 1", style: _textStyle),
                      ],
                    ),
                  ),
                  Expanded(
                    child: PopupMenuButton(
                      icon: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(mainController.sorting.value.sortingText, style: _textStyle),
                          SizedBox(width: 16.5),
                          ImageIcon(AssetImage("assets/icon/btn_search_copy.png"), size: 12),
                        ],
                      ),
                      onSelected: (FilterModel value) {},
                      itemBuilder: (BuildContext context) => List.generate(
                        _sortings.length,
                        (index) => PopupMenuItem(
                          value: _sortings[index],
                          child: Text(_sortings[index].sortingText),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(17.0),
            child: ImageIcon(
              AssetImage("assets/icon/btn_search.png"),
              size: 19,
            ),
          )
        ],
      ),
    );
  }
}
