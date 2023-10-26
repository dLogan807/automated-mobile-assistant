import 'package:automated_mobile_assistant/models/conditions/days_condition.dart';
import 'package:test/test.dart';

void main() {
  group('Days Condition', () {
    test('should not be met if the current day is disabled', () {
      DaysCondition daysCondition = DaysCondition(false, false);

      expect(daysCondition.isMet(), false);
    });

    test('should be met if the current day is enabled', () {
      DaysCondition daysCondition = DaysCondition(false, false);
      daysCondition.days.insert(DateTime.now().weekday - 1, true);

      expect(daysCondition.isMet(), true);
    });

    test('inverting should invert result', () {
      DaysCondition daysCondition = DaysCondition(true, false);

      expect(daysCondition.isMet(), true);
    });
  });
}