class Weather {
  final double temperature;
  final String mainCondition;

  //Constructor
  Weather({
    required this.temperature,
    required this.mainCondition,
  });

  //Factory to convert data from JSON
  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      temperature: json['main']['temp'].toDouble(),
      mainCondition: json['weather'][0]['main'],
    );
  }
}