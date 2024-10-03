

import 'package:dio/dio.dart';

import '../../core/network/api_constants.dart';
import '../models/weather_model.dart';

abstract class WeatherDataSource {

  Future<WeatherModel> getWeatherData(String cityName);
}



class WeatherDataSourceImp extends WeatherDataSource{

  final Dio _dio;
  WeatherDataSourceImp(this._dio);

  @override
  Future<WeatherModel> getWeatherData(String cityName)async {
    final response = await _dio.get(
      ApiConstants.weatherByCityEndPoint(cityName),
    );
    return WeatherModel.fromJson(response.data);
  }
}