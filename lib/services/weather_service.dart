import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import '../models/weather_model.dart';
import 'package:http/http.dart' as http;

class WeatherService {
  static const BASE_URL = 'https://api.openweathermap.org/data/2.5/weather';
  final String apiKey = dotenv.env['OPEN_WEATHER_API_KEY']!;

  //Singleton initialisation
  static final WeatherService _instance = WeatherService._internal();

  //Return singleton instance of LocationService
  factory WeatherService() {
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