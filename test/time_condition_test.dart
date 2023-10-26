import 'package:automated_mobile_assistant/models/conditions/time_condition.dart';
import 'package:test/test.dart';

void main() {
  group('Time Condition', () {
    test('two times should be the same if they have the same minute and hour', () {
      TimeCondition timeCondition = TimeCondition(false, false);

      expect(timeCondition.isMet(), true);
    });

    test('two times should NOT be the same if they do not have the same hour', () {
      TimeCondition timeCondition = TimeCondition(false, false);
      timeCondition.time = timeCondition.time.add(const Duration(hours: 1));

      expect(timeCondition.isMet(), false);
    });

    test('two times should NOT be the same if they do not have the same minute', () {
      TimeCondition timeCondition = TimeCondition(false, false);
      timeCondition.time = timeCondition.time.add(const Duration(minutes: 1));

      expect(timeCondition.isMet(), false);
    });

    test('inverting should invert result', () {
      TimeCondition timeCondition = TimeCondition(true, false);

      expect(timeCondition.isMet(), false);
    });
  });
}