import 'package:automated_mobile_assistant/models/conditions/days_condition.dart';
import 'package:test/test.dart';

void main() {
  group('Days Condition', () {
    test('should not be met if the current day is disabled', () {
      List<bool> days = [false, false, false, false, false, false, false];

      DaysCondition timeCondition = DaysCondition(false, false, days);

      expect(timeCondition.isMet(), false);
    });

    test('should be met if the current day is enabled', () {
      List<bool> days = [false, false, false, false, false, false, false];
      days.insert(DateTime.now().weekday - 1, true);

      DaysCondition timeCondition = DaysCondition(false, false, days);

      expect(timeCondition.isMet(), true);
    });

    test('inverting should invert result', () {
      List<bool> days = [false, false, false, false, false, false, false];

      DaysCondition timeCondition = DaysCondition(true, false, days);

      expect(timeCondition.isMet(), true);
    });
  });
}