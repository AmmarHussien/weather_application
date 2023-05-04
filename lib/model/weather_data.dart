import 'weather_data_current.dart';

class WeatherData {
  final WeatherDataCurrent? current;

  WeatherData([this.current]);

  //functions to fetch value

  WeatherDataCurrent getCurrentWeather() => current!;
}
