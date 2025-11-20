import 'package:flutter/material.dart';
import '../models/weather_model.dart';

class CurrentWeatherWidget extends StatelessWidget {
  final WeatherModel weatherData;

  const CurrentWeatherWidget({
    super.key,
    required this.weatherData,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            "${weatherData.currentTemp}°C",
            style: const TextStyle(
              color: Colors.white,
              fontSize: 60,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            "Feels like ${weatherData.feelsLike}°C",
            style: const TextStyle(color: Colors.white70, fontSize: 16),
          ),
          const SizedBox(height: 10),
          const Text(
            "Current Weather",
            style: TextStyle(color: Colors.white54),
          ),
        ],
      ),
    );
  }
}