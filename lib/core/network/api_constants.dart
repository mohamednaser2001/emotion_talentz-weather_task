

import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiConstants{
  static String baseUrl= dotenv.env['BASE_URL']??'';
  static String apiKey= dotenv.env['API_KEY']??'';


  static String weatherByCityEndPoint(String cityName)=> '$baseUrl?key=$apiKey&q=$cityName';
}