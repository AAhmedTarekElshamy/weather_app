import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubt/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_weather_cubt/get_weather_states.dart';
import 'package:weather_app/main.dart';
import 'package:weather_app/screens/searchView.dart';
import 'package:weather_app/widgets/noWeatherBody.dart';
import 'package:weather_app/widgets/weather_info_body.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor:  getThemeColor( BlocProvider.of<GetForcastWeatherCubit>(context).weatherModel?.status),
        actions: [
          IconButton(onPressed:(){
            Navigator.push(context, MaterialPageRoute(builder: (context) => SearchView(),));
          }, icon: const Icon(Icons.search,color: Colors.white,size: 32,)),

        ],

        title: Text('weather App',style: TextStyle(
          fontSize:23,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),),
      ),
      body:  BlocBuilder<GetForcastWeatherCubit,WeatherState >(
        builder: (context,state){
          if( state is WeatherLoadedState ){
            return weatherInfoBody(weatherModel: state.weatherModel, ) ;
          } else if ( state is WeatherInitialState ){
            return noWeatherBody();
          }else  if ( state is WeatherFailureState ) {
            return Center(
              child: Text(state.errorMessage ,style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),),
            );
          }else {
            return Text('data');
          }
        },
      ),

    );
  }
}
