import 'condition.dart';

class OrCondition extends Condition {
  List<Condition> conditions;

  //Constructor
  OrCondition(super.inverted, super.disabled, this.conditions);

  //If any sub-condition is true
  @override
  bool isMet() {
    bool returnValue = true;

    for (Condition condition in conditions) {
      if (condition.isMet()) {
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