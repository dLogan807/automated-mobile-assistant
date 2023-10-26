import 'package:automated_mobile_assistant/models/conditions/condition.dart';
import 'package:automated_mobile_assistant/models/conditions/or_condition.dart';
import 'package:test/test.dart';

void main() {
  group('Or Condition', () {
    test('condition should be met if there are no conditions', () {
      OrCondition orCondition = Condition.type(false, false, ConditionType.or) as OrCondition;

      expect(orCondition.isMet(), true);
    });

    test('inverting should invert result', () {
      OrCondition orCondition = Condition.type(true, false, ConditionType.or) as OrCondition;

      expect(orCondition.isMet(), false);
    });
  });
}