import 'condition.dart';

class AndCondition extends Condition {
  List<Condition> conditions;

  //Constructor
  AndCondition(super.inverted, super.disabled, this.conditions);

  //If any sub-condition is false
  @override
  bool isMet() {
    bool returnValue = true;

    for (Condition condition in conditions) {
      if (!condition.isMet()) {
        returnValue = false;
        break;
      }
    }

    if (inverted) {
      return !returnValue;
    }
    return returnValue;
  }
}