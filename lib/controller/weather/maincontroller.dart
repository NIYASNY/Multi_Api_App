import 'package:flutter/material.dart';
import 'package:multi_api_app/utils/api/weather/wapi.dart';
import 'package:get/get.dart';


//maincontroller page
class MainController extends GetxController{

 
  void onInit(){
    currentWeatherData = getCurrentWeather();
    hourWeatherData = getHourWeather();
    super.onInit();
  }

  Rx<ThemeMode> themeMode = Rx<ThemeMode>(ThemeMode.light);
  var currentWeatherData;
  var hourWeatherData;
  
  final RxBool _isLoading = true.obs;
  final RxDouble _latitude = 0.0.obs;
  final RxDouble _longitude = 0.0.obs;


   // instance for them to be called
  RxBool checkLoading() => _isLoading;
  RxDouble getLattitude() => _latitude;
  RxDouble getLongitude() => _longitude;


changeTheme(){
  themeMode.value = themeMode.value == ThemeMode.light
        ? ThemeMode.dark
        : ThemeMode.light;

        return themeMode.value;
}

}