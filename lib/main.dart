import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubt/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_weather_cubt/get_weather_states.dart';
import 'package:weather_app/screens/home_page.dart';

void main() {
  runApp(  MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetForcastWeatherCubit(),
      child: Builder(builder: (context) {
        return BlocBuilder<GetForcastWeatherCubit, WeatherState>(
          builder:(BuildContext context, state) {
            // Check if weatherModel is null before accessing its properties
            final weatherModel = BlocProvider.of<GetForcastWeatherCubit>(context).weatherModel;
            final themeColor = weatherModel != null ? getThemeColor(weatherModel.status) : Colors.green;

            return MaterialApp(
              theme: ThemeData(
               // brightness: Brightness.dark,
                primarySwatch: themeColor,
              ),
              home: HomePage(),
            );
          },
        );
      }),
    );
  }
}


MaterialColor? getThemeColor(String? condition) {
  if(condition == null){
    return Colors.green;
  }
  switch (condition.toLowerCase()) {
    case 'sunny':
      return Colors.cyan;
    case 'partly cloudy':
    case 'cloudy':
      return Colors.blue;
    case 'overcast':
    case 'mist':
      return Colors.grey;
    case 'patchy rain possible':
    case 'patchy snow possible':
    case 'patchy sleet possible':
    case 'patchy freezing drizzle possible':
      return Colors.lightBlue;
    case 'thundery outbreaks possible':
      return Colors.amber;
    case 'blowing snow':
    case 'blizzard':
      return Colors.purple;
    case 'fog':
    case 'freezing fog':
      return Colors.grey;
    case 'patchy light drizzle':
    case 'light drizzle':
    case 'freezing drizzle':
    case 'heavy freezing drizzle':
      return Colors.lightBlue;
    case 'patchy light rain':
    case 'light rain':
    case 'moderate rain at times':
    case 'moderate rain':
    case 'heavy rain at times':
    case 'heavy rain':
      return Colors.lightBlue;
    case 'light freezing rain':
    case 'moderate or heavy freezing rain':
    case 'light sleet':
    case 'moderate or heavy sleet':
      return Colors.lightBlue;
    case 'patchy light snow':
    case 'light snow':
    case 'patchy moderate snow':
    case 'moderate snow':
    case 'patchy heavy snow':
    case 'heavy snow':
      return Colors.blueGrey;
    case 'ice pellets':
      return Colors.grey;
    case 'light rain shower':
    case 'moderate or heavy rain shower':
    case 'torrential rain shower':
      return Colors.lightBlue;
    case 'light sleet showers':
    case 'moderate or heavy sleet showers':
      return Colors.purple;
    case 'light snow showers':
    case 'moderate or heavy snow showers':
      return Colors.blueGrey;
    case 'light showers of ice pellets':
    case 'moderate or heavy showers of ice pellets':
      return Colors.grey;
    case 'patchy light rain with thunder':
    case 'moderate or heavy rain with thunder':
    case 'patchy light snow with thunder':
    case 'moderate or heavy snow with thunder':
      return Colors.amber;
    default:
      return Colors.green;
  }
}
