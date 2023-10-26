import 'package:automated_mobile_assistant/models/conditions/and_condition.dart';
import 'package:automated_mobile_assistant/models/conditions/condition.dart';
import 'package:test/test.dart';

void main() {
  group('And Condition', () {
    test('condition should be met if there are no conditions', () {
      AndCondition andCondition = Condition.type(false, false, ConditionType.and) as AndCondition;

      expect(andCondition.isMet(), true);
    });

    test('inverting should invert result', () {
      AndCondition andCondition = Condition.type(true, false, ConditionType.and) as AndCondition;

      expect(andCondition.isMet(), false);
    });
  });
}