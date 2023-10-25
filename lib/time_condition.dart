import 'condition.dart';

class TimeCondition extends Condition {
  DateTime setTime;

  //Constructor
  TimeCondition(super.inverted, super.disabled, this.setTime);

  //If condition's time is the same as the current time
  @override
  bool isMet() {
    bool returnValue;

    DateTime currentTime = DateTime.now();

    returnValue = _areSameTime(currentTime);

    if (inverted) {
      return !returnValue;
    }
    return returnValue;
  }

  //If the passed time is the same as the stored time
  bool _areSameTime(DateTime otherTime) => (setTime.hour == otherTime.hour && setTime.minute == otherTime.minute);
}