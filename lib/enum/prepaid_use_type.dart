enum PrepaidUseType {
  time,
  deduction,
  none,
}

extension PrepaidUseTypeX on PrepaidUseType {}

PrepaidUseType prepaidUseTypeStringToEnum(value) {
  switch (value) {
    case "time":
      return PrepaidUseType.time;
    case "deduction":
      return PrepaidUseType.deduction;
    default:
      return PrepaidUseType.time;
  }
}
