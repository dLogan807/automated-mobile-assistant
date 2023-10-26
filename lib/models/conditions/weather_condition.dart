import 'dart:convert';

import 'condition.dart';

class WeatherCondition extends Condition {
  late string weatherType;

  //Constructor
  WeatherCondition(super.inverted, super.disabled) {
    weatherType = 'clear sky';
  }

  //If condition's time is the same as the current time
  @override
  bool isMet() {
    bool returnValue;


    if (inverted) {
      return !returnValue;
    }
    return returnValue;
  }
}