import '../weather_model.dart';
import 'package:automated_mobile_assistant/services/weather_service.dart';

import 'condition.dart';

class WeatherCondition extends Condition {
  late String weatherType;

  //Constructor
  WeatherCondition(super.inverted, super.disabled) {
    weatherType = 'clear sky';
  }

  //A weather request must be async
  @override
  bool isMet() {
    throw UnsupportedError("Implementation is async");
  }

  //If current weather is the same as the specified weather
  @override
  Future<bool> isMetAsync() async {
    bool returnValue = false;

    WeatherService weatherService = WeatherService();

    try {
      Weather currentWeather = await weatherService.getCurrentWeather();

      if (currentWeather.mainCondition == weatherType) {
        returnValue = true;
      }
    }
    catch (e) {}

    if (inverted) {
      return !returnValue;
    }
    return returnValue;
  }
}