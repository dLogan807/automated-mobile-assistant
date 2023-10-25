import 'Condition.dart';

class TimeCondition extends Condition {
  DateTime time;

  TimeCondition(super.inverted, super.disabled, this.time);

  //If the
  @override
  bool isMet() {
    DateTime currentTime = DateTime.now();

    return true;
  }

}