
import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../../data/models/weather_model.dart';
import '../../data/repo/weather_repo.dart';
import 'weather_states.dart';

class WeatherCubit extends Cubit<WeatherStates>{

  final WeatherRepo _weatherRepo;
  final FlutterSecureStorage _secureStorage;
  WeatherCubit(this._weatherRepo, this._secureStorage): super(WeatherInitStateStates()){
    getWeather('', fromSearch: false);
  }



  WeatherModel? weatherData;
  Future<void> getWeather(String city, {bool fromSearch= true}) async {
    try {
      emit(GetWeatherLoadingState());

      if(!fromSearch){
        throw('');
      }

      final result = await _weatherRepo.getWeatherData(city);
      print(result);

      result.when(success: (response)async {
        weatherData= response;
        await saveLatestWeatherData(response);
        emit(GetWeatherSuccessState(response));

      }, failure: (error)async {
        weatherData= await getWeatherDataFromLocal();
        emit(GetWeatherErrorState(error.errors??''));
      });

    } catch (e) {
      weatherData= await getWeatherDataFromLocal();
      emit(GetWeatherErrorState(e.toString()));
    }
  }


  // Save WeatherModel object to SharedPreferences to use it later in case of error.
  Future<void> saveLatestWeatherData(WeatherModel weatherData)async {
    String weatherDataString = json.encode(weatherData.toJson());
    await _secureStorage.write(key: 'WeatherData', value: weatherDataString);
  }


  // Retrieve WeatherModel object from SharedPreferences
  Future<WeatherModel?> getWeatherDataFromLocal() async {
    String? jsonString = await _secureStorage.read(key: 'WeatherData');
    if (jsonString != null) {
      Map<String, dynamic> jsonMap = json.decode(jsonString);
      return WeatherModel.fromMap(jsonMap);
    }
    return null;
  }

}