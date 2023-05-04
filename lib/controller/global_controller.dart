import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:weather_application/api/fetch_weather.dart';
import 'package:weather_application/model/weather_data.dart';

class GlobalController extends GetxController {
  //create various variables
  final RxBool _isLoading = true.obs;
  final RxDouble _lattitude = 0.0.obs;
  final RxDouble _longitude = 0.0.obs;

  //instance for them to be called
  RxBool checkLoading() => _isLoading;
  RxDouble getLattitude() => _lattitude;
  RxDouble getLongitude() => _longitude;

  final weatherData = WeatherData().obs;

  WeatherData getData() {
    return weatherData.value;
  }

  @override
  void onInit() {
    if (_isLoading.isTrue) {
      getLocation();
    }
    super.onInit();
  }

  getLocation() async {
    bool isServiceEnabled;
    LocationPermission locationPermission;
    isServiceEnabled = await Geolocator.isLocationServiceEnabled();

    // return if service is not enabled
    if (!isServiceEnabled) {
      return Future.error('Location service is not enabled');
    }

    //status of permission
    locationPermission = await Geolocator.checkPermission();
    if (locationPermission == LocationPermission.deniedForever) {
      return Future.error('Location permission is denied forever');
    } else if (locationPermission == LocationPermission.denied) {
      //request permission
      locationPermission = await Geolocator.requestPermission();
      if (locationPermission == LocationPermission.denied) {
        return Future.error('Location permission is denied');
      }
    }

    //getting the current location
    return await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high)
        .then((value) => {
              //update our  latitude, longitude
              _lattitude.value = value.latitude,
              _longitude.value = value.longitude,

              //calling our api
              FetchWeatherAPI()
                  .processData(
                value.altitude,
                value.longitude,
              )
                  .then((value) {
                weatherData.value = value;
                _isLoading.value = false;
              }),
            });
  }
}
