import 'package:automated_mobile_assistant/models/conditions/condition.dart';
import 'package:automated_mobile_assistant/models/conditions/temperature_condition.dart';
import 'package:automated_mobile_assistant/models/conditions/weather_condition.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:test/test.dart';
import 'package:geolocator/geolocator.dart';

void main() {
  group('Temperature Condition', () {
    test('Should return false if temperature could not be determined', () async {
      await dotenv.load(fileName: ".env");

      TemperatureCondition temperatureCondition = Condition.type(false, false, ConditionType.temperature) as TemperatureCondition;

      bool isMetValue = await temperatureCondition.isMetAsync();

      expect(isMetValue, false);
    });

    test('Should throw error if non async implementation used', () async {
      await dotenv.load(fileName: ".env");
      TemperatureCondition temperatureCondition = Condition.type(false, false, ConditionType.temperature) as TemperatureCondition;

      expect(temperatureCondition.isMet, throwsUnsupportedError);
    });

    test('Should invert result if inverted', () async {
      await dotenv.load(fileName: ".env");
      TemperatureCondition temperatureCondition = Condition.type(true, false, ConditionType.temperature) as TemperatureCondition;

      bool isMetValue = await temperatureCondition.isMetAsync();

      expect(isMetValue, true);
    });
  });
}