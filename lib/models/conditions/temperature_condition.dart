import '../weather_model.dart';
import 'package:automated_mobile_assistant/services/weather_service.dart';

import 'condition.dart';

class TemperatureCondition extends Condition {
  late double temperature;

  //Constructor
  TemperatureCondition(super.inverted, super.disabled) {
    temperature = 21.0;
  }

  //A temperature request must be async
  @override
  bool isMet() {
    throw UnsupportedError("Implementation is async");
  }

  //If current temperature is the same as the specified temperature
  @override
  Future<bool> isMetAsync() async {
    bool returnValue = false;

    WeatherService weatherService = WeatherService();

    try {
      Weather currentWeather = await weatherService.getCurrentWeather();

      if (currentWeather.temperature == temperature) {
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