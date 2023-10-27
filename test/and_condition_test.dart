import 'package:automated_mobile_assistant/models/conditions/and_condition.dart';
import 'package:automated_mobile_assistant/models/conditions/condition.dart';
import 'package:test/test.dart';

void main() {
  group('And Condition', () {
    test('condition should be met if there are no conditions', () async {
      AndCondition andCondition = Condition.type(false, false, ConditionType.and) as AndCondition;

      expect(await andCondition.isMetAsync(), true);
    });

    test('inverting should invert result', () async {
      AndCondition andCondition = Condition.type(true, false, ConditionType.and) as AndCondition;

      expect(await andCondition.isMetAsync(), false);
    });
  });
}