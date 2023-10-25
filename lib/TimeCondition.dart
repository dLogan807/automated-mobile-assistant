import 'Condition.dart';

class TimeCondition extends Condition {
  DateTime time;

  //Constructor
  TimeCondition(super.inverted, super.disabled, this.time);

  //If condition's time is the same as the current time
  @override
  bool isMet() {
    bool returnValue;

    DateTime currentTime = DateTime.now();

    returnValue = _areSameTime(currentTime);

    if (inverted) {
      returnValue = !returnValue;
    }

    return returnValue;
  }

  //If the passed time is the same as the stored time
  bool _areSameTime(DateTime otherTime) => (time.hour == otherTime.hour && time.minute == otherTime.minute);
}