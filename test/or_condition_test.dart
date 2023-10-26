import 'package:automated_mobile_assistant/models/conditions/or_condition.dart';
import 'package:automated_mobile_assistant/models/conditions/condition.dart';
import 'package:test/test.dart';

void main() {
  group('Or Condition', () {
    test('condition should be met if there are no conditions', () {
      OrCondition andCondition = OrCondition(false, false);

      expect(andCondition.isMet(), true);
    });

    test('inverting should invert result', () {
      OrCondition andCondition = OrCondition(true, false);

      expect(andCondition.isMet(), false);
    });
  });
}