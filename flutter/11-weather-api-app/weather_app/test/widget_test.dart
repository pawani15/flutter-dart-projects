import 'package:flutter_test/flutter_test.dart';

import 'package:weather_app/main.dart';
import 'package:weather_app/models/weather_model.dart';

void main() {
  test('WeatherModel parses Open-Meteo current weather JSON', () {
    final weather = WeatherModel.fromJson('Bhubaneswar, India', {
      'temperature_2m': 31.4,
      'apparent_temperature': 36,
      'relative_humidity_2m': 70,
      'wind_speed_10m': 9.2,
      'weather_code': 2,
      'is_day': 1,
    });

    expect(weather.temperature, 31.4);
    expect(weather.feelsLike, 36.0);
    expect(weather.humidity, 70);
    expect(weather.condition, 'Partly cloudy');
    expect(weather.weatherIcon, '🌤️');
  });

  testWidgets('Home page shows the search UI', (WidgetTester tester) async {
    await tester.pumpWidget(const WeatherApp());

    expect(find.text('Discover the Weather'), findsOneWidget);
    expect(find.text('Bhubaneswar'), findsOneWidget);
  });
}
