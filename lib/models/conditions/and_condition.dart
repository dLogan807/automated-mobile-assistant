import 'condition.dart';

class AndCondition extends Condition {
  late List<Condition> conditions;

  //Constructor
  AndCondition(super.inverted, super.disabled) {
    conditions = [];
  }

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