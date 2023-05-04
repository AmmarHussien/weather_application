class WeatherDataHourly {
  final List<Hourly> hourly;
  WeatherDataHourly({
    required this.hourly,
  });

  factory WeatherDataHourly.fromjson(Map<String, dynamic> json) =>
      WeatherDataHourly(
        hourly: List<Hourly>.from(
          json['hourly'].map(
            (e) => Hourly.fromJson(e),
          ),
        ),
      );
}

class Hourly {
  int? dt;
  int? temp;

  List<Weather>? weather;

  Hourly({
    this.dt,
    this.temp,
    this.weather,
  });

  factory Hourly.fromJson(Map<String, dynamic> json) => Hourly(
        dt: json['dt'] as int?,
        temp: (json['temp'] as num?)?.round(),
        weather: (json['weather'] as List<dynamic>?)
            ?.map((e) => Weather.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'dt': dt,
        'temp': temp,
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
