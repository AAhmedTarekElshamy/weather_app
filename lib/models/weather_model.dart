class WeatherModel {
  final String cityName;
  final DateTime refreshTime;
  final String? image;
  final double temp;
  final double maxTemp;
  final double minTemp;
  final String status;

  WeatherModel(
      {required this.cityName,
      required this.refreshTime,
      this.image,
      required this.temp,
      required this.maxTemp,
      required this.minTemp,
      required this.status});

  factory WeatherModel.fromJson(Map json) {
    final forcast = json["forecast"]["forecastday"][0]["day"];
    return WeatherModel(
        cityName: json["location"]["name"],
        maxTemp: forcast["maxtemp_c"],
        minTemp: forcast["mintemp_c"],
        refreshTime:DateTime.parse(json["current"]["last_updated"]) ,
        status: forcast["condition"]['text'],
        temp: forcast['avgtemp_c'],
        image: json["current"]["condition"]["icon"]);
  }
}
