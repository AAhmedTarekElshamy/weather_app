

import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubt/get_weather_cubit.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/weather_service.dart';
class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('search now',style: TextStyle(color: Colors.black),),
      ),
      body:
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Center(
            child: TextField(
              onSubmitted: (value){
                var getWeatherCubit = BlocProvider.of< GetForcastWeatherCubit>(context);
                getWeatherCubit.getForecastWeather(cityName: value);
                Navigator.pop(context);
              },
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 30,horizontal: 16),
                labelText: 'search',
                suffixIconColor: Colors.blue,
                suffixIcon: Icon(Icons.search),
                hintText: 'Enter city name ',
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.deepOrange),
                ),

              ),
            ),
          ),
        )

    );
  }
}
