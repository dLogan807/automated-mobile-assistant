import 'package:automated_mobile_assistant/models/conditions/and_condition.dart';
import 'package:test/test.dart';

void main() {
  group('And Condition', () {
    test('condition should be met if there are no conditions', () {
      AndCondition andCondition = AndCondition(false, false);

      expect(andCondition.isMet(), true);
    });

    test('inverting should invert result', () {
      AndCondition andCondition = AndCondition(true, false);

      expect(andCondition.isMet(), false);
    });
  });
}