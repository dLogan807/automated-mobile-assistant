import 'package:automated_mobile_assistant/models/conditions/condition.dart';
import 'package:automated_mobile_assistant/models/conditions/weather_condition.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:test/test.dart';
import 'package:geolocator/geolocator.dart';

void main() {
  group('Weather Condition', () {
    test('Should return false if weather could not be determined', () async {
      dotenv.testLoad(fileInput: '''OPEN_WEATHER_API_KEY=12345abc''');

      WeatherCondition weatherCondition = Condition.type(false, false, ConditionType.weather) as WeatherCondition;

      bool isMetValue = await weatherCondition.isMetAsync();

      expect(isMetValue, false);
    });

    test('Should throw error if non async implementation used', () async {
      dotenv.testLoad(fileInput: '''OPEN_WEATHER_API_KEY=12345abc''');
      WeatherCondition weatherCondition = Condition.type(false, false, ConditionType.weather) as WeatherCondition;

      expect(weatherCondition.isMet, throwsUnsupportedError);
    });

    test('Should invert result if inverted', () async {
      dotenv.testLoad(fileInput: '''OPEN_WEATHER_API_KEY=12345abc''');
      WeatherCondition weatherCondition = Condition.type(true, false, ConditionType.weather) as WeatherCondition;

      bool isMetValue = await weatherCondition.isMetAsync();

      expect(isMetValue, true);
    });
  });
}