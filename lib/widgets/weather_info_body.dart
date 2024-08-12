import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubt/get_weather_cubit.dart';
import 'package:weather_app/main.dart';
import 'package:weather_app/models/weather_model.dart';

class weatherInfoBody extends StatelessWidget {
     weatherInfoBody({required this.weatherModel});


 final  WeatherModel weatherModel ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [
                getThemeColor(weatherModel.status)!  ,
                getThemeColor(weatherModel.status)![300]! ,
                getThemeColor(weatherModel.status)![100]! ,
              ],
          begin: Alignment.topCenter,
            end: Alignment.bottomCenter
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Center(
            child: Column(
              //  mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                 weatherModel!.cityName,
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                 'updated at ${weatherModel?.refreshTime.hour}:${weatherModel?.refreshTime.minute}' ,
                  style: TextStyle(
                    fontSize: 22,
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Row(
                  children: [
                    Container(
                        height: 100,
                        width: 100,
                        child: Image.network(

                        'https:${weatherModel?.image?.substring(0, (weatherModel?.image!.length)! - 0)}' ??  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRE9g5pA9Nw6Jz4VdTYW7vwVjS6pNOG5A3HbXR11b795FF_FpvyViH-k_t4jPaQmt6oe1c&usqp=CAU',
                             fit:BoxFit.fill ,
                          // loadingBuilder: (context,child,progress){
                          //     return progress ==null?child:LinearProgressIndicator(); },

                         )),
                    Spacer(
                      flex: 1,
                    ),
                    Text(
                      weatherModel!.temp.round().toString(),
                      style: TextStyle(
                        fontSize: 28,
                      ),
                    ),
                    Spacer(
                      flex: 1,
                    ),
                    Column(
                      children: [
                        Text('maxTemp : ${ weatherModel!.maxTemp.round()}'),
                        Text('minTemp :${ weatherModel!.minTemp.round()}'),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 40,
                ),
                Text(
                  '${ weatherModel!.status}',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
DateTime StringToDateTime({required String value}){
return DateTime.parse(value);
}