import 'package:flutter/cupertino.dart';

class noWeatherBody extends StatefulWidget {
  const noWeatherBody({super.key});

  @override
  State<noWeatherBody> createState() => _noWeatherBodyState();
}

class _noWeatherBodyState extends State<noWeatherBody> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('there is no weather 🙄 start ',style: TextStyle(
            // fontWeight: FontWeight.bold,
            fontSize: 28,
          ),),
          Text(' searching now 🔍',style: TextStyle(
            fontSize: 28
          ),)
        ],
      ),
    );
  }
}
