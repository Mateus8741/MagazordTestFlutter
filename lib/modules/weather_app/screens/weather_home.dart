import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:magazordtestf/modules/shared/widgets/logo.dart';

import '../../shared/model/weather.dart';
import '../../shared/widgets/text_field.dart';
import '../widgets/footer_info.dart';
import '../widgets/locale.dart';
import '../widgets/weather_info.dart';

void main() {
  runApp(const MaterialApp(
    home: WeatherHome(),
  ));
}

class WeatherHome extends StatefulWidget {
  const WeatherHome({Key? key}) : super(key: key);

  @override
  _WeatherHomeState createState() => _WeatherHomeState();
}

class _WeatherHomeState extends State<WeatherHome> {
  String textValue = '';
  String name = '';
  String region = '';
  String imageUrl = '';
  String celcius = '';
  String windMph = '';
  String waterDrop = '';
  String clouds = '';

  Future<WeatherData?> fetchWeatherData(String value) async {
    try {
      const String apiKey = 'f08e87ef7605415fbf9233029232111';
      final String apiUrl =
          'https://api.weatherapi.com/v1/current.json?key=$apiKey&q=$value';

      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        final Map<String, dynamic> json = jsonDecode(response.body);
        return WeatherData.fromJson(json);
      } else {
        // ignore: use_build_context_synchronously
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text('Tente novamente',
                    style: TextStyle(color: Colors.red),
                    textAlign: TextAlign.center),
                content: const Text(
                  'Não foi possível obter os dados do clima',
                  style: TextStyle(color: Colors.red),
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('Ok'),
                  )
                ],
              );
            });
      }
    } catch (error) {
      print('Erro: $error');
      return null;
    }
    return null;
  }

  Future<void> fetchWeatherDataAndUpdateUI(String value) async {
    WeatherData? weatherData = await fetchWeatherData(value);

    if (weatherData != null) {
      setState(() {
        textValue = value;
        name = weatherData.location.name;
        region = weatherData.location.region;
        imageUrl = weatherData.current.condition.icon;
        celcius = weatherData.current.tempC.toString();
        windMph = weatherData.current.windMph.toString();
        waterDrop = weatherData.current.humidity.toString();
        clouds = weatherData.current.cloud.toString();
      });
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const LogoComponent(
            firstPartText: 'Weather', colorLogo: Colors.orange),
      ),
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                  child: GlobalInputField(
                    buttonColor: Colors.orange,
                    onAddItem: (String value) {
                      fetchWeatherDataAndUpdateUI(value);
                    },
                  ),
                ),
                if (!name.isNotEmpty)
                  const Text(
                    'Nenhuma busca feita...',
                    style: TextStyle(fontSize: 20),
                  ),
                if (name.isNotEmpty)
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      LocaleWeather(name: name, region: region),
                    ],
                  ),
                const SizedBox(height: 40),
                if (name.isNotEmpty)
                  Column(
                    children: [
                      WeatherInfo(
                        celcius: celcius,
                        imageUrl:
                            '//cdn.weatherapi.com/weather/64x64/night/116.png',
                      ),
                    ],
                  ),
                if (name.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(top: 50, bottom: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FooterInfo(
                            textVar: '$windMph km/h',
                            iconVar: Icons.wind_power),
                        const SizedBox(width: 20),
                        FooterInfo(
                            textVar: '$waterDrop%', iconVar: Icons.water_drop),
                        const SizedBox(width: 20),
                        FooterInfo(
                            textVar: '$clouds%', iconVar: Icons.wb_cloudy),
                      ],
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
