import 'Condition.dart';

class TimeCondition extends Condition {
  DateTime time;

  TimeCondition(super.inverted, super.disabled, this.time);

  //If the time
  @override
  bool isMet() {
    DateTime currentTime = DateTime.now();

    return areSameTime(currentTime);
  }

  //If the passed time is the same as the stored time
  bool areSameTime(DateTime otherTime) {
    if (time.hour == otherTime.hour && time.minute == otherTime.minute) {
      return true;
    }

    return false;
  }
}