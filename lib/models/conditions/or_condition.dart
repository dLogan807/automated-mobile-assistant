import 'condition.dart';

class OrCondition extends Condition {
  late List<Condition> conditions;

  //Constructor
  OrCondition(super.inverted, super.disabled) {
    conditions = [];
  }

  //An Or condition must be async to account for async conditions
  @override
  bool isMet() {
    throw throw UnsupportedError("Implementation is async");
  }

  //If any sub-condition is true
  @override
  Future<bool> isMetAsync() async {
    bool returnValue = true;

    for (Condition condition in conditions) {
      try {
        if (condition.isMet()) {
          returnValue = true;
          break;
        }
      }
      on UnsupportedError catch (e) {
        if (await condition.isMetAsync()) {
          returnValue = true;
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