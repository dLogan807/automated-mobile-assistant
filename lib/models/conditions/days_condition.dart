import 'condition.dart';

class DaysCondition extends Condition {
  late List<bool> days;

  //Constructor
  DaysCondition(super.inverted, super.disabled) {
    days = [false, false, false, false, false, false, false];
  }

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

  //Async is not required
  @override
  Future<bool> isMetAsync() {
    throw throw UnsupportedError("Implementation is not async");
  }
}