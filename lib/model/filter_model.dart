class FilterModel {
  SortingType sortingType;

  FilterModel({this.sortingType = SortingType.newer});

  get sortingText => sortingType.enumToString();
}

enum SortingType {
  newer,
  near,
}

extension SortingTypeX on SortingType {
  String enumToString() {
    switch (this) {
      case SortingType.newer:
        return "새로운 순";
      case SortingType.near:
        return "가까운 순";
      default:
        return "";
    }
  }
}
