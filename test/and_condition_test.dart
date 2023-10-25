import 'package:automated_mobile_assistant/and_condition.dart';
import 'package:automated_mobile_assistant/condition.dart';
import 'package:test/test.dart';

void main() {
  group('AndCondition', () {
    test('condition should be met if there are no conditions', () {
      List<Condition> list = [];

      AndCondition andCondition = AndCondition(false, false, list);

      expect(andCondition.isMet(), true);
    });

    test('inverting should invert result', () {
      List<Condition> list = [];

      AndCondition andCondition = AndCondition(true, false, list);

      expect(andCondition.isMet(), false);
    });
  });
}