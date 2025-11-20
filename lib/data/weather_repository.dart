import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/weather_model.dart';

class WeatherRepository {
  static const String _baseUrl = "https://api.open-meteo.com/v1/forecast";
  static const String _reverseGeoUrl = "https://nominatim.openstreetmap.org/reverse";

  Future<WeatherModel> fetchWeather(double lat, double lon) async {
    final url = "$_baseUrl?latitude=$lat&longitude=$lon"
        "&current=temperature_2m,apparent_temperature,weather_code,wind_speed_10m"
        "&hourly=temperature_2m,weather_code,wind_speed_10m"
        "&daily=temperature_2m_max,temperature_2m_min,sunrise,sunset"
        "&forecast_days=10&timezone=Asia%2FDhaka";

    print("API URL: $url"); // Debug

    final response = await http.get(Uri.parse(url));

    print("Status Code: ${response.statusCode}"); // Debug
    print("Response Body: ${response.body}"); // Debug

    if (response.statusCode == 200) {
      return WeatherModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load weather data');
    }
  }

  Future<String> getLocationName(double lat, double lon) async {
    try {
      final url = "$_reverseGeoUrl?lat=$lat&lon=$lon&format=json";
      final response = await http.get(
        Uri.parse(url),
        headers: {'User-Agent': 'WeatherApp/1.0'},
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data["address"]["city"] ??
            data["address"]["town"] ??
            data["address"]["village"] ??
            data["address"]["state"] ??
            "Unknown Location";
      }
      return "Location unavailable";
    } catch (e) {
      return "Location unavailable";
    }
  }
}