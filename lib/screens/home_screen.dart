import 'package:flutter/material.dart';
import '../controllers/weather_controller.dart';
import '../widgets/header_widget.dart';
import '../widgets/current_weather_widget.dart';
import '../widgets/hourly_forecast_widget.dart';
import '../widgets/daily_forecast_widget.dart';
import '../utils/date_formatter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final WeatherController _controller = WeatherController();
  String _currentTime = "";

  @override
  void initState() {
    super.initState();
    // Controller এর state change লিসেন করার জন্য
    _controller.addListener(() {
      setState(() {});
    });
    _controller.fetchWeather();
    _updateTime();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _updateTime() {
    if (mounted) {
      setState(() {
        _currentTime = DateFormatter.formatFullDateTime(DateTime.now());
      });
      Future.delayed(const Duration(seconds: 1), _updateTime);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F1123),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              HeaderWidget(
                locationName: _controller.locationName,
                currentTime: _currentTime,
              ),
              const SizedBox(height: 20),

              if (_controller.isLoading)
                const Expanded(
                  child: Center(child: CircularProgressIndicator()),
                ),

              if (_controller.errorMessage != null && !_controller.isLoading)
                Expanded(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.error_outline,
                          color: Colors.redAccent,
                          size: 60,
                        ),
                        const SizedBox(height: 20),
                        Text(
                          _controller.errorMessage!,
                          style: const TextStyle(color: Colors.redAccent),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () {
                            _controller.fetchWeather();
                          },
                          child: const Text('Retry'),
                        ),
                      ],
                    ),
                  ),
                ),

              if (_controller.weatherData != null && !_controller.isLoading)
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CurrentWeatherWidget(
                          weatherData: _controller.weatherData!,
                        ),
                        const SizedBox(height: 30),
                        HourlyForecastWidget(
                          hourlyData: _controller.weatherData!.hourlyForecast,
                        ),
                        const SizedBox(height: 20),
                        DailyForecastWidget(
                          dailyData: _controller.weatherData!.dailyForecast,
                        ),
                      ],
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}