import 'condition.dart';

class AndCondition extends Condition {
  late List<Condition> conditions;

  //Constructor
  AndCondition(super.inverted, super.disabled) {
    conditions = [];
  }

  //An And condition must be async to account for async conditions
  @override
  bool isMet() {
    throw throw UnsupportedError("Implementation is async");
  }

  //If any sub-condition is false
  @override
  Future<bool> isMetAsync() async {
    bool returnValue = true;

    for (Condition condition in conditions) {
      try {
        if (!condition.isMet()) {
          returnValue = false;
          break;
        }
      }
      on UnsupportedError catch (e) {
        if (!(await condition.isMetAsync())) {
          returnValue = false;
          break;
        }
      }
    }

    if (inverted) {
      return !returnValue;
    }
    return returnValue;
  }
}