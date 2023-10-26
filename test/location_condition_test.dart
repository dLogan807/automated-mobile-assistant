import 'package:automated_mobile_assistant/models/conditions/location_condition.dart';
import 'package:test/test.dart';
import 'package:geolocator/geolocator.dart';

void main() {
  group('Location Condition', () {
    test('Should return false if location could not be determined', () async {
      Position setPosition = Position(longitude: 1, latitude: 1, timestamp: DateTime.now(), accuracy: 1, altitude: 1, altitudeAccuracy: 1, heading: 1, headingAccuracy: 1, speed: 1, speedAccuracy: 1);
      
      LocationCondition locationCondition = LocationCondition(false, false, setPosition);

      bool isMetValue = await locationCondition.isMetAsync();

      expect(isMetValue, false);
    });

    test('Should throw error if non async implementation used', () {
      Position setPosition = Position(longitude: 1, latitude: 1, timestamp: DateTime.now(), accuracy: 1, altitude: 1, altitudeAccuracy: 1, heading: 1, headingAccuracy: 1, speed: 1, speedAccuracy: 1);

      LocationCondition locationCondition = LocationCondition(false, false, setPosition);

      expect(locationCondition.isMet, throwsUnsupportedError);
    });

    test('Should invert result if inverted', () async {
      Position setPosition = Position(longitude: 1, latitude: 1, timestamp: DateTime.now(), accuracy: 1, altitude: 1, altitudeAccuracy: 1, heading: 1, headingAccuracy: 1, speed: 1, speedAccuracy: 1);

      LocationCondition locationCondition = LocationCondition(true, false, setPosition);

      bool isMetValue = await locationCondition.isMetAsync();

      expect(isMetValue, true);
    });
  });
}