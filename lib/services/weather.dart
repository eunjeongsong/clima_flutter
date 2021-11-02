import 'package:clima_flutter/services/location.dart';
import 'package:clima_flutter/services/networking.dart';

import '../key.dart';

const openWeatherMapURL = "https://api.openweathermap.org/data/2.5/weather";

class WeatherModel {
  Future<dynamic> getCityWeather(String cityName) {
    Uri url = Uri.parse("$openWeatherMapURL?q=$cityName&appid=$appId");
    return NetworkHelper(url).getData();
  }

  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    await location.getCurrentLocation();

    double latitude = location.latitude;
    double longitude = location.longitude;

    Uri url = Uri.parse(
        '$openWeatherMapURL?lat=$latitude&lon=$longitude&appid=$appId&units=metric');

    return NetworkHelper(url).getData();
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
