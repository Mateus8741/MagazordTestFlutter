import 'package:flutter/material.dart';
import 'package:magazordtestf/modules/shared/api/weather_state.dart';
import 'package:magazordtestf/modules/shared/widgets/logo.dart';
import 'package:provider/provider.dart';

import '../../shared/widgets/text_field.dart';
import '../widgets/footer_info.dart';
import '../widgets/locale.dart';
import '../widgets/weather_info.dart';

void main() {
  runApp(const MaterialApp(
    home: WeatherHome(),
  ));
}

class WeatherHome extends StatelessWidget {
  const WeatherHome({Key? key}) : super(key: key);

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
                      Provider.of<WeatherState>(context, listen: false)
                          .fetchWeatherDataAndUpdateUI(value, context);
                    },
                  ),
                ),
                if (Provider.of<WeatherState>(context).name.isEmpty)
                  const Text(
                    'Nenhuma busca feita...',
                    style: TextStyle(fontSize: 20),
                  ),
                if (Provider.of<WeatherState>(context).name.isNotEmpty)
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      LocaleWeather(
                          name: Provider.of<WeatherState>(context).name,
                          region: Provider.of<WeatherState>(context).region),
                    ],
                  ),
                const SizedBox(height: 40),
                if (Provider.of<WeatherState>(context).name.isNotEmpty)
                  Column(
                    children: [
                      WeatherInfo(
                        imageUrl: Provider.of<WeatherState>(context).imageUrl,
                        celcius: Provider.of<WeatherState>(context).celcius,
                      ),
                    ],
                  ),
                if (Provider.of<WeatherState>(context).name.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(top: 50, bottom: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FooterInfo(
                            textVar:
                                '${Provider.of<WeatherState>(context).windMph} km/h',
                            iconVar: Icons.wind_power),
                        const SizedBox(width: 20),
                        FooterInfo(
                            textVar:
                                '${Provider.of<WeatherState>(context).waterDrop}'
                                '%',
                            iconVar: Icons.water_drop),
                        const SizedBox(width: 20),
                        FooterInfo(
                            textVar:
                                '${Provider.of<WeatherState>(context).clouds}'
                                '%',
                            iconVar: Icons.cloud),
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
