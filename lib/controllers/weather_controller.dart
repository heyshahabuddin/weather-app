import 'package:flutter/material.dart';
import '../data/weather_repository.dart';
import '../models/weather_model.dart';
import '../utils/location_service.dart';

class WeatherController extends ChangeNotifier {
  final WeatherRepository _repository = WeatherRepository();

  bool _isLoading = false;
  WeatherModel? _weatherData;
  String? _errorMessage;
  String _locationName = "Loading...";

  bool get isLoading => _isLoading;
  WeatherModel? get weatherData => _weatherData;
  String? get errorMessage => _errorMessage;
  String get locationName => _locationName;

  Future<void> fetchWeather() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final position = await LocationService.getCurrentLocation();
      final lat = position.latitude;
      final lon = position.longitude;

      // Fetch location name
      _locationName = await _repository.getLocationName(lat, lon);
      notifyListeners();

      // Fetch weather data
      _weatherData = await _repository.fetchWeather(lat, lon);
    } catch (e) {
      _errorMessage = e.toString();
    }

    _isLoading = false;
    notifyListeners();
  }
}