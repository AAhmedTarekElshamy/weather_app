import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherService {
  final Dio dio;
  WeatherService(this.dio);

  final String baseUrl = 'https://api.weatherapi.com/v1';
  final String apiKey = '5b85214df92d4431b63133929232407';

  Future<WeatherModel> getForecastWeather({required String cityName}) async {
    try {
      final Response response = await dio
          .get('$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=1');
      WeatherModel weatherModel = WeatherModel.fromJson(response.data);
      return weatherModel;
    } on DioException catch (e) {
      final String errorMessage = e.response?.data['error']!['message'] ??
          'oops there was an error, try Later ';
      throw Exception(errorMessage);
    } catch(e){
      log(e.toString());
      throw Exception( 'oops there was an error, try Later ');
    }
  }
}
