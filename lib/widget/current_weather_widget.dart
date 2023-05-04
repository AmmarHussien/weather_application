import 'package:flutter/material.dart';
import 'package:weather_application/model/weather_data_current.dart';
import 'package:weather_application/utils/custom_colors.dart';

class CurrentWeatherWidget extends StatelessWidget {
  final WeatherDataCurrent weatherDataCurrent;
  const CurrentWeatherWidget({super.key, required this.weatherDataCurrent});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //Temperature area
        temeratureAreaWidget(),
        //more details
        currentWeatherMoreDetailsWidget(),
      ],
    );
  }

  Widget temeratureAreaWidget() {
    return Row(
      children: [
        Image.asset(
          'assets/weather/${weatherDataCurrent.current.weather![0].icon}.png',
          height: 80,
          width: 80,
        ),
        Container(
          height: 50,
          width: 1,
          color: CustomColors.dividerLine,
        ),
      ],
    );
  }

  Widget currentWeatherMoreDetailsWidget() {
    return Container();
  }
}
