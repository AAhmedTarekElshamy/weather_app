import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubt/get_weather_states.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/weather_service.dart';

class GetForcastWeatherCubit extends Cubit<WeatherState> {
  GetForcastWeatherCubit( ):super(WeatherInitialState());

    WeatherModel? weatherModel;

   getForecastWeather({required String cityName})async{
    try {
     weatherModel = await WeatherService(Dio())
          .getForecastWeather(cityName: cityName);
      emit(WeatherLoadedState(weatherModel: weatherModel!));

    } catch (e){
      emit(WeatherFailureState(
         errorMessage: e.toString(),
      ));
    }
}

}