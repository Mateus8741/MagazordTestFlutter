import 'package:flutter/material.dart';
import 'package:magazordtestf/modules/shared/api/weather_manager.dart';
import 'package:magazordtestf/modules/shared/model/weather.dart';

import '../../weather_app/widgets/alert_weater.dart';

class WeatherState extends ChangeNotifier {
  final WeatherManager _weatherManager = WeatherManager();
  late String textValue = '';
  late String name = '';
  late String region = '';
  late String imageUrl = '';
  late String celcius = '';
  late String windMph = '';
  late String waterDrop = '';
  late String clouds = '';

  Future<void> fetchWeatherDataAndUpdateUI(
      String value, BuildContext context) async {
    WeatherData? weatherData = await _weatherManager.fetchWeatherData(value);

    if (weatherData != null) {
      textValue = value;
      name = weatherData.location.name;
      region = weatherData.location.region;
      imageUrl = weatherData.current.condition.icon;
      celcius = weatherData.current.tempC.toString();
      windMph = weatherData.current.windMph.toString();
      waterDrop = weatherData.current.humidity.toString();
      clouds = weatherData.current.cloud.toString();
    } else {
      // ignore: use_build_context_synchronously
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return const AlertWeather(
            titleText: 'Erro',
            contentText: 'Cidade não encontrada!',
          );
        },
      );
    }
    notifyListeners();
  }
}
