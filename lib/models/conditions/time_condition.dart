import 'condition.dart';

class TimeCondition extends Condition {
  late DateTime time;

  //Constructor
  TimeCondition(super.inverted, super.disabled) {
   time = DateTime.now();
  }

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
  bool _areSameTime(DateTime otherTime) => (time.hour == otherTime.hour && time.minute == otherTime.minute);

  //Async is not required
  @override
  Future<bool> isMetAsync() {
    throw throw UnsupportedError("Implementation is not async");
  }
}