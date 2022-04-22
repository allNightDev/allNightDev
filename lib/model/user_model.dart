class UserModel {
  String userUid = "";
  String userId = "";
  String userName = "";
  String userJnum = "";
  Sex userSex = Sex.none;
  String pmobileNo = "";

  UserModel();

  UserModel.fromJson(Map<String, dynamic> json) {
    // 성별
    Sex _sex = Sex.none;
    json["userSex"] = json["userSex"] ?? "";
    if (json["userSex"] == "M") _sex = Sex.male;
    if (json["userSex"] == "F") _sex = Sex.female;
    userUid = json["userUid"] ?? "";
    userId = json["userid"] ?? "";
    userName = json["userName"] ?? "";
    userJnum = json["userJnum"] ?? "";
    userSex = _sex;
    pmobileNo = json["pmobileNo"] ?? "";
  }

  Map<String, dynamic> toJson() => {
        "userUid": userUid,
        "userid": userId,
        "userName": userName,
        "userJnum": userJnum,
        "userSex": userSex.enumToString(),
        "pmobileNo": pmobileNo,
      };
}

enum Sex {
  // 남자
  male,
  // 여자
  female,
  // 없음
  none,
}

extension HomeSexX on Sex {
  String enumToString() {
    switch (this) {
      case Sex.male:
        return "M";
      case Sex.female:
        return "F";
      default:
        return "";
    }
  }
}
