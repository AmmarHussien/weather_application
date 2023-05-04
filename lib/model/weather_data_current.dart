// instance for getting the api response\
class WeatherDataCurrent {
  final Current current;
  WeatherDataCurrent({
    required this.current,
  });

  factory WeatherDataCurrent.fromjson(Map<String, dynamic> json) =>
      WeatherDataCurrent(
        current: Current.fromJson(
          json['current'],
        ),
      );
}

class Current {
  double? temp;

  int? humidity;

  int? clouds;

  double? windSpeed;

  List<Weather>? weather;

  Current({
    this.temp,
    this.humidity,
    this.clouds,
    this.windSpeed,
    this.weather,
  });

  factory Current.fromJson(Map<String, dynamic> json) => Current(
        temp: (json['temp'] as num?)?.toDouble(),
        humidity: json['humidity'] as int?,
        clouds: json['clouds'] as int?,
        windSpeed: (json['wind_speed'] as num?)?.toDouble(),
        weather: (json['weather'] as List<dynamic>?)
            ?.map((e) => Weather.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'temp': temp,
        'humidity': humidity,
        'clouds': clouds,
        'wind_speed': windSpeed,
        'weather': weather?.map((e) => e.toJson()).toList(),
      };
}

class Weather {
  int? id;
  String? main;
  String? description;
  String? icon;

  Weather({
    this.id,
    this.description,
    this.icon,
    this.main,
  });

  factory Weather.fromJson(Map<String, dynamic> json) => Weather(
        id: (json['id'] as num?)?.toInt(),
        description: json['description'] as String?,
        icon: json['icon'] as String?,
        main: json['main'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'description': description,
        'icon': icon,
        'main': main,
      };
}
