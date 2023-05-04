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

        const SizedBox(
          height: 20,
        ),
        //more details
        currentWeatherMoreDetailsWidget(),
      ],
    );
  }

  Widget temeratureAreaWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
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
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: '${weatherDataCurrent.current.temp}°',
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 68,
                  color: CustomColors.textColorBlack,
                ),
              ),
              TextSpan(
                text: '${weatherDataCurrent.current.weather![0].description}',
                style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget currentWeatherMoreDetailsWidget() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            moreDetailsCard('assets/icons/windspeed.png'),
            moreDetailsCard('assets/icons/clouds.png'),
            moreDetailsCard('assets/icons/humidity.png'),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            moreDetailsCardTitle('${weatherDataCurrent.current.windSpeed}KM/H'),
            moreDetailsCardTitle('${weatherDataCurrent.current.clouds}%'),
            moreDetailsCardTitle('${weatherDataCurrent.current.humidity}%'),
          ],
        )
      ],
    );
  }

  SizedBox moreDetailsCardTitle(String title) {
    return SizedBox(
      height: 20,
      width: 60,
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 12,
        ),
      ),
    );
  }

  Container moreDetailsCard(String image) {
    return Container(
      height: 60,
      width: 60,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: CustomColors.cardColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Image.asset(image),
    );
  }
}
