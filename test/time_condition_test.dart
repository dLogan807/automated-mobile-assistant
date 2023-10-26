import 'package:automated_mobile_assistant/models/conditions/time_condition.dart';
import 'package:test/test.dart';

void main() {
  group('Time Condition', () {
    test('two times should be the same if they have the same minute and hour', () {
      DateTime setTime = DateTime.now();

      TimeCondition timeCondition = TimeCondition(false, false, setTime);

      expect(timeCondition.isMet(), true);
    });

    test('two times should NOT be the same if they do not have the same hour', () {
      DateTime setTime = DateTime.now();
      setTime = setTime.add(const Duration(hours: 1));

      TimeCondition timeCondition = TimeCondition(false, false, setTime);

      expect(timeCondition.isMet(), false);
    });

    test('two times should NOT be the same if they do not have the same minute', () {
      DateTime setTime = DateTime.now();
      setTime = setTime.add(const Duration(minutes: 1));

      TimeCondition timeCondition = TimeCondition(false, false, setTime);

      expect(timeCondition.isMet(), false);
    });

    test('inverting should invert result', () {
      DateTime setTime = DateTime.now();

      TimeCondition timeCondition = TimeCondition(true, false, setTime);

      expect(timeCondition.isMet(), false);
    });
  });
}