import 'condition.dart';

class DaysCondition extends Condition {
  List<bool> days;

  //Constructor
  DaysCondition(super.inverted, super.disabled, this.days);

  //If the current day is enabled, return true
  @override
  bool isMet() {
    bool returnValue = false;

    DateTime currentTime = DateTime.now();

    for (bool day in days) {
      if (day && currentTime.weekday == (days.indexOf(day)) + 1) {
        returnValue = true;
        break;
      }
    }

    if (inverted) {
      return !returnValue;
    }
    return returnValue;
  }
}