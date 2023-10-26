import 'package:automated_mobile_assistant/models/or_condition.dart';
import 'package:automated_mobile_assistant/models/condition.dart';
import 'package:test/test.dart';

void main() {
  group('Or Condition', () {
    test('condition should be met if there are no conditions', () {
      List<Condition> list = [];

      OrCondition andCondition = OrCondition(false, false, list);

      expect(andCondition.isMet(), true);
    });

    test('inverting should invert result', () {
      List<Condition> list = [];

      OrCondition andCondition = OrCondition(true, false, list);

      expect(andCondition.isMet(), false);
    });
  });
}