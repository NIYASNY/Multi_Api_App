import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:multi_api_app/model/weather/current_weather_model.dart';
import 'package:multi_api_app/utils/api/weather/api_const.dart';

import '../../../model/weather/hour_weather_model.dart';

var link = 'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey&units=metric';
var hourLink = 'https://api.openweathermap.org/data/2.5/forecast?lat=$latitude&lon=$longitude&appid=$apiKey&units=metric';




getCurrentWeather()async{
   var res = await http.get(Uri.parse(link));
   if(res.statusCode == 200){
    var data = currentWeatherDataFromJson(res.body.toString());
    log("data recieved");
    return data;
   }
}
getHourWeather()async{
   var res = await http.get(Uri.parse(hourLink));
   if(res.statusCode == 200){
    var data = hourlyWeatherDataFromJson(res.body.toString());
    log("Hourdata recieved");
    return data;
   }
}