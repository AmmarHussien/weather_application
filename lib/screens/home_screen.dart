import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_application/controller/global_controller.dart';
import 'package:weather_application/widget/header_widget.dart';

import '../widget/current_weather_widget.dart';
import '../widget/hourly_weather_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //call
  final GlobalController globalController = Get.put(
    GlobalController(),
    permanent: true,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Obx(
          () => globalController.checkLoading().isTrue
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Center(
                  child: ListView(
                    scrollDirection: Axis.vertical,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      const HeaderWidget(),
                      //for our current temperature
                      CurrentWeatherWidget(
                        weatherDataCurrent:
                            globalController.getData().getCurrentWeather(),
                      ),
                      HourlyWeatherWidget(
                        weatherDataHourly: globalController.getData().getHourlyWeather(),
                      ),


                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
