import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_application/model/weather_data.daily.dart';
import 'package:weather_application/model/weather_data.dart';
import 'package:weather_application/model/weather_data_current.dart';
import 'package:weather_application/model/weather_data_hourly.dart';

import '../utils/api_url.dart';

class FetchWeatherAPI {
  WeatherData? weatherData;

  //processing the data from response -> json

  Future<WeatherData> processData(lat, lon) async {
    var response = await http.get(
      Uri.parse(
        apiUrl(
          lat,
          lon,
        ),
      ),
    );
    var jsonString = jsonDecode(response.body);
    weatherData = WeatherData(
      WeatherDataCurrent.fromjson(jsonString),
      WeatherDataHourly.fromjson(jsonString),
      WeatherDataDaily.fromjson(jsonString),
    );
    return weatherData!;
  }
}


