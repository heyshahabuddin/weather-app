import 'package:flutter/material.dart';
import '../models/weather_model.dart';
import '../utils/date_formatter.dart';
import 'weather_card.dart';

class DailyForecastWidget extends StatelessWidget {
  final List<DailyData> dailyData;

  const DailyForecastWidget({
    super.key,
    required this.dailyData,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "10-Day Forecast",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: dailyData.length,
          itemBuilder: (context, index) {
            final data = dailyData[index];
            return WeatherCard(
              margin: const EdgeInsets.only(bottom: 10),
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Day ${index + 1}",
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        "${data.maxTemp}° / ${data.minTemp}°",
                        style: const TextStyle(color: Colors.white70),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildTimeRow(
                        Icons.wb_sunny,
                        Colors.orange,
                        DateFormatter.formatTime(data.sunrise),
                      ),
                      _buildTimeRow(
                        Icons.nights_stay,
                        Colors.blueAccent,
                        DateFormatter.formatTime(data.sunset),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _buildTimeRow(IconData icon, Color color, String time) {
    return Row(
      children: [
        Icon(icon, color: color, size: 16),
        const SizedBox(width: 5),
        Text(
          time,
          style: const TextStyle(color: Colors.white60, fontSize: 12),
        ),
      ],
    );
  }
}