class WeatherModel {
  final double currentTemp;
  final double feelsLike;
  final double windSpeed;
  final int weatherCode;
  final List<HourlyData> hourlyForecast;
  final List<DailyData> dailyForecast;

  WeatherModel({
    required this.currentTemp,
    required this.feelsLike,
    required this.windSpeed,
    required this.weatherCode,
    required this.hourlyForecast,
    required this.dailyForecast,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    final current = json['current'];
    final hourly = json['hourly'];
    final daily = json['daily'];

    // Hourly data handle
    List<HourlyData> hourlyList = [];
    final tempList = hourly['temperature_2m'] as List;

    for (int i = 0; i < tempList.length; i++) {
      hourlyList.add(HourlyData(
        temperature: tempList[i].toDouble(),
        time: "Hour $i", // Simple time representation
      ));
    }

    List<DailyData> dailyList = [];
    final maxTempList = daily['temperature_2m_max'] as List;

    for (int i = 0; i < maxTempList.length; i++) {
      dailyList.add(DailyData(
        maxTemp: daily['temperature_2m_max'][i].toDouble(),
        minTemp: daily['temperature_2m_min'][i].toDouble(),
        sunrise: daily['sunrise'][i],
        sunset: daily['sunset'][i],
      ));
    }

    return WeatherModel(
      currentTemp: current['temperature_2m'].toDouble(),
      feelsLike: current['apparent_temperature'].toDouble(),
      windSpeed: current['wind_speed_10m'].toDouble(),
      weatherCode: current['weather_code'],
      hourlyForecast: hourlyList,
      dailyForecast: dailyList,
    );
  }
}

class HourlyData {
  final double temperature;
  final String time;

  HourlyData({required this.temperature, required this.time});
}

class DailyData {
  final double maxTemp;
  final double minTemp;
  final String sunrise;
  final String sunset;

  DailyData({
    required this.maxTemp,
    required this.minTemp,
    required this.sunrise,
    required this.sunset,
  });
}