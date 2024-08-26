import 'dart:async';

import 'package:clima_flutter/services/location.dart';
import 'package:clima_flutter/services/networking.dart';
const apiKey='335977a9ade4eeaf66c9abe8df9c4f24';
const openWeatherMapUrl='https://api.openweathermap.org/data/2.5/weather';
class WeatherModel{
  Future<dynamic> getCityWeather(String cityName)async{
    NetworkHelper networkHelper=NetworkHelper('$openWeatherMapUrl?q=$cityName&appid=$apiKey&units=metric');
    var weatherData=await networkHelper.getData();
    return weatherData;
  }
  Future<dynamic>getLocationWeather()async {
    Location location = Location();
    await location.getCurrentLocation();
    NetworkHelper networkHelper = NetworkHelper(
        '$openWeatherMapUrl?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric');
    var weatherData = await networkHelper.getData();
    return weatherData;
  }
  String getWeatherIcon(int condition){
    if(condition<300) {
        return '🌩️';
      }else if(condition<400) {
     return '🌧️';
    }else if(condition <600){
      return '☔';
    }else if(condition <700){
      return '☃️';
    }else if(condition<800) {
return '🌫️';
      }else if(condition==800){
      return '☁️';
    }else if(condition<=804){
      return '☀️';
    }else{
      return '🤷‍♂️';
    }
  }
  String getMessage(int temp){
    if(temp>25){
      return 'Is\'s 🍦 time in India!';
    }else if(temp>20){
      return 'time for shorts and 👕';
    }else if(temp<10){
      return 'you will need 🧣 and 🧤';
    }else {
      return 'bring a 🧥 in case';
    }
  }
}