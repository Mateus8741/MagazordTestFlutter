import 'package:flutter/material.dart';
import 'package:magazordtestf/modules/shared/widgets/logo.dart';

import '../../shared/api/weather_manager.dart';
import '../../shared/model/weather.dart';
import '../../shared/widgets/text_field.dart';
import '../widgets/alert_weater.dart';
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
  final WeatherManager _weatherManager = WeatherManager();
  String textValue = '';
  String name = '';
  String region = '';
  String imageUrl = '';
  String celcius = '';
  String windMph = '';
  String waterDrop = '';
  String clouds = '';

  Future<void> fetchWeatherDataAndUpdateUI(String value) async {
    WeatherData? weatherData = await _weatherManager.fetchWeatherData(value);

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
                        imageUrl: imageUrl,
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
