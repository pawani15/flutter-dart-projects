import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/weather_model.dart';

class WeatherService {
  static const String _geocodingUrl =
      'https://geocoding-api.open-meteo.com/v1/search';

  static const String _weatherUrl =
      'https://api.open-meteo.com/v1/forecast';

  Future<WeatherModel> getWeather(String city) async {
    final searchUri = Uri.parse(_geocodingUrl).replace(
      queryParameters: {
        'name': city,
        'count': '1',
        'language': 'en',
        'format': 'json',
      },
    );

    final locationResponse = await http
        .get(searchUri)
        .timeout(const Duration(seconds: 15));

    if (locationResponse.statusCode != 200) {
      throw Exception('Unable to find the city. Please try again.');
    }

    final locationData =
        jsonDecode(locationResponse.body) as Map<String, dynamic>;

    final results = locationData['results'] as List?;

    if (results == null || results.isEmpty) {
      throw Exception('City not found. Check the city name.');
    }

    final location = results.first as Map<String, dynamic>;

    final latitude = location['latitude'] as num;
    final longitude = location['longitude'] as num;

    final cityName = location['name'] as String? ?? city;
    final country = location['country'] as String? ?? '';

    final displayName =
        country.isEmpty ? cityName : '$cityName, $country';

    final weatherUri = Uri.parse(_weatherUrl).replace(
      queryParameters: {
        'latitude': latitude.toString(),
        'longitude': longitude.toString(),
        'current':
            'temperature_2m,relative_humidity_2m,apparent_temperature,weather_code,is_day,wind_speed_10m',
        'timezone': 'auto',
      },
    );

    final weatherResponse = await http
        .get(weatherUri)
        .timeout(const Duration(seconds: 15));

    if (weatherResponse.statusCode != 200) {
      throw Exception('Unable to fetch weather data.');
    }

    final weatherData =
        jsonDecode(weatherResponse.body) as Map<String, dynamic>;

    final current = weatherData['current'] as Map<String, dynamic>?;

    if (current == null) {
      throw Exception('Weather information is unavailable.');
    }

    return WeatherModel.fromJson(displayName, current);
  }
}
