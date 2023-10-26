import 'package:automated_mobile_assistant/models/conditions/and_condition.dart';
import 'package:automated_mobile_assistant/models/conditions/days_condition.dart';
import 'package:automated_mobile_assistant/models/conditions/temperature_condition.dart';
import 'package:automated_mobile_assistant/models/conditions/time_condition.dart';
import 'package:automated_mobile_assistant/models/conditions/or_condition.dart';
import 'package:automated_mobile_assistant/models/conditions/location_condition.dart';
import 'package:automated_mobile_assistant/models/conditions/weather_condition.dart';

abstract class Condition {
  bool inverted;
  bool disabled;

  //Base constructor
  Condition(this.inverted, this.disabled);

  //Condition factory
  factory Condition.type(bool inverted, bool disabled, ConditionType type) {
    switch (type) {
      case ConditionType.time:
        return TimeCondition(inverted, disabled);
      case ConditionType.days:
        return DaysCondition(inverted, disabled);
      case ConditionType.location:
        return LocationCondition(inverted, disabled);
      case ConditionType.and:
        return AndCondition(inverted, disabled);
      case ConditionType.or:
        return OrCondition(inverted, disabled);
      case ConditionType.weather:
        return WeatherCondition(inverted, disabled);
      case ConditionType.temperature:
        return TemperatureCondition(inverted, disabled);
      default:
        throw UnimplementedError("Condition type does not exist!");
    }
  }

  //If the condition is met
  bool isMet();
}

//Enum of condition types
enum ConditionType {
  time,
  days,
  location,
  and,
  or,
  weather,
  temperature,
}