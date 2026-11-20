class WeatherModel {
  final String city;
  final double temperature;
  final double feelsLike;
  final int humidity;
  final double windSpeed;
  final int weatherCode;
  final bool isDay;

  WeatherModel({
    required this.city,
    required this.temperature,
    required this.feelsLike,
    required this.humidity,
    required this.windSpeed,
    required this.weatherCode,
    required this.isDay,
  });

  factory WeatherModel.fromJson(
    String city,
    Map<String, dynamic> json,
  ) {
    return WeatherModel(
      city: city,
      temperature: (json['temperature_2m'] as num).toDouble(),
      feelsLike: (json['apparent_temperature'] as num).toDouble(),
      humidity: (json['relative_humidity_2m'] as num).toInt(),
      windSpeed: (json['wind_speed_10m'] as num).toDouble(),
      weatherCode: (json['weather_code'] as num).toInt(),
      isDay: (json['is_day'] as num).toInt() == 1,
    );
  }

  String get condition {
    switch (weatherCode) {
      case 0:
        return 'Clear sky';
      case 1:
        return 'Mainly clear';
      case 2:
        return 'Partly cloudy';
      case 3:
        return 'Overcast';
      case 45:
      case 48:
        return 'Foggy';
      case 51:
      case 53:
      case 55:
        return 'Drizzle';
      case 61:
      case 63:
      case 65:
        return 'Rain';
      case 71:
      case 73:
      case 75:
        return 'Snowfall';
      case 80:
      case 81:
      case 82:
        return 'Rain showers';
      case 95:
      case 96:
      case 99:
        return 'Thunderstorm';
      default:
        return 'Unknown condition';
    }
  }

  String get weatherIcon {
    if (weatherCode == 0) {
      return isDay ? '☀️' : '🌙';
    }
    if ([1, 2].contains(weatherCode)) return '🌤️';
    if ([3].contains(weatherCode)) return '☁️';
    if ([45, 48].contains(weatherCode)) return '🌫️';
    if ([51, 53, 55, 61, 63, 65, 80, 81, 82].contains(weatherCode)) {
      return '🌧️';
    }
    if ([71, 73, 75].contains(weatherCode)) return '❄️';
    if ([95, 96, 99].contains(weatherCode)) return '⛈️';

    return '🌡️';
  }
}
