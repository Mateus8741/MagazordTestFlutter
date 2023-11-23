import 'package:flutter/material.dart';
import 'package:magazordtestf/modules/shared/widgets/text_field.dart';
import 'package:magazordtestf/modules/weather_app/widgets/footer_info.dart';
import 'package:magazordtestf/modules/weather_app/widgets/locale.dart';

import '../../shared/widgets/logo.dart';
import '../widgets/weather_info.dart';

class WeatherHome extends StatelessWidget {
  const WeatherHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const LogoComponent(
          firstPartText: 'Weather',
          colorLogo: Colors.orange,
        ),
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
                      print(value);
                    },
                  ),
                ),
                const Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    LocaleWeather(name: 'São Paulo', region: 'SP'),
                  ],
                ),
                const SizedBox(height: 40),
                const Column(
                  children: [
                    WeatherInfo(
                        celcius: '20',
                        weatherType: 'Snowy',
                        imageUrl:
                            '//cdn.weatherapi.com/weather/64x64/night/116.png'),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 50, bottom: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FooterInfo(
                          textVar: '11.2 km/h', iconVar: Icons.wind_power),
                      SizedBox(width: 20),
                      FooterInfo(textVar: '18%', iconVar: Icons.water_drop),
                      SizedBox(width: 20),
                      FooterInfo(textVar: '5%', iconVar: Icons.wb_cloudy),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
