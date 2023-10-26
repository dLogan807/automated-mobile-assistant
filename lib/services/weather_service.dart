import 'dart:convert';
import 'package:automated_mobile_assistant/services/location_service.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import '../models/weather_model.dart';
import 'package:http/http.dart' as http;
import 'package:geolocator/geolocator.dart';

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

  //Get the weather at the current location
  Future<Weather> getCurrentWeather() async {
    LocationService locationService = LocationService();
    try {
      Position currentPosition = await locationService.determinePosition();

      final response = await http.get(Uri.parse('$BASE_URL?lat=${currentPosition.latitude}&lon=${currentPosition.longitude}&appid=$apiKey&units=metric'));

      if (response.statusCode == 200) {
        return Weather.fromJson(jsonDecode(response.body));
      }
      else {
        throw Exception('Failed to retrieve weather data');
      }
    }
    catch (e) {
      throw Exception('Failed to retrieve location data');
    }
  }
}