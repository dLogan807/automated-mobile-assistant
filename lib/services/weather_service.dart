import 'dart:convert';

import '../models/weather_model.dart';
import 'package:http/http.dart' as http;

class WeatherService {
  static const BASE_URL = 'https://api.openweathermap.org/data/2.5/weather';
  late String apiKey;

  //Singleton initialisation
  static final WeatherService _instance = WeatherService._internal();

  //Return singleton instance of LocationService
  factory WeatherService(String apiKey) {
    _instance.apiKey = apiKey;
    return _instance;
  }

  //Constructor - called once only
  WeatherService._internal();

  Future<Weather> getWeather(double latitude, double longitude) async {
    final response = await http.get(Uri.parse('$BASE_URL?lat=$latitude&lon=$longitude&appid=$apiKey&units=metric'));

    if (response.statusCode == 200) {
      return Weather.fromJson(jsonDecode(response.body));
    }
    else {
      throw Exception('Failed to retrieve weather data');
    }
  }
}