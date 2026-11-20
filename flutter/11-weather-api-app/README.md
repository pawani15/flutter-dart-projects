# Weather App – Flutter API Integration

## Overview

A Flutter weather application that fetches live weather
information using the Open-Meteo public API.

## Features

- Search weather by city name
- Fetch weather data using HTTP requests
- Display current temperature
- Display weather condition
- Display location name and country
- Display feels-like temperature
- Display humidity and wind speed
- Loading indicator while fetching data
- Error handling for invalid cities and API failures
- Refresh weather information

## API Used

Open-Meteo:
- Geocoding API:
  https://geocoding-api.open-meteo.com/v1/search

- Forecast API:
  https://api.open-meteo.com/v1/forecast

No API key is required.

## Technologies

- Flutter
- Dart
- HTTP package
- REST API
- JSON parsing
- StatefulWidget

## Project Structure

```text
weather_app/
├── lib/
│   ├── main.dart
│   ├── models/
│   │   └── weather_model.dart
│   └── services/
│       └── weather_service.dart
└── pubspec.yaml
```
