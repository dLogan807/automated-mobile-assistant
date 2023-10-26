import 'package:automated_mobile_assistant/models/conditions/condition.dart';
import 'package:automated_mobile_assistant/models/conditions/location_condition.dart';
import 'package:test/test.dart';
import 'package:geolocator/geolocator.dart';

void main() {
  group('Location Condition', () {
    test('Should return false if location could not be determined', () async {
      LocationCondition locationCondition = Condition.type(false, false, ConditionType.location) as LocationCondition;
      locationCondition.position = Position(longitude: 1, latitude: 1, timestamp: DateTime.now(), accuracy: 1, altitude: 1, altitudeAccuracy: 1, heading: 1, headingAccuracy: 1, speed: 1, speedAccuracy: 1);

      bool isMetValue = await locationCondition.isMetAsync();

      expect(isMetValue, false);
    });

    test('Should throw error if non async implementation used', () {
      LocationCondition locationCondition = Condition.type(false, false, ConditionType.location) as LocationCondition;

      expect(locationCondition.isMet, throwsUnsupportedError);
    });

    test('Should invert result if inverted', () async {
      LocationCondition locationCondition = Condition.type(true, false, ConditionType.location) as LocationCondition;
      locationCondition.position = Position(longitude: 1, latitude: 1, timestamp: DateTime.now(), accuracy: 1, altitude: 1, altitudeAccuracy: 1, heading: 1, headingAccuracy: 1, speed: 1, speedAccuracy: 1);

      bool isMetValue = await locationCondition.isMetAsync();

      expect(isMetValue, true);
    });
  });
}