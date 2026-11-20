import 'package:flutter/material.dart';

import 'models/weather_model.dart';
import 'services/weather_service.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weather App',
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.blue,
        scaffoldBackgroundColor: const Color(0xFFF0F5FF),
      ),
      home: const WeatherHomePage(),
    );
  }
}

class WeatherHomePage extends StatefulWidget {
  const WeatherHomePage({super.key});

  @override
  State<WeatherHomePage> createState() => _WeatherHomePageState();
}

class _WeatherHomePageState extends State<WeatherHomePage> {
  final WeatherService _weatherService = WeatherService();
  final TextEditingController _cityController =
      TextEditingController(text: 'Bhubaneswar');

  WeatherModel? _weather;
  bool _isLoading = false;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _searchWeather();
  }

  @override
  void dispose() {
    _cityController.dispose();
    super.dispose();
  }

  Future<void> _searchWeather() async {
    final city = _cityController.text.trim();

    if (city.isEmpty) {
      setState(() {
        _errorMessage = 'Please enter a city name.';
        _weather = null;
      });
      return;
    }

    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      final result = await _weatherService.getWeather(city);

      if (!mounted) return;

      setState(() {
        _weather = result;
        _isLoading = false;
      });
    } catch (error) {
      if (!mounted) return;

      setState(() {
        _errorMessage = error
            .toString()
            .replaceFirst('Exception: ', '');
        _weather = null;
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Weather App',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            onPressed: _isLoading ? null : _searchWeather,
            icon: const Icon(Icons.refresh),
            tooltip: 'Refresh weather',
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const SizedBox(height: 15),
              const Icon(
                Icons.cloud,
                size: 65,
                color: Colors.blue,
              ),
              const SizedBox(height: 12),
              const Text(
                'Discover the Weather',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Search for weather in any city',
                style: TextStyle(color: Colors.black54),
              ),
              const SizedBox(height: 25),

              TextField(
                controller: _cityController,
                textInputAction: TextInputAction.search,
                onSubmitted: (_) => _searchWeather(),
                decoration: InputDecoration(
                  hintText: 'Enter city name',
                  prefixIcon: const Icon(Icons.location_city),
                  suffixIcon: IconButton(
                    onPressed: _isLoading ? null : _searchWeather,
                    icon: const Icon(Icons.search),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),

              const SizedBox(height: 30),

              if (_isLoading)
                const Padding(
                  padding: EdgeInsets.all(40),
                  child: Column(
                    children: [
                      CircularProgressIndicator(),
                      SizedBox(height: 15),
                      Text('Fetching weather information...'),
                    ],
                  ),
                )
              else if (_errorMessage != null)
                _buildError()
              else if (_weather != null)
                _buildWeatherCard(_weather!),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildError() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          const Icon(
            Icons.error_outline,
            color: Colors.red,
            size: 50,
          ),
          const SizedBox(height: 12),
          Text(
            _errorMessage!,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 15),
          ElevatedButton.icon(
            onPressed: _searchWeather,
            icon: const Icon(Icons.refresh),
            label: const Text('Try again'),
          ),
        ],
      ),
    );
  }

  Widget _buildWeatherCard(WeatherModel weather) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF2878D0), Color(0xFF70B8F5)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(28),
        boxShadow: [
          BoxShadow(
            color: Colors.blue.withValues(alpha: 0.2),
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        children: [
          const Icon(
            Icons.location_on,
            color: Colors.white,
          ),
          Text(
            weather.city,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            weather.weatherIcon,
            style: const TextStyle(fontSize: 75),
          ),
          const SizedBox(height: 10),
          Text(
            '${weather.temperature.toStringAsFixed(1)}°C',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 55,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            weather.condition,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            'Feels like ${weather.feelsLike.toStringAsFixed(1)}°C',
            style: const TextStyle(color: Colors.white70),
          ),
          const SizedBox(height: 30),
          Row(
            children: [
              Expanded(
                child: _weatherDetail(
                  Icons.water_drop,
                  'Humidity',
                  '${weather.humidity}%',
                ),
              ),
              Expanded(
                child: _weatherDetail(
                  Icons.air,
                  'Wind speed',
                  '${weather.windSpeed.toStringAsFixed(1)} km/h',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _weatherDetail(
    IconData icon,
    String title,
    String value,
  ) {
    return Column(
      children: [
        Icon(icon, color: Colors.white, size: 28),
        const SizedBox(height: 8),
        Text(
          title,
          style: const TextStyle(color: Colors.white70),
        ),
        const SizedBox(height: 5),
        Text(
          value,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}
