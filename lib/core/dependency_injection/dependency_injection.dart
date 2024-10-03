
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import '../../data/data_source/weather_data_source.dart';
import '../../data/repo/weather_repo.dart';
import '../theming/theme_cubit.dart';
import '../../presentation/view_model/weather_cubit.dart';
import '../network/dio_factory.dart';

final getIt = GetIt.instance;

Future<void> initGetIt()async {
  // Init Dio
  Dio dio= DioFactory.getDio();

  // Load .env file to use it in app.
  await dotenv.load(fileName: '.env');

  // Initialize SharedPreferences
  FlutterSecureStorage secureStorage = const FlutterSecureStorage();
  // Register SharedPreferences with GetIt
  getIt.registerSingleton<FlutterSecureStorage>(secureStorage);

  // Init theme cubit
  getIt.registerLazySingleton<ThemeCubit>(() => ThemeCubit(secureStorage));


  // Init Api Service
  // getIt.registerLazySingleton<ApiService>(() => ApiService(dio));



  // Weather cubit & Repo &   Data source
  getIt.registerLazySingleton<WeatherDataSource>(() => WeatherDataSourceImp(dio));
  getIt.registerLazySingleton<WeatherRepo>(() => WeatherRepoImp(getIt()));
  getIt.registerFactory<WeatherCubit>(() => WeatherCubit(getIt(), secureStorage));


}
