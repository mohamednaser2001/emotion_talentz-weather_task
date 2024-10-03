

import 'package:dio/dio.dart';
import '../../core/network/api_result.dart';
import '../../core/network/error/dio_error_handler.dart';
import '../../core/network/error_message_model.dart';
import '../data_source/weather_data_source.dart';
import '../models/weather_model.dart';

abstract class WeatherRepo{
  Future<ApiResult<WeatherModel>> getWeatherData(String cityName);
}


class WeatherRepoImp extends WeatherRepo{

  final WeatherDataSource weatherDataSource;
  WeatherRepoImp(this.weatherDataSource);


  @override
  Future<ApiResult<WeatherModel>> getWeatherData(String cityName) async {

    try{
      final response= await weatherDataSource.getWeatherData(cityName);
      return ApiResult.success(response);
    } on DioException catch(error){
      return ApiResult.failure(DioErrorHandler.handleDioError(error));
    }catch(error){
      return ApiResult.failure(ErrorMessageModel(errors: 'Error, please try again'));
    }
  }
}