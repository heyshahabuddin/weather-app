import 'package:flutter/material.dart';
import '../models/weather_model.dart';
import 'weather_card.dart';

class HourlyForecastWidget extends StatelessWidget {
  final List<HourlyData> hourlyData;

  const HourlyForecastWidget({
    super.key,
    required this.hourlyData,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Hourly Forecast",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 100,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: hourlyData.length > 24 ? 24 : hourlyData.length,
            itemBuilder: (context, index) {
              final data = hourlyData[index];
              return WeatherCard(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "${index}h",
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      "${data.temperature.toStringAsFixed(1)}°",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}